import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

@WebServlet("/register")
public class Register extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doGet(req, res);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String name = req.getParameter("name");
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirm-password");

        // Validate password and confirm password
        if (password == null || !password.equals(confirmPassword)) {
            req.setAttribute("errorMessage", "Passwords do not match.");
            RequestDispatcher rd = req.getRequestDispatcher("/Register.jsp");
            rd.forward(req, res);
            return;
        }

        // Set content type
        res.setContentType("text/html");

        // Initialize connection and prepared statement
        try (Connection con = DbConnection.getCon();
             PreparedStatement ps = con.prepareStatement("INSERT INTO userdata (name, username, email, password) VALUES (?, ?, ?, ?)")) {

            ps.setString(1, name);
            ps.setString(2, username);
            ps.setString(3, email);
            ps.setString(4, password);
            ps.executeUpdate();

            // Registration successful, forward to a confirmation page with a success message
            req.setAttribute("successMessage", "Registration successful!  <a href='login.jsp'>login</a>.");
            RequestDispatcher rd = req.getRequestDispatcher("/Register.jsp");
            rd.forward(req, res);

        } catch (SQLIntegrityConstraintViolationException e) {
            // Handle case where username or email already exists
            req.setAttribute("errorMessage", "Username or email already exists. Try another one.");
            RequestDispatcher rd = req.getRequestDispatcher("/Register.jsp");
            rd.forward(req, res);
        } catch (SQLException e) {
            // Handle other SQL exceptions
            e.printStackTrace();
            req.setAttribute("errorMessage", "Error occurred while processing your request.");
            RequestDispatcher rd = req.getRequestDispatcher("/Register.jsp");
            rd.forward(req, res);
        }
    }
}

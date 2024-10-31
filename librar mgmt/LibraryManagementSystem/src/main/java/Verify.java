import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class Verify
 */
@WebServlet("/verify")
public class Verify extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // Set content type before getting PrintWriter
        res.setContentType("text/html");
        HttpSession session = req.getSession();
        // Retrieve parameters from request
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        // Initialize connection and prepared statement
        try (Connection con = DbConnection.getCon();
             PreparedStatement ps = con.prepareStatement("SELECT password FROM userdata WHERE username=?")) {

            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String dbPassword = rs.getString("password");

                    if (dbPassword.equals(password)) {
                        // Login successful, forward to home page
                        session.setAttribute("username", username); // Set session attribute
                        RequestDispatcher rd = req.getRequestDispatcher("/studentpage.jsp");
                        rd.forward(req, res);
                        return; // Exit the method to prevent further processing
                    } else {
                        // Password does not match
                        session.setAttribute("errorMessage", "Invalid password.");
                        RequestDispatcher rd = req.getRequestDispatcher("/login.jsp");
                        rd.forward(req, res);
                        return;
                    }
                } else {
                    // Username not found
                    session.setAttribute("errorMessage", "Username not found.");
                    RequestDispatcher rd = req.getRequestDispatcher("/login.jsp");
                    rd.forward(req, res);
                    return;
                }
            } catch (SQLException e) {
                e.printStackTrace();
                session.setAttribute("errorMessage", "Error while executing the query.");
                RequestDispatcher rd = req.getRequestDispatcher("/login.jsp");
                rd.forward(req, res);
                return;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "Database connection error.");
            RequestDispatcher rd = req.getRequestDispatcher("/login.jsp");
            rd.forward(req, res);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    	String username = req.getParameter("username");
    	String password =req.getParameter("password");
    	HttpSession session = req.getSession();
    	if(username.equals("admin") && password.equals("root")) {
    		
    		session.removeAttribute(username);
    		session.setAttribute("username", username); // Set session attribute
            RequestDispatcher rd = req.getRequestDispatcher("/adminpage.jsp");
            rd.forward(req, res);
            return; 
    	}
    	else {
    		session.setAttribute("errorMessage", "Invalid UserName / password.");
            RequestDispatcher rd = req.getRequestDispatcher("/adminlogin.jsp");
            rd.forward(req, res);
            return;
    	}
    }
}

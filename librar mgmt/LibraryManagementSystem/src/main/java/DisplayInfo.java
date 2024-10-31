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
import java.sql.Statement;

@WebServlet("/DisplayInfo")
public class DisplayInfo extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Connection con = DbConnection.getCon();
        String studentRequest = req.getParameter("srequest");

        try {
            if (studentRequest.equals("book")) {
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select* from bookinfo;");
                session.setAttribute("resultSet", rs);
                session.setAttribute("srequest", "book");
                req.getRequestDispatcher("/studentpage.jsp").forward(req, res);
                closeResources(st, rs);
            } else if (studentRequest.equals("takebook")) {
                session.setAttribute("srequest", "takebook");
                req.getRequestDispatcher("/studentpage.jsp").forward(req, res);
            } else if (studentRequest.equals("returnbook")) {
                session.setAttribute("srequest", "returnbook");
                req.getRequestDispatcher("/studentpage.jsp").forward(req, res);
            } else if (studentRequest.equals("checkreturns")) {
                PreparedStatement ps = con.prepareStatement("select* from bookissue where returndate is null and username=?;");
                ps.setString(1, (String) session.getAttribute("username"));
                ResultSet rs = ps.executeQuery();
                session.setAttribute("resultSet", rs);
                session.setAttribute("srequest", "checkreturns");
                req.getRequestDispatcher("/studentpage.jsp").forward(req, res);
                closeResources(ps, rs);
            } else if (studentRequest.equals("myaccount")) {
                String username = (String) session.getAttribute("username");

                PreparedStatement ps1 = con.prepareStatement("select name, username, email from userdata where username=?");
                ps1.setString(1, username);
                ResultSet rs1 = ps1.executeQuery();
                session.setAttribute("resultset1", rs1);

                PreparedStatement ps2 = con.prepareStatement("select* from bookissue where returndate is null and username=?;");
                ps2.setString(1, username);
                ResultSet rs2 = ps2.executeQuery();
                session.setAttribute("resultset2", rs2);

                PreparedStatement ps3 = con.prepareStatement("select* from bookissue where returndate is not null and username=?;");
                ps3.setString(1, username);
                ResultSet rs3 = ps3.executeQuery();
                session.setAttribute("resultset3", rs3);

                session.setAttribute("srequest", "myaccount");
                req.getRequestDispatcher("/studentpage.jsp").forward(req, res);

                closeResources(ps1, rs1);
                closeResources(ps2, rs2);
                closeResources(ps3, rs3);
            }
            else {
                session.setAttribute("srequest", "dash");
                req.getRequestDispatcher("/studentpage.jsp").forward(req, res);
                }
        } catch (SQLException e) {
            session.setAttribute("errormessage", "error occurred");
            req.getRequestDispatcher("/studentpage.jsp").forward(req, res);
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doGet(req, res);
    }

    private void closeResources(Statement st, ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (st != null) {
            try {
                st.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private void closeResources(PreparedStatement ps, ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (ps != null) {
            try {
                ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

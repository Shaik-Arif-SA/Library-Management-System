import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLIntegrityConstraintViolationException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UpdateUser extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=req.getSession();
		session.removeAttribute("SuccessMessage");
		session.removeAttribute("ErrorMessage");
		
		try {
			Connection con=DbConnection.getCon();
			PreparedStatement ps=con.prepareStatement("update userdata set name=?, email=?, password=? where username=?");
			ps.setString(1, req.getParameter("name"));
			ps.setString(2, req.getParameter("email"));
			ps.setString(3, req.getParameter("password"));
			ps.setString(4, req.getParameter("username"));
			int count=ps.executeUpdate();
			session.setAttribute("arequest", "update");
		
			if(count>0) {
				session.setAttribute("SuccessMessage", "Data updates Successfully");
				req.getRequestDispatcher("adminpage.jsp").forward(req, res);
			}
			else {
				session.setAttribute("ErrorMessage", "user Id does not exist");
				req.getRequestDispatcher("adminpage.jsp").forward(req, res);
				
			}
		}
		 catch (SQLIntegrityConstraintViolationException e) {
	            // Handle case where username or email already exists
	            session.setAttribute("ErrorMessage", "email already exists. Try another one.");
	            req.getRequestDispatcher("/adminpage.jsp").forward(req, res);
	            
		 }
		catch (Exception e) {
			// TODO: handle exception
			session.setAttribute("ErrorMessage", "Exception raised...!"+e);
			req.getRequestDispatcher("adminpage.jsp").forward(req, res);
		}
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}

}

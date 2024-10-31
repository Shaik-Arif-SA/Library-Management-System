
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class BookIssue extends HttpServlet{
@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, res);
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		session.removeAttribute("SuccessMessage");
		session.removeAttribute("ErrorMessage");
		 String username = (String) session.getAttribute("username");
		try {
			Connection con=DbConnection.getCon();
			PreparedStatement ps1=con.prepareStatement("select* from bookinfo where id=?");
			String id= req.getParameter("bookid");
			
           
          	ps1.setString(1, id);
          	
			ResultSet rs=ps1.executeQuery();
			if(rs.next()) {
				PreparedStatement ps = con.prepareStatement("INSERT INTO bookissue (username, bookid, issuedate) VALUES (?, ?, ?)");
	            LocalDate currentDate = LocalDate.now();
	            java.sql.Date sqlDate = Date.valueOf(currentDate); // Convert LocalDate to java.sql.Date

	            // Set parameters
	            if(username.equalsIgnoreCase("admin"))
	            	ps.setString(1, req.getParameter("username"));
	            
	            else
	            	ps.setString(1,username);
	            ps.setString(2, id);
	            ps.setDate(3, sqlDate);
	            ps.executeUpdate();
	            session.setAttribute("SuccessMessage", "Book Issued..");
	            if(username.equalsIgnoreCase("admin"))
	            	req.getRequestDispatcher("adminpage.jsp").forward(req, res);
	            
	            else
	            	req.getRequestDispatcher("studentpage.jsp").forward(req, res);
			}
			else {
				 session.setAttribute("ErrorMessage", "Book is not available.");
				 session.setAttribute("srequest", "takebook");
				 if(username.equalsIgnoreCase("admin"))
		            	req.getRequestDispatcher("adminpage.jsp").forward(req, res);
		            
		            else
		            	req.getRequestDispatcher("studentpage.jsp").forward(req, res);
		        
				}
		
		}
		catch(Exception e) {
			session.setAttribute("ErrorMessage", "Error occured while accessing.."+e);
			 if(username.equalsIgnoreCase("admin"))
	            	req.getRequestDispatcher("adminpage.jsp").forward(req, res);
	            
	            else
	            	
	         req.getRequestDispatcher("studentpage.jsp").forward(req, res);
		}
	}

}

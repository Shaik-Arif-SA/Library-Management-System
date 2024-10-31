

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;

/**
 * Servlet implementation class ReturnBook
 */
public class ReturnBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		session.removeAttribute("SuccessMessage");
		session.removeAttribute("ErrorMessage");
	
			try {
		
				Connection con=DbConnection.getCon();
				PreparedStatement ps1=con.prepareStatement("select* from bookissue where bookid=? and username=?");
				String id= req.getParameter("bookid");
				String username=(String) session.getAttribute("username");

				ps1.setString(1, id);
				ps1.setString(2, username);
				ResultSet rs=ps1.executeQuery();
		
				if(rs.next()) {
				
					PreparedStatement ps = con.prepareStatement("update bookissue set returndate=? where bookid=? and username=?");
		            LocalDate currentDate = LocalDate.now();
		            java.sql.Date sqlDate = Date.valueOf(currentDate); // Convert LocalDate to java.sql.Date
		            
		            // Set parameters
		            ps.setDate(1, sqlDate);
		            ps.setString(2, id);
					ps.setString(3, username);
		           
		            ps.executeUpdate();
		           
		           
		            session.setAttribute("srequest", "returnbook");
		            session.setAttribute("SuccessMessage", "Book Returned..");
		            req.getRequestDispatcher("studentpage.jsp").forward(req, res);
				}
				else {
					
					 session.setAttribute("ErrorMessage", "you did not take this book.");
					 session.setAttribute("srequest", "returnbook");
			         req.getRequestDispatcher("studentpage.jsp").forward(req, res);
			         
			        
					}
			
			}
			catch(Exception e) {
				session.setAttribute("ErrorMessage", "Error occured while accessing..");
				System.out.println(e);
				session.setAttribute("srequest", "returnbook");
		         req.getRequestDispatcher("studentpage.jsp").forward(req, res);
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

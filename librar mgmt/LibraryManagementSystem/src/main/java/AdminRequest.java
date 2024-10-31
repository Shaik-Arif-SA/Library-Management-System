import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mysql.cj.protocol.Resultset;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AdminRequest extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
	
		    HttpSession session=req.getSession();
	        Connection con = DbConnection.getCon();
	        String AdminReq = req.getParameter("arequest");

	        try {
	            if (AdminReq.equals("book")) {
	                Statement st = con.createStatement();
	                ResultSet rs = st.executeQuery("select* from bookinfo;");
	                session.setAttribute("resultSet", rs);
	                session.setAttribute("arequest", "book");
	                req.getRequestDispatcher("/adminpage.jsp").forward(req, res);
	            }
	            else if(AdminReq.equals("issuebook")) {
	            	session.setAttribute("arequest", "issuebook");
	                req.getRequestDispatcher("/adminpage.jsp").forward(req, res);
	            }
	            else if(AdminReq.equals("addbook")) {
	            	session.setAttribute("arequest", "addbook");
	                req.getRequestDispatcher("/adminpage.jsp").forward(req, res);
	            }
	            else if (AdminReq.equals("logs")) {

	                PreparedStatement ps2 = con.prepareStatement("select* from bookissue where returndate is null ");
	                ResultSet rs2 = ps2.executeQuery();
	                session.setAttribute("resultset2", rs2);

	                PreparedStatement ps3 = con.prepareStatement("select* from bookissue where returndate is not null");
	                ResultSet rs3 = ps3.executeQuery();
	                session.setAttribute("resultset3", rs3);

	                session.setAttribute("arequest", "logs");
	                req.getRequestDispatcher("/adminpage.jsp").forward(req, res);

	            }
	            else if(AdminReq.equals("allusers")) {
	            	Statement st=con.createStatement();
	            	ResultSet rs=st.executeQuery("select* from userdata;");
	            	session.setAttribute("resultset", rs);
	            	session.setAttribute("arequest", "allusers");
	                req.getRequestDispatcher("/adminpage.jsp").forward(req, res);
	            	
	            }
	            else if(AdminReq.equals("update")) {
	            	session.setAttribute("arequest", "update");
	                req.getRequestDispatcher("/adminpage.jsp").forward(req, res);
	            }
	            else {
	            	session.setAttribute("arequest", "dash");
	                req.getRequestDispatcher("/adminpage.jsp").forward(req, res);
	            }
	           
	            
	        }
	            catch (Exception e) {
					// TODO: handle exception
				}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}

    

}



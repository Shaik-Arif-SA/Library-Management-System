import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AddBook extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=req.getSession();
		try {
			Connection con=DbConnection.getCon();
			PreparedStatement ps1=con.prepareStatement("select* from bookinfo where id=?;");
			ps1.setString(1, req.getParameter("bookid"));
			ResultSet rs=ps1.executeQuery();
			if(rs.next()) {
				session.setAttribute("ErrorMessage", "Book with id already exist..");
				req.getRequestDispatcher("adminpage.jsp").forward(req, res);
			}
			else {
				PreparedStatement ps=con.prepareStatement("insert into bookinfo values (?,?,?,?);");
				ps.setString(1, req.getParameter("bookid"));
				ps.setString(2, req.getParameter("name"));
				ps.setString(3, req.getParameter("edision"));
				ps.setString(4, req.getParameter("price"));
				ps.executeUpdate();
				session.setAttribute("SuccessMessage", "Book added successfully..");
				req.getRequestDispatcher("adminpage.jsp").forward(req, res);
			}
		}catch(Exception e) {
			session.setAttribute("ErrorMessage", "Exception raised..");
			req.getRequestDispatcher("adminpage.jsp").forward(req, res);
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
}

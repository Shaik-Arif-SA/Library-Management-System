import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {
	 static{
	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	        } catch (ClassNotFoundException e) {
	            System.out.println("MySQL JDBC driver not found.");
	        }
	    }
	    public static Connection con;
	    public static Connection getCon(){
	        try{
	           con= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/lms","root","root");
	        }
	        catch (SQLException sq){
	            System.out.println("Connection failed...");
	        }
	        return con;
	    }
}

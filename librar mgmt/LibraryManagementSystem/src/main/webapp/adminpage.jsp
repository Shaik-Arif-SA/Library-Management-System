<%@ page import="java.sql.ResultSet, java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="jakarta.servlet.jsp.JspWriter" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Library</title>
    <link rel="stylesheet" href="studentpage.css">
    <link rel="icon" href="https://icon-library.com/images/library-icon-png/library-icon-png-28.jpg" type="image/icon type">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <header style="background: linear-gradient(135deg, #000e22 , #112c53, #5f2975 ,#140236);">
        <div class="hcontainer">
            <div class="logo">
                <img src="https://logopond.com/logos/ec1ab766e91dae725febee6cfdcde86c.png" alt="LMS Logo">
                <center><h1>Library Management System</h1></center>
            </div>
            <nav>
                <ul>
                    <li><a href="home.jsp" class="hbtn">Home</a></li>
                    <li><a href="#contact" class="hbtn">Help</a></li>  
                    <li><a href="#contact" class="hbtn">Contact</a></li>
                    <li><a href="" class="hbtn"><c:if test="${not empty username}">
      								  <p style="color: white;">${username}</p>
					            </c:if></a></li>
                </ul>
            </nav>
        </div>
        
    </header>

    <div class="container2">
        <div class="sidebar">
            
            <a href="AdminRequest?arequest=dash" style="color:black">  <h2>Dashboard</h2></a> 
            <a href="AdminRequest?arequest=book" class="button-with-icon">
                <i class="fas fa-book"></i>
                <span>Check Books</span>
            </a>
            <a href="AdminRequest?arequest=issuebook" class="button-with-icon">
                <i class="fas fa-book"></i>
                <span>Issue Book</span>
            </a>
            <a href="AdminRequest?arequest=addbook" class="button-with-icon">
                <i class="fas fa-history"></i>
                <span>Add new Book</span>
            </a>
            <a href="AdminRequest?arequest=update" class="button-with-icon">
                <i class="fas fa-history"></i>
                <span>update studentInfo</span>
            </a>
             <a href="AdminRequest?arequest=allusers" class="button-with-icon">
                <i class="fas fa-history"></i>
                <span>Check all User details</span>
            </a>
            <a href="AdminRequest?arequest=logs" class="button-with-icon">
                <i class="fas fa-sign-in-alt"></i>
                <span>check logs</span>
            </a>
            <a href="Logout" class="button-with-icon">
                <i class="fas fa-sign-out-alt"></i>
                <span>Logout</span>
            </a>
        </div>

        <div class="main-content">
             <% 
			       String arequest = (String) session.getAttribute("arequest");
			    
			   	 	if ("book".equals(arequest)) {
			  %>
			        	
					   	<table>
					   	    <h1> Available Book details</h1>
					       
					            <tr>
					                <th>ID</th>
					                <th>Title</th>
					                <th>Edision</th>
					                <th>price</th>
					            </tr>
					       
					        
					            <% 
					                ResultSet rs = (ResultSet) session.getAttribute("resultSet");
					                if (rs != null) {
					                    try {
					                        while (rs.next()) {
					            %>
					                <tr>
					                    <td><%= rs.getString("id") %></td>
					                    <td><%= rs.getString("name") %></td>
					                    <td><%= rs.getString("edision") %></td>
					                    <td><%= rs.getFloat("price") %></td>
					                </tr>
					            <% 
					                        }
					                    } catch (SQLException e) {
					                        out.println("Error processing result set.");
					                    }
					                } else {
					            %>
					                <tr>
					                    <td colspan="4">No data available</td>
					                </tr>
					            <% 
					                }
					            %>
					        
					    </table>
			 
			 
			  <% 
			   	 	}
		    
			   	 	else if ("issuebook".equals(arequest)) {
		     %>
		               <div class="formbody">
		                	<div class="info-container">
		                	   <c:if test="${not empty ErrorMessage}">
      								  <p style="color: red;">${ErrorMessage}</p>
					            </c:if>
					            <c:if test="${not empty SuccessMessage}">
      								  <p style="color: green;">${SuccessMessage}</p>
					            </c:if>
					            <div class="error-message" id="error-message"></div>
					    
					            To check available books 
					            <a href="AdminRequest?arequest=book" class="available-books-link">Click here</a>
						      </div>  
					    <div class="issueform">
					          
					        <form action="/lms/BookIssue" method="get">
					            <h2 class="bookissueheader">BOOK ISSUE FORM</h2><br>
					            <input class="issueforminputs" name="username" type="text" placeholder="username" required>
					            <input class="issueforminputs" name="bookid" type="text" placeholder="Book Id" required>
					            <div class="message">Return the book within 10 days to avoid fine</div>
					            <input type="submit" value="Take Book" class="issueformbtn">
					        </form>
					    </div>
					  </div>
			 
			 
			 <% 
			   	 	}
		    
			   	 	else if ("addbook".equals(arequest)) {
		     %>
		               <div class="formbody">
		                	<div class="info-container">
		                	   <c:if test="${not empty ErrorMessage}">
      								  <p style="color: red;">${ErrorMessage}</p>
					            </c:if>
					            <c:if test="${not empty SuccessMessage}">
      								  <p style="color: green;">${SuccessMessage}</p>
					            </c:if>
					            <div class="error-message" id="error-message"></div>
					    
					            To check available books 
					            <a href="AdminRequest?arequest=book" class="available-books-link">Click here</a>
						      </div>  
					    <div class="issueform">
					          
					        <form action="/lms/AddBook" method="get">
					            <h2 class="bookissueheader">Add New Book</h2><br>
					            <input class="issueforminputs" name="bookid" type="text" placeholder="Book Id" required>
					            <input class="issueforminputs" name="name" type="text" placeholder="Book Name" required>
					            <input class="issueforminputs" name="edision" type="text" placeholder="Edision" required>
					            <input class="issueforminputs" name="price" type="text" placeholder="Price" required>
					            <div class="message"></div>
					            <input type="submit" value="ADD" class="issueformbtn">
					        </form>
					    </div>
					  </div>
					  
					  
					   
			<%
			    } else if("logs".equals(arequest)){
			    	
			    	ResultSet rs2 = (ResultSet) session.getAttribute("resultset2");
			    	ResultSet rs3 = (ResultSet) session.getAttribute("resultset3");
			    	
			    	
			%>
					
						<table>
					   	    <h1> Pending returns list</h1>
					        
					            <tr>
					                <th>UserName</th>
					                <th>BookId</th>
					                <th>IssueDate</th>
					                <th>Deadline</th>
					            </tr>
					        
					      
					            <% 
			    	
					                if (rs2 != null) {
					                	
					                    try {
					                        while (rs2.next()) {
					                        	
					            %>
					                <tr>
					                
					                    <td><%= rs2.getString("username") %></td>
					                    <td><%= rs2.getString("bookid") %></td>
					                    <td><%= rs2.getDate("issuedate") %></td>
					                    <td><%= rs2.getDate("deadline") %></td>
					                </tr>
					            <% 
					                        }
					                    } catch (SQLException e) {
					                        out.println("Error processing result set.");
					                    }
					                } else {
					            %>
					                <tr>
					                    <td colspan="4">No data available</td>
					                </td>
					            <% 
					                }
					            %>
					            
					     
					    </table>
					 <br>
					 	<table>
					   	    <h1> Log Book Records</h1>
				
					            <tr>
					                <th>UserName</th>
					                <th>BookId</th>
					                <th>IssueDate</th>
					                <th>ReturnDate</th>
					                <th>Deadline</th>
					            </tr>
					        
					       
					            <% 
 		
					            
					                if (rs3 != null) {
					                	
					                    try {
					                        while (rs3.next()) {
					                        	
					            %>
					                <tr>
					                
					                    <td><%= rs3.getString("username") %></td>
					                    <td><%= rs3.getString("bookid") %></td>
					                    <td><%= rs3.getDate("issuedate") %></td>
					                    <td><%= rs3.getDate("returndate") %></td>
					                    <td><%= rs3.getDate("deadline") %></td>
					                </tr>
					            <% 
					                        }
					                    } catch (SQLException e) {
					                        out.println("Error processing result set.");
					                    }
					                } else {
					            %>
					                <tr>
					                    <td colspan="4">No data available</td>
					                </td>
					            <% 
					                }
					            %>
					           
					      
					    </table>
					    
					    
					     
			 <% 
			   	 	}
		    
			   	 	else if ("update".equals(arequest)) {
		     %>
		               <div class="formbody">
		                	<div class="info-container">
		                	   <c:if test="${not empty ErrorMessage}">
      								  <p style="color: red;">${ErrorMessage}</p>
					            </c:if>
					            <c:if test="${not empty SuccessMessage}">
      								  <p style="color: green;">${SuccessMessage}</p>
					            </c:if>
					            <div class="error-message" id="error-message"></div>
					    
					            To check all user details 
					            <a href="AdminRequest?arequest=allusers" class="available-books-link">Click here</a>
						      </div>  
					    <div class="issueform">
					          
					        <form action="/lms/UpdateUser" method="get">
					            <h2 class="bookissueheader">Update User Data</h2><br>
					            <input class="issueforminputs" name="username" type="text" placeholder="user name" required>
					            <input class="issueforminputs" name="name" type="text" placeholder="updated / old name" required>
					            <input class="issueforminputs" name="email" type="text" placeholder="updated / old email" required>
					            <input class="issueforminputs" name="password" type="text" placeholder="updated password" required>
					            <div class="message"></div>
					            <input type="submit" value="UPDATE" class="issueformbtn">
					        </form>
					    </div>
					  </div>
					  
					  
					    		   
			<%
			    } else if("allusers".equals(arequest)){
			    	
			    	ResultSet rs = (ResultSet) session.getAttribute("resultset");
			    	
			    	
			%>
					
						<table>
					   	    <h1>All Users Details</h1>
					        
					            <tr>
					                <th>Name</th>
					                <th>User Name</th>
					                <th>Email</th>
					                <th>Password</th>
					            </tr>
					      
					     
					            <% 
			    	
					                if (rs != null) {
					                	
					                    try {
					                        while (rs.next()) {
					                        	
					            %>
					                <tr>
					                
					                    <td><%= rs.getString("name") %></td>
					                    <td><%= rs.getString("username") %></td>
					                    <td><%= rs.getString("email") %></td>
					                    <td><%= rs.getString("password") %></td>
					                </tr>
					            <% 
					                        }
					                    } catch (SQLException e) {
					                        out.println("Error processing result set.");
					                    }
					                } else {
					            %>
					                <tr>
					                    <td colspan="4">No data available</td>
					                </td>
					            <% 
					                }
					            %>
					      
					    </table>
			
			 
		      <% 
			   	 	}
		    
			   	 	else  {
		     %>
	   					<jsp:include page="default.jsp"></jsp:include>
			   <%
			   }
			 %>

            
        </div>
    </div>

    <footer id="contact" style="background: linear-gradient(135deg, #000e22 , #112c53, #5f2975 ,#140236);">
        <div class="container footer-container">
            <p>&copy; [Year] [Library]. All rights reserved.</p>
            <div class="social-media">
                <a href="#">Facebook</a>
                <a href="#">Twitter</a>
                <a href="#">Instagram</a>
            </div>
            <div class="contact">
                <p>Phone: (123) 456-7890</p>
                <p>Email: contact@libraryname.com</p>
                <p>Address: 123 Library Lane, City, Country</p>
            </div>
        </div>
    </footer>
</body>
</html>

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
            
            <a href="DisplayInfo?srequest=dash" style="color:black">  <h2>Dashboard</h2></a> 
            <a href="DisplayInfo?srequest=book" class="button-with-icon">
                <i class="fas fa-book"></i>
                <span>Check Books</span>
            </a>
            <a href="DisplayInfo?srequest=takebook" class="button-with-icon">
                <i class="fas fa-book"></i>
                <span>Take Books</span>
            </a>
            <a href="DisplayInfo?srequest=returnbook" class="button-with-icon">
                <i class="fas fa-history"></i>
                <span>Return Books</span>
            </a>
            <a href="DisplayInfo?srequest=myaccount" class="button-with-icon">
                <i class="fas fa-sign-in-alt"></i>
                <span>My Account</span>
            </a>
            <a href="Logout" class="button-with-icon">
                <i class="fas fa-sign-out-alt"></i>
                <span>Logout</span>
            </a>
        </div>

        <div class="main-content" background="https://media.istockphoto.com/id/643950510/photo/business-and-education-background.webp?b=1&s=170667a&w=0&k=20&c=J80b_2EyfGuu8-CQeQrfS4pUwfKCezWXrXWPvswYHyU=">
	          <% 
			       String srequest = (String) session.getAttribute("srequest");
			    
			   	 	if ("book".equals(srequest)) {
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
		    
			   	 	else if ("takebook".equals(srequest)) {
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
					            <a href="DisplayInfo?srequest=book" class="available-books-link">Click here</a>
						      </div>  
					    <div class="issueform">
					          
					        <form action="/lms/BookIssue" method="get">
					            <h2 class="bookissueheader">BOOK ISSUE FORM</h2><br>
					            <input class="issueforminputs" name="bookid" type="text" placeholder="Book Id" required>
					            <div class="message">Return the book within 10 days to avoid fine</div>
					            <input type="submit" value="Take Book" class="issueformbtn">
					        </form>
					    </div>
					  </div>
				 <% 
			   	 	}
		    
			   	 	else if ("returnbook".equals(srequest) ) {
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
					    
					            To check pending book submissions
					            <a href="DisplayInfo?srequest=checkreturns" class="available-books-link">Click Here</a>
					        </div>      
					        <div class="issueform">
					        
					         <form action="/lms/ReturnBook" method="get">
					            <h2 class="bookissueheader">BOOK RETURN FORM</h2>
					             <input class="issueforminputs" name="bookid" type="text" placeholder="Return Book Id" required >
					             <div class="message">"Thank you for returning the book! Remember, timely returns help others enjoy the books too."</div>
					             <input type="submit" value="Return Book" class="issueformbtn">
					         </form>
					     </div>
					  </div>
							 
	          <% 
			   	 	}
			    
			    else if ("checkreturns".equals(srequest)) {
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
					                ResultSet rs = (ResultSet) session.getAttribute("resultSet");
					           
					                if (rs != null) {
					                	
					                    try {
					                        while (rs.next()) {
					                        	
					            %>
					                <tr>
					                
					                    <td><%= rs.getString("username") %></td>
					                    <td><%= rs.getString("bookid") %></td>
					                    <td><%= rs.getDate("issuedate") %></td>
					                    <td><%= rs.getDate("deadline") %></td>
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
					            <tr>
					            	<td colspan="4">To Return Books<a href="DisplayInfo?srequest=returnbook"> Click here</a>
					            </tr>
					        
					    </table>
			 
			<%
			    } else if("myaccount".equals(srequest)){
			    	ResultSet rs1 = (ResultSet) session.getAttribute("resultset1");
			    	ResultSet rs2 = (ResultSet) session.getAttribute("resultset2");
			    	ResultSet rs3 = (ResultSet) session.getAttribute("resultset3");
			    	if(rs1 != null && rs1.next()){
			    	
			%>
					<center>
					     <h3>Name:<%=rs1.getString("name") %> <br></h3>
					    <h3> User Name:<%=rs1.getString("username") %> <br></h3>
					    <h3> Email:<%=rs1.getString("email") %> <br></h3>
					</center>
						<table>
					   	    <h1> Pending returns list</h1>
					       
					            <tr>
					                <th>UserName</th>
					                <th>BookId</th>
					                <th>IssueDate</th>
					                <th>Deadline</th>
					            </tr>
					      
					        
					            <% 
			    	}
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
					            <tr>
					            	<td colspan="4">To Return Books<a href="DisplayInfo?srequest=returnbook"> Click here</a>
					            </tr>
					        
					    </table>
					 <br>
					 	<table>
					   	    <h1> Book log Records</h1>
					        
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
			    	} else {
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

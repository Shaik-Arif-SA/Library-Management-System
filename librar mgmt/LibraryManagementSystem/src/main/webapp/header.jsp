<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style2.css">
    <title>Library Management System</title>
    <style>
    @charset "UTF-8";
body {
    font-family: Arial, sans-serif;
    margin: auto;
    padding: 0;
    background-color: #f4f4f4;
}

.hcontainer {
    width: 80%;
    margin: auto;
    overflow: hidden;
}

/* Header Styles */
header {
    background: linear-gradient(135deg, #000e22 , #112c53, #5f2975 ,#140236);
    color: #fff;
    padding: 10px;
    
    border-bottom: #77d94c 3px solid;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

header .logo {
    display: flex;
    align-items: center;
}

header .logo img {
    width: 80px;
    height: 80px;
    border-radius: 50%;
    margin-right: 15px;
}

header .hbtn {
    color: #fff;
    text-decoration: none;
    text-transform: uppercase;
    font-size: 16px;
}

header ul {
    padding: 0;
    list-style: none;
    display: flex;
}

header li {
    display: inline;
    padding: 0 20px;
    position: relative; /* Required for dropdown */
}
session-username {
	display:flex;
	align-items: flex-end;
	padding:0px;
	margin:0px
}

    
    </style>
</head>
<body>
 
    <header>
        <div class="hcontainer">
            <div class="logo">
                <img src="https://logopond.com/logos/ec1ab766e91dae725febee6cfdcde86c.png" alt="LMS Logo">
                <h1>Library Management System</h1>
            </div>
            <nav>
                <ul>
                    <li><a href="home.html" class="hbtn">Home</a></li>

                    <li><a href="login.jsp" class="hbtn">Student Login</a></li>
                    <li><a href="adminlogin.jsp" class="hbtn">Admin Login</a></li>
                    <li><a href="Register.jsp" class="hbtn">Register</a></li>

                                <li><a href="" class="hbtn"><c:if test="${not empty username}">
						  <p style="color: green;">${username}</p>
         </c:if></a></li>

                  
                    
                </ul>
            </nav>
        </div>
        
    </header>
   
</body>
</html>

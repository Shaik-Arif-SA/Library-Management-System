<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="style1.css">
    <style>
        body{
         background-image: url('https://t3.ftcdn.net/jpg/07/33/64/04/240_F_733640495_CzK3HMdjSStUetHvjydilz0IfAXB4n0W.jpg');
         background-size: cover;
	    background-position: center;
	    background-repeat: no-repeat;
	    height: 100vh;
        }
        .box {
    padding: 10px;
    width: 100%;
    }
    .container{
    width: 300px;
    }
        
    </style>
  
</head>
<body >
 <jsp:include page="header.jsp"></jsp:include>
 <div class="main">
    <div class="container">
        <div class="box box-left">
            <form action="/lms/Verify" method="post">
                <h2> Admin Login</h2>
                <div class="input-group">
                    
                    <input type="text" id="username" name="username" placeholder="Username" required>
                     <br><br>
                    <input type="password" id="password" name="password" placeholder="password" required>
                </div>
              
                <div class="button-group">
                    <input id="submit" type="submit" value="Sign In">
                    
                </div>
            </form>
             <c:if test="${not empty errorMessage}">
        <p style="color: red;">${errorMessage}</p>
    </c:if>
       
  </div>
  
</body>

</html>
    
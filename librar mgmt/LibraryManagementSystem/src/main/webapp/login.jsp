<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="style1.css">
    <style>
        body{
       		background-image: url('https://t3.ftcdn.net/jpg/08/16/22/94/240_F_816229473_DDAxd35FOjhtO9kOEzagwwBTcLxexTYh.jpg');
	       background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    height: 100vh;
		    
        }
        
    </style>
  
</head>
<body >
 <jsp:include page="header.jsp"></jsp:include>
 <div class="main">
    <div class="container">
        <div class="box box-left">
            <form action="/lms/Verify" method="get">
                <h2>Student Login</h2>
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
        <div class="box box-right">
            <h2 >New Here?</h2>
            <h5>
              <br>  Join our library management system and explore a world of knowledge! <br><br>
            </h5>
            <div class="signup-link">
                
                <div class="button-group">
                        <p> <a href="Register.jsp">
                    <button type="button" >Sign up</button></a></p>
                </div>
            </div>
        </div>
    </div>
  </div>
  
</body>

</html>

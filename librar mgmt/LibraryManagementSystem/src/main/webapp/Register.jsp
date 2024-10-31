<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Page</title>
     <link rel="stylesheet" href="style1.css">
     <style>
        .container{
            height: 450px;
        }
        .login-link button{
            padding: 10px 20px;
            background: linear-gradient(rgb(25, 65, 224),rgb(31, 212, 212));
            border: none;
            border-radius: 15px;
            color: white;
            cursor: pointer;
            width: 150px;
            box-shadow: 2px 2px 5px grey,
                        3px 3px 6px black ;
        }
        body{
         background-image: url('https://www.shutterstock.com/shutterstock/photos/162776264/display_1500/stock-photo-registration-blue-arrow-with-registration-slogan-on-a-grey-background-162776264.jpg');
         
        }
        
     </style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="main">
    <div class="container">
        <div class="box box-left ">
            <form action="/lms/Register" method="get">
                <h2>Register</h2>
                <div class="input-group">
                    <input type="text" id="name" name="name" placeholder="Your name"  required><br><br>
                    <input type="text" id="username" name="username" placeholder="username" required><br><br>
                    <input type="email" id="email" name="email" placeholder="email" required><br><br>
                    <input type="password" id="password" name="password" placeholder="password" required><br><br>
                    <input type="password" id="confirm-password" name="confirm-password" placeholder="confirm-password" required>
                </div>
                
                <div class="button-group">
                    <input  id="submit" type="submit" value="Register">
                    
                </div>
            </form>
             
			    <c:if test="${not empty errorMessage}">
			        <p style="color: red;">${errorMessage}</p>
			    </c:if>
			
			  
			    <c:if test="${not empty successMessage}">
			        <p style="color: green;">${successMessage}</p>
			    </c:if>
        </div>
   
        <div class="box box-right">
            <h2>Already Have an Account?</h2>
            <div class="login-link">
                <p>Login to access your account and explore our library.</p>
                
                    <p> <a href="login.jsp">
                <button type="button" >Login here</button></a></p>
            
            </div>
            
        </div>
    </div>
 </div>
</body>

</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Issue</title>
    <link rel="stylesheet" href="style1.css">
    <style>
        body{
         background-image: url('background1.jpeg');
         background-size: 40%;
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

 <div class="main">
    <div class="container">
        <div class="box box-left">
            <form action="/lms/IssueBook" method="post">
                <h2> Book Issue form</h2>
                <div class="input-group">
                    <input type="text" id="bookid" name="bookid" placeholder="Book Id" required> <br><br>
                    <input type="text" id="username" name="username" placeholder="Username" required>
                     <br>
                    
                </div>
              
                <div class="button-group">
                    <input id="submit" type="submit" value="Issue Book">
                    
                </div>
            </form>
             <c:if test="${not empty errorMessage}">
        <p style="color: red;">${errorMessage}</p>
    </c:if>
       
  </div>
  
</body>

</html>
    
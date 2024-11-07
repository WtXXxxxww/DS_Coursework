<%-- 
    Document   : index
    Created on : 2024年11月3日, 14:23:45
    Author     : 21722
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>DLMS Home Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 100px;
        }
        h1 {
            color: #333;
        }
        .button-container {
            margin-top: 30px;
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            text-decoration: none;
            color: white;
            background-color: #4CAF50;
            border: none;
            border-radius: 5px;
            margin: 0 15px;
            cursor: pointer;
        }
        .button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>Welcome to DLMS</h1>
    <p>Please choose an option to continue:</p>

    <div class="button-container">
        <a href="login.jsp" class="button">Login</a>
        <a href="register.jsp" class="button">Register</a>
    </div>
</body>
</html>


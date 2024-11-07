<%-- 
    Document   : settings
    Created on : 2024年11月3日, 03:14:05
    Author     : 21722
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Settings</title>
</head>
<body>
    <h2>User Settings</h2>
    <form action="UpdateSettingsServlet" method="post">
        <label for="email">Email:</label>
        <input type="email" name="email" id="email" required><br><br>

        <label for="password">New Password:</label>
        <input type="password" name="password" id="password"><br><br>

        <input type="submit" value="Update Settings">
    </form>

    <p><a href="home.jsp">Back to Home</a></p>
</body>
</html>

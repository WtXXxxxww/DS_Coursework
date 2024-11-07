<%-- 
    Document   : login
    Created on : 2024年11月3日, 02:03:26
    Author     : 21722
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>登录</title>
</head>
<body>
    <a href="index.jsp" style="text-decoration:none; color: #333;">&larr; Back to Home</a>
    <h2>登录</h2>
    <form action="LoginServlet" method="post">
        用户名: <input type="text" name="username" required><br>
        密码: <input type="password" name="password" required><br>
        角色: 
        <select name="role" required>
            <option value="user">用户</option>
            <option value="admin">管理员</option>
        </select><br><br>
        <input type="submit" value="登录">
    </form>

    <c:if test="${not empty errorMessage}">
        <p style="color:red;">${errorMessage}</p>
    </c:if>
</body>
</html>


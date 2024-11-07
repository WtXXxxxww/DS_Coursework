<%-- 
    Document   : home
    Created on : 2024年11月3日, 02:55:04
    Author     : 21722
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Date" %>
<%
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
</head>
<body>
    <h1>Welcome, <%= username %></h1>
    <p>Current Date and Time: <%= new Date() %></p>

    <nav>
        <ul>
            <li><a href="profile.jsp">View Profile</a></li>
            <li><a href="settings.jsp">Settings</a></li>
            <li><a href="LogoutServlet">Logout</a></li>
        </ul>
    </nav>

    <%
        if ("admin".equals(role)) {
    %>
    <h2>Admin Dashboard</h2>
    <p>As an admin, you have access to manage user information.</p>
    <a href="viewUsers.jsp">View All Users</a> <!-- 链接到查看用户信息的页面 -->
    <%
        }
    %>
</body>
</html>


<%-- 
    Document   : viewUsers
    Created on : 2024年11月3日, 14:38:51
    Author     : 21722
--%>

<%-- 
    Document   : viewUsers
    Created on : 2024年11月3日, 14:38:51
    Author     : 21722
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, javax.naming.*, javax.sql.DataSource, java.util.Set, user.UserSessionListener" %>
<%
    String role = (String) session.getAttribute("role");
    if (!"admin".equals(role)) {
        response.sendRedirect("home.jsp");
        return;
    }

    // 获取在线用户列表
    Set<String> onlineUsers = UserSessionListener.getOnlineUsers();

    // 数据库连接信息
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    try {
        Context initContext = new InitialContext();
        DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/YourDataSourceName");
        conn = ds.getConnection();
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT username, email, role, registration_date FROM users");
%>
<!DOCTYPE html>
<html>
<head>
    <title>All Users</title>
</head>
<body>
    <h2>All Users</h2>
    <table border="1">
        <tr>
            <th>Username</th>
            <th>Email</th>
            <th>Role</th>
            <th>Registration Date</th>
            <th>Status</th>
        </tr>
        <% while (rs.next()) { 
                String username = rs.getString("username");
        %>
        <tr>
            <td><%= username %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("role") %></td>
            <td><%= rs.getDate("registration_date") %></td>
            <td><%= onlineUsers.contains(username) ? "Online" : "Offline" %></td>
        </tr>
        <% } %>
    </table>
    <p><a href="home.jsp">Back to Home</a></p>
</body>
</html>
<%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>


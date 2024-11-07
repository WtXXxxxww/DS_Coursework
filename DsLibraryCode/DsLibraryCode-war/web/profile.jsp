<%-- 
    Document   : profile
    Created on : 2024年11月3日, 03:15:03
    Author     : 21722
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, javax.naming.*, javax.sql.DataSource" %>
<%
    // 检查用户是否已登录
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp"); // 如果用户未登录，重定向到登录页面
        return;
    }

    // 数据库连接信息
    String email = "";
    String role = "";

    try {
        // 获取数据库连接池
        Context initContext = new InitialContext();
        DataSource ds = (DataSource) initContext.lookup("java:comp/env/jdbc/YourDataSourceName");
        Connection conn = ds.getConnection();

        // 从数据库中查询用户信息
        String query = "SELECT email, role FROM users WHERE username = ?";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(1, username);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            email = rs.getString("email");
            role = rs.getString("role");
        }

        rs.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Profile</title>
</head>
<body>
    <h2>User Profile</h2>
    <p><strong>Username:</strong> <%= session.getAttribute("username") %></p>
    <p><strong>Role:</strong> <%= session.getAttribute("role") %></p>
    <p><strong>Email:</strong> <%= session.getAttribute("email") %></p>
    <p><a href="home.jsp">Back to Home</a></p>
</body>
</html>


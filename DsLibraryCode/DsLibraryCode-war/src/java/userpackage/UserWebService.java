/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/WebServices/WebService.java to edit this template
 */
package userpackage;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import java.sql.*;  

/**
 *
 * @author 21722
 */
@WebService(serviceName = "UserWebService")
public class UserWebService {

    private static final String JDBC_URL = "jdbc:mysql://bj-cynosdbmysql-grp-3uoflkim.sql.tencentcdb.com:20820/library?autoReconnect=true&useSSL=false";  // 确保数据库名称正确  ?autoReconnect=true&useSSL=false
    private static final String JDBC_USER = "root";  
    private static final String JDBC_PASSWORD = "Ds123456";  
  
    static {  
        try {  
            // 注册 MySQL JDBC 驱动  
            Class.forName("com.mysql.cj.jdbc.Driver");  
        } catch (ClassNotFoundException e) {  
            e.printStackTrace();  
            throw new RuntimeException("MySQL JDBC Driver not found.");  
        }  
    }
    
    // 注册用户
    @WebMethod(operationName = "RegisterUser")
    public String RegisterUser(@WebParam(name = "username") String username,
                               @WebParam(name = "password") String password,
                               @WebParam(name = "email") String email,
                               @WebParam(name = "role") String role) {
        // 检查用户名是否已存在
        if (isUserExists(username)) {
            return "Error: User already exists.";
        }

        // 插入新用户
        String sql = "INSERT INTO users (username, password, email, balance, registration_date, role) VALUES (?, ?, ?, 0, NOW(), ?)";
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            pstmt.setString(3, email);
            pstmt.setString(4, role);
            int rows = pstmt.executeUpdate();
            return "User registered successfully. Rows affected: " + rows;
        } catch (SQLException e) {
            return "Error registering user: " + e.getMessage();
        }
    }

    // 检查用户是否存在
    private boolean isUserExists(String username) {
        String sql = "SELECT COUNT(*) FROM users WHERE username = ?";
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, username);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // 验证用户登录并检查角色
    @WebMethod(operationName = "ValidateUser")
    public boolean ValidateUser(@WebParam(name = "username") String username,
                                @WebParam(name = "password") String password,
                                @WebParam(name = "role") String role) {
        String sql = "SELECT * FROM users WHERE username = ? AND password = ? AND role = ?";
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            pstmt.setString(3, role); // 验证角色

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                // 更新 last_login 字段
                String updateLastLogin = "UPDATE users SET last_login = NOW() WHERE username = ?";
                try (PreparedStatement updateStmt = conn.prepareStatement(updateLastLogin)) {
                    updateStmt.setString(1, username);
                    updateStmt.executeUpdate();
                }
                return true; // 用户验证成功
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    // 更新用户设置的方法
    public String updateUserSettings(String username, String email, String password) {
        String sql = "UPDATE users SET email = ?, password = ? WHERE username = ?";
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, email);
            pstmt.setString(2, password);
            pstmt.setString(3, username);

            int rows = pstmt.executeUpdate();
            if (rows > 0) {
                return "Settings updated successfully";
            } else {
                return "Error: User not found or no changes made.";
            }
        } catch (SQLException e) {
            return "Error updating settings: " + e.getMessage();
        }
    }
    
    public Integer getUserIdByUsernameAndPassword(String username, String password, String role) {
        String sql = "SELECT user_id FROM users WHERE username = ? AND password = ? AND role = ?";
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD); 
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, username);
            pstmt.setString(2, password);
            pstmt.setString(3, role);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return rs.getInt("user_id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // 未找到匹配用户时返回 null
    }

}


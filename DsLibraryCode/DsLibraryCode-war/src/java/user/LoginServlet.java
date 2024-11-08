/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package user;

import userpackage.UserWebService;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 21722
 */
/**
 * Handles user login requests.
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // 获取用户提交的登录信息
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        // 如果未提供用户名、密码或角色信息，直接转发回登录页面
        if (username == null || password == null || role == null) {
            request.setAttribute("errorMessage", "Please provide all required fields.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        
        //密码加密
        

        // 创建 UserWebService 实例并调用验证方法
        UserWebService service = new UserWebService();
        boolean isValidUser = service.ValidateUser(username, password, role); // 添加角色验证
        Integer userId = service.getUserIdByUsernameAndPassword(username, password, role);

        if (isValidUser) {
            // 登录成功，设置会话属性并重定向到主页
            request.getSession().setAttribute("username", username);
            request.getSession().setAttribute("user_id", userId);
            request.getSession().setAttribute("role", role); // 存储角色信息
            UserSessionListener.getOnlineUsers().add(username); // 将用户添加到在线列表
            response.sendRedirect("book-servlet");
        } else {
            // 登录失败，设置错误消息并转发回登录页面
            request.setAttribute("errorMessage", "Invalid username, password, or role.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Handles user login with role validation";
    }
}
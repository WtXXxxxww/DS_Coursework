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
import encrypt.AsymmetricCryptoSystem;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author 21722
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        
        // 获取用户提交的注册信息
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String role = request.getParameter("role");

        // 在控制台打印用户注册信息，方便调试
        System.out.println("RegisterServlet - Received registration request:");
        System.out.println("Username: " + username);
        System.out.println("Password: " + password);
        System.out.println("Email: " + email);
        System.out.println("Role: " + role);
        
        // 创建加密类实例
        AsymmetricCryptoSystem cryptoSystem = new AsymmetricCryptoSystem();
        
        try (PrintWriter out = response.getWriter()) {
            byte[] passwordBytes = password.getBytes("UTF-8");
            byte[] encryptedPassword = cryptoSystem.encrypt(cryptoSystem.getPublicKey(), passwordBytes);
            String encryptedPasswordStr = Base64.getEncoder().encodeToString(encryptedPassword);

            // 存储密钥（如果需要）
            cryptoSystem.storeKeysInDB(username, encryptedPasswordStr);

            // 创建 NewWebService 实例并调用注册方法
            UserWebService service = new UserWebService();
            String result = service.RegisterUser(username, password, email, role);
            
            // 在控制台打印注册结果
            System.out.println("RegisterServlet - Registration result: " + result);

            System.out.println("RegisterServlet - Registration result: " + result);
            // 根据注册结果进行反馈
            if (result.contains("User registered successfully")) {
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Registration Successful</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Registration Successful</h1>");
                out.println("<p>Thank you for registering, " + username + "!</p>");
                out.println("<a href='login.jsp'>Go to Login</a>");
                out.println("</body>");
                out.println("</html>");
            } else {
                request.setAttribute("errorMessage", result);
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Handles user registration";
    }
}
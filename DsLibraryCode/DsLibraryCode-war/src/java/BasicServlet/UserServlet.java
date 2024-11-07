/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package BasicServlet;

import dto.Book;
import dto.User;
import dto.UserDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author 57869
 */
// UserServlet.java
@WebServlet(name = "UserServlet", urlPatterns = {"/user-servlet"})
public class UserServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        User user;
        
        // 获取userId
        HttpSession session = request.getSession(); 
        Integer userId = (Integer) session.getAttribute("user_id"); 
        
        // 如果找到了 userId
        if (userId != 0 && "viewProfile".equals(action)) {
           UserDAO userDAO = new UserDAO();
           user = userDAO.getUserById(userId);
           if (user != null) {
               request.setAttribute("user", user);

               // 获取用户的借阅和购买记录
               List<Book> rentedBooks = userDAO.getRentedBooks(userId);
               List<Book> purchasedBooks = userDAO.getPurchasedBooks(userId);

                // 将记录添加到请求属性中
                request.setAttribute("rentedBooks", rentedBooks);
                request.setAttribute("purchasedBooks", purchasedBooks);

                request.getRequestDispatcher("/userProfile.jsp").forward(request, response);
            } else {
                // 用户不存在时重定向到登录页面
                
            }
        } else {
            // 未登录时重定向到登录页面
            
        }
    }
}

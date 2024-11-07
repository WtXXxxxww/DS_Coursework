/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package user;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/**
 *
 * @author 21722
 */
public class UserSessionListener implements HttpSessionListener {
    private static final Set<String> onlineUsers = Collections.synchronizedSet(new HashSet<>());

    // 获取在线用户列表
    public static Set<String> getOnlineUsers() {
        return onlineUsers;
    }

    @Override
    public void sessionCreated(HttpSessionEvent event) {
        // 可以在会话创建时添加逻辑（这里不需要处理）
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent event) {
        // 从在线用户列表中移除用户
        String username = (String) event.getSession().getAttribute("username");
        if (username != null) {
            onlineUsers.remove(username);
        }
    }
}

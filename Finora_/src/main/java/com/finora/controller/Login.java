package com.finora.controller;

import com.finora.dao.UserDAO;
import com.finora.model.UserModel;
import com.finora.service.LoginService;
import com.finora.util.CookieUtil;
import com.finora.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet(asyncSupported = true, urlPatterns = { "/Login" })
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/Pages/Login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        LoginService service = new LoginService();
        String status = service.authenticate(username, password);

        if ("Success".equals(status)) {
            UserDAO userDAO = new UserDAO();
            try {
                UserModel userData = userDAO.getUserByUsername(username);

                // Store user data in session (1 hour)
                SessionUtil.setAttribute(request, "user", userData, 3600);

                // Record last login time in a cookie
                LocalDateTime now = LocalDateTime.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd_HH:mm:ss");
                String loginTime = now.format(formatter);
                CookieUtil.addCookie(response, "last_login", loginTime, 3600);

            } catch (Exception e) {
                e.printStackTrace();
            }
            response.sendRedirect(request.getContextPath() + "/Admin_Dashboard");
        } else {
            request.setAttribute("error", status);
            request.setAttribute("typedUser", username);
            request.getRequestDispatcher("/WEB-INF/Pages/Login.jsp").forward(request, response);
        }
    }
}

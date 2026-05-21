package com.finora.controller;

import com.finora.service.RegisterService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(asyncSupported = true, urlPatterns = { "/Register" })
public class Register extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/Pages/Register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String firstName  = request.getParameter("first_name");
            String lastName   = request.getParameter("last_name");
            String username   = request.getParameter("username");
            String dob        = request.getParameter("dob");
            String gender     = request.getParameter("gender");
            String email      = request.getParameter("email");
            String number     = request.getParameter("number");
            String password   = request.getParameter("password");
            int programId     = Integer.parseInt(request.getParameter("program"));

            RegisterService service = new RegisterService();
            service.addUser(firstName, lastName, username, dob, gender, email, number, password, programId);

            // Redirect to login after successful registration
            response.sendRedirect(request.getContextPath() + "/Login");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Registration Error: " + e.getMessage());
        }
    }
}

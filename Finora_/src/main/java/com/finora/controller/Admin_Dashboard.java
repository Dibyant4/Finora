package com.finora.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.finora.model.UserModel;
import com.finora.service.ListService;
import com.finora.util.SessionUtil;

import java.util.List;

@WebServlet(asyncSupported = true, urlPatterns = { "/Admin_Dashboard" })
public class Admin_Dashboard extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Load all users for the admin dashboard table
            ListService service = new ListService();
            List<UserModel> users = service.fetchAll();
            request.setAttribute("users", users);
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("/WEB-INF/Pages/Admin_Dashboard.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}

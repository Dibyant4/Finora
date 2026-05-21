package com.finora.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import com.finora.dao.UserDAO;
import com.finora.model.UserModel;
import com.finora.util.FileUploadUtil;
import com.finora.util.SessionUtil;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/User_profile")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,   // 2 MB
    maxFileSize       = 1024 * 1024 * 10,  // 10 MB
    maxRequestSize    = 1024 * 1024 * 50   // 50 MB
)
public class User_profile extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = System.getProperty("user.home") + File.separator + "finora_uploads";
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/Pages/User_profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserModel user = (UserModel) SessionUtil.getAttribute(request, "user");

        String firstName = request.getParameter("firstName");
        String lastName  = request.getParameter("lastName");
        String dob       = request.getParameter("dob");
        String email     = request.getParameter("email");
        String number    = request.getParameter("number");

        try {
            int rowsAffected = userDAO.updateUser(user.getUserId(), firstName, lastName, dob, email, number);

            if (rowsAffected > 0) {
                java.sql.Date sqlDate = java.sql.Date.valueOf(dob);

                // Update the in-memory user object
                user.setFirstName(firstName);
                user.setLastName(lastName);
                user.setDob(sqlDate);
                user.setEmail(email);
                user.setNumber(number);

                // Refresh session with updated user
                SessionUtil.setAttribute(request, "user", user, 3600);

                // Handle optional profile image upload
                Part filePart = request.getPart("profileImage");
                if (filePart != null && filePart.getSize() > 0) {
                    if (FileUploadUtil.isImage(filePart)) {
                        String extension = FileUploadUtil.getFileExtension(filePart.getSubmittedFileName());
                        String fileName = user.getUserName() + extension;
                        FileUploadUtil.saveFile(filePart, UPLOAD_DIR, fileName);
                        SessionUtil.setAttribute(request, "message", "Profile and photo updated!", 3600);
                    } else {
                        SessionUtil.setAttribute(request, "error", "Info updated, but invalid image type.", 3600);
                    }
                } else {
                    SessionUtil.setAttribute(request, "message", "Profile updated successfully.", 3600);
                }
            } else {
                SessionUtil.setAttribute(request, "error", "No changes were made.", 3600);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            SessionUtil.setAttribute(request, "error", "Database Error: " + e.getMessage(), 3600);
        } catch (Exception e) {
            e.printStackTrace();
            SessionUtil.setAttribute(request, "error", "Error: " + e.getMessage(), 3600);
        }

        response.sendRedirect(request.getContextPath() + "/User_profile");
    }
}

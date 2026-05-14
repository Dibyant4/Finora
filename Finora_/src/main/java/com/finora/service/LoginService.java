package com.finora.service;

import com.finora.dao.UserDAO;
import com.finora.model.UserModel;
import com.finora.util.PasswordUtil;

public class LoginService {
    UserDAO userDAO = new UserDAO();

    public String authenticate(String username, String password) {

        if (username == null || username.trim().isEmpty()) {
            return "Username is required";
        }
        if (password == null || password.isEmpty()) {
            return "Password is required";
        }

        try {
            UserModel user = userDAO.getUserByUsername(username);

            if (user == null) {
                return "User doesn't exist";
            }

            if (PasswordUtil.checkPassword(password, user.getPassword())) {
                return "Success";
            } else {
                return "Password is incorrect";
            }

        } catch (Exception e) {
            e.printStackTrace();
            return "Error in Database";
        }
    }
}

package com.finora.service;

import com.finora.dao.UserDAO;
import com.finora.util.PasswordUtil;

public class RegisterService {
    UserDAO dao = new UserDAO();

    public void addUser(String firstName, String lastName, String username, String dob,
                        String gender, String email, String number, String password, int programId) throws Exception {
        // Hash the password before storing
        password = PasswordUtil.getHashPassword(password);
        dao.insertUser(firstName, lastName, username, dob, gender, email, number, password, programId);
    }
}

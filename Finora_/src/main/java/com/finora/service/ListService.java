package com.finora.service;

import java.util.List;

import com.finora.dao.UserDAO;
import com.finora.model.UserModel;

public class ListService {
    public List<UserModel> fetchAll() throws Exception {
        UserDAO userDAO = new UserDAO();
        return userDAO.getAllUsers();
    }
}

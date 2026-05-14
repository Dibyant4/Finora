package com.finora.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.finora.model.UserModel;
import com.finora.util.DBConfig;

public class UserDAO {

    // INSERT a new user into the database
    public void insertUser(String firstName, String lastName, String username, String dob,
                           String gender, String email, String number, String password, int programId) throws Exception {

        LocalDate localDate = LocalDate.parse(dob);
        Date sqlDate = Date.valueOf(localDate);

        Connection con = DBConfig.getConnection();
        String sql = "INSERT INTO users (first_name, last_name, username, dob, gender, email, number, password, program_id) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement pst = con.prepareStatement(sql);

        pst.setString(1, firstName);
        pst.setString(2, lastName);
        pst.setString(3, username);
        pst.setDate(4, sqlDate);
        pst.setString(5, gender);
        pst.setString(6, email);
        pst.setString(7, number);
        pst.setString(8, password);
        pst.setInt(9, programId);

        pst.executeUpdate();
        pst.close();
        con.close();
    }

    // GET all users
    public List<UserModel> getAllUsers() throws Exception {
        List<UserModel> users = new ArrayList<>();
        Connection con = DBConfig.getConnection();

        String sql = "SELECT * FROM users";
        PreparedStatement pst = con.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            UserModel u = new UserModel();
            u.setUserId(rs.getInt("user_id"));
            u.setFirstName(rs.getString("first_name"));
            u.setLastName(rs.getString("last_name"));
            u.setUserName(rs.getString("username"));
            u.setDob(rs.getDate("dob"));
            u.setGender(rs.getString("gender"));
            u.setEmail(rs.getString("email"));
            u.setNumber(rs.getString("number"));
            u.setProgram(rs.getInt("program_id"));
            users.add(u);
        }

        rs.close();
        pst.close();
        con.close();
        return users;
    }

    // GET a single user by username (used for login)
    public UserModel getUserByUsername(String username) throws Exception {
        UserModel user = null;
        Connection con = DBConfig.getConnection();

        String sql = "SELECT * FROM users WHERE username = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, username);

        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            user = new UserModel();
            user.setUserId(rs.getInt("user_id"));
            user.setFirstName(rs.getString("first_name"));
            user.setLastName(rs.getString("last_name"));
            user.setUserName(rs.getString("username"));
            user.setDob(rs.getDate("dob"));
            user.setGender(rs.getString("gender"));
            user.setEmail(rs.getString("email"));
            user.setNumber(rs.getString("number"));
            user.setProgram(rs.getInt("program_id"));
            user.setPassword(rs.getString("password"));
        }

        rs.close();
        pst.close();
        con.close();
        return user;
    }

    // UPDATE user profile details
    public int updateUser(int userId, String firstName, String lastName, String dob,
                          String email, String number) throws Exception {
        LocalDate localDate = LocalDate.parse(dob);
        Date sqlDate = Date.valueOf(localDate);

        Connection con = DBConfig.getConnection();
        String sql = "UPDATE users SET first_name = ?, last_name = ?, dob = ?, email = ?, number = ? WHERE user_id = ?";
        PreparedStatement pst = con.prepareStatement(sql);

        pst.setString(1, firstName);
        pst.setString(2, lastName);
        pst.setDate(3, sqlDate);
        pst.setString(4, email);
        pst.setString(5, number);
        pst.setInt(6, userId);

        int rowsAffected = pst.executeUpdate();
        pst.close();
        con.close();
        return rowsAffected;
    }
}

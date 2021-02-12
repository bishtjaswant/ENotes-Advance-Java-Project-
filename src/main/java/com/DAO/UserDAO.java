package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.DBConnection.DBConnection;
import com.User.User;

public class UserDAO {

	private static Connection connection = null;

	public UserDAO() {
		connection = DBConnection.getConnection();
	}

	public boolean addUser(User user) {
		boolean isSave = false;

		try {
			String sql = "insert into users (firstname,lastname,username,email,password) values(?,?,?,?,?) ";
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, user.getFirstname());
			stmt.setString(2, user.getLastname());
			stmt.setString(3, user.getUsername());
			stmt.setString(4, user.getEmail());
			stmt.setString(5, user.getPassword());
			stmt.execute();
			isSave = true;

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return isSave;
	}

	public User loginUser(User user) {

		User userdetails = null;

		try {
			String sql = "select id,username,email,password from users where email=? and password=? ";
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, user.getEmail());
			stmt.setString(2, user.getPassword());

			ResultSet rSet = stmt.executeQuery();

			if (rSet.next()) {
				userdetails = new User();
				userdetails.setId(rSet.getInt("id"));
				userdetails.setEmail(rSet.getString("email"));
				userdetails.setUsername(rSet.getString("username"));
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}

		return userdetails;
	}

}

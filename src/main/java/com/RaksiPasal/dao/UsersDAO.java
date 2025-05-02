package com.RaksiPasal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.RaksiPasal.model.User;

public class UsersDAO {

	private Connection conn;

	public UsersDAO() throws ClassNotFoundException, SQLException {
		this.conn = DatabaseConnection.getConnection();
	}

	public boolean addUser(User user) {
		String insertQuery = "INSERT INTO users (email, password, firstname, lastname, Date_of_birth) VALUES (?, ?, ?, ?, ?)";
		if (conn != null) {
			try {
				PreparedStatement ps = conn.prepareStatement(insertQuery);
				ps.setString(1, user.getEmail());
				ps.setString(2, user.getPassword());
				ps.setString(3, user.getFirstname());
				ps.setString(4, user.getLastname());
				ps.setString(5, user.getDob());

				int rowsInserted = ps.executeUpdate();
				return rowsInserted > 0;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	
	public ArrayList<User> getUserDetails() {
		ArrayList<User> userList = new ArrayList<>();
		String query = "SELECT email, password FROM users";

		if (conn != null) {
			try {
				PreparedStatement ps = conn.prepareStatement(query);
				ResultSet rs = ps.executeQuery();

				while (rs.next()) {
					String email = rs.getString("email");
					String password = rs.getString("password");

					User user = new User(email, password);
					userList.add(user);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return userList;
	}
	
	public boolean updateUser(User user) throws SQLException {
		String query = "UPDATE users SET firstname = ?, lastname = ?, password = ?, Date_of_birth = ?WHERE email = ?";
		if (conn != null) {
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, user.getFirstname());
			ps.setString(2, user.getLastname());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getDob());
			ps.setString(5, user.getEmail());

			int rowsUpdated = ps.executeUpdate();
			return rowsUpdated > 0;
		}
		return false;
	}

}

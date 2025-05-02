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

	
	public User getUserDetails(String userEmail) {
        User user = null;
        String query = "SELECT email, firstname, lastname, dob, password FROM users WHERE email = ?";

        if (conn != null) {
            try {
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setString(1, userEmail);  // Set the email to filter results
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    // ✅ Retrieve data from result set
                    String email = rs.getString("email");
                    String firstname = rs.getString("firstname");
                    String lastname = rs.getString("lastname");
                    String dob = rs.getString("dob");
                    String password = rs.getString("password");

                    // ✅ Create user object with retrieved data
                    user = new User(email, firstname, lastname, dob, password);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return user;  // Return single user object
    }
	
	public boolean updateUserProfile(String email, String firstName, String lastName, String dob) {
	    String query = "UPDATE users SET firstname = ?, lastname = ?, dob = ? WHERE email = ?";
	    
	    try (PreparedStatement ps = conn.prepareStatement(query)) {
	        ps.setString(1, firstName);
	        ps.setString(2, lastName);
	        ps.setString(3, dob);
	        ps.setString(4, email);

	        int rowsAffected = ps.executeUpdate();
	        return rowsAffected > 0; // Return true if the update was successful
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false; // Return false if there was an error
	    }
	}
}

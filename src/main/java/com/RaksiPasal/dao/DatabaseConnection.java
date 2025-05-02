package com.RaksiPasal.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

    private final static String databaseName = "rakshi_pasal_db";
    private final static String username = "root";
    private final static String password = "";
    private final static String jdbcURL = "jdbc:mysql://localhost:3306/" + databaseName;

    // Get database connection
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection conn = null;
        Class.forName("com.mysql.cj.jdbc.Driver");
       
        conn = DriverManager.getConnection(jdbcURL, username, password);
        return conn;
    }

    // Main method
    public static void main(String[] args) {
        try {
           
            Connection con = DatabaseConnection.getConnection();
            if (con != null) {
                System.out.println("Connection Success");
                
                con.close();
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}

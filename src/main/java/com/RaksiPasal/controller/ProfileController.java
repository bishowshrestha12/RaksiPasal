package com.RaksiPasal.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.RaksiPasal.dao.UsersDAO;
import com.RaksiPasal.model.User;

@WebServlet("/Profile")
public class ProfileController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ProfileController() {
        super();
    }

    // GET: Fetch and show user data on profile.jsp
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Check if session exists and get the user's email
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userEmail") == null) {
            response.sendRedirect("login.jsp?error=session_expired");
            return;
        }

        String email = (String) session.getAttribute("userEmail");

        try {
            UsersDAO dao = new UsersDAO();
            User user = dao.getUserDetails(email);

            if (user != null) {
                request.setAttribute("user", user);
                request.getRequestDispatcher("profile.jsp").forward(request, response);
            } else {
                response.sendRedirect("login.jsp?error=user_not_found");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("profile.jsp?error=exception");
        }
    }

    // POST: Update user data after editing profile
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the updated profile data from the form
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String dob = request.getParameter("dob");

        // Get user email from session
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("userEmail");

        // Update the user profile in the database
        UsersDAO dao = null;
        try {
            dao = new UsersDAO(); // Initialize UsersDAO
        } catch (ClassNotFoundException | SQLException e) {
            // Handle exception properly
            e.printStackTrace();
            request.setAttribute("error", "Database connection error.");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
            return; // Return early if DAO initialization fails
        }

        // Update profile data
        boolean isUpdated = dao.updateUserProfile(email, firstName, lastName, dob);

        if (isUpdated) {
            // Redirect to the profile page to show the updated data
            response.sendRedirect("Profile");
        } else {
            // Handle error if update fails
            request.setAttribute("error", "Unable to update profile.");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        }
    }

}

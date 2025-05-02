package com.RaksiPasal.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.RaksiPasal.dao.UsersDAO;
import com.RaksiPasal.model.User;
import com.RaksiPasal.utility.EncryptDecrypt;

@WebServlet("/Profile")
public class ProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProfileController() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// ✅ Get the email from session
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("userEmail") == null) {
			response.sendRedirect("login.jsp?error=session_expired");
			return;
		}
		String email = (String) session.getAttribute("userEmail");

		// ✅ Get updated fields from the form
		String takePassword = request.getParameter("password");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String dob = request.getParameter("dob");

		// ✅ Encrypt password
		String password = EncryptDecrypt.encrypt(takePassword);

		// ✅ Validate fields
		if (fname == null || !fname.matches("^[a-zA-Z]+$")) {
			response.sendRedirect("profile.jsp?error=fname");
			return;
		}

		if (lname == null || !lname.matches("^[a-zA-Z]+$")) {
			response.sendRedirect("profile.jsp?error=lname");
			return;
		}

		if (takePassword == null || !takePassword.matches(".*[A-Z].*") || 
		    !takePassword.matches(".*[0-9].*") || 
		    !takePassword.matches(".*[^A-Za-z0-9].*") || 
		    takePassword.length() < 6) {
			response.sendRedirect("profile.jsp?error=password");
			return;
		}


		try {
			User user = new User(email, fname, lname, dob, password);
			UsersDAO dao = new UsersDAO();

			if (dao.updateUser(user)) {
				response.sendRedirect("profile.jsp?success=true");
			} else {
				response.sendRedirect("profile.jsp?error=db");
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			response.sendRedirect("profile.jsp?error=exception");
		}
	}
}

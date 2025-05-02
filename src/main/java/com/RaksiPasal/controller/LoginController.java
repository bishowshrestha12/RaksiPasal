package com.RaksiPasal.controller;

import java.io.IOException;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.RaksiPasal.dao.UsersDAO;
import com.RaksiPasal.model.User;
import com.RaksiPasal.utility.EncryptDecrypt;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String takePassword = request.getParameter("password");
		String password = EncryptDecrypt.encrypt(takePassword);
		

		if (takePassword == null || !takePassword.matches(".*[A-Z].*") || !takePassword.matches(".*[0-9].*")
				|| !takePassword.matches(".*[^A-Za-z0-9].*") || takePassword.length() < 6) {

			response.sendRedirect(request.getContextPath() + "/login.jsp?error=Password");
			return;
		}

		try {
			UsersDAO usersDAO = new UsersDAO();
			ArrayList<User> users = usersDAO.getUserDetails();

			for (User user : users) {
				if (user.getEmail().equalsIgnoreCase(email) && user.getPassword().equals(password)) {

					HttpSession session = request.getSession();
					session.setAttribute("userEmail", email);

					response.sendRedirect("home.jsp");
					return;
				}
			}

			response.sendRedirect("login.jsp?error=InvalidCredentials");

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			response.sendRedirect("login.jsp?error=ServerError");
		}
	}
}

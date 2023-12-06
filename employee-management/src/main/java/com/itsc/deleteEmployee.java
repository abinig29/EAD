package com.itsc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteEmployee")
public class deleteEmployee extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		int employeeId = Integer.parseInt(request.getParameter("id"));

		try {
			String driver = "com.mysql.cj.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/employees";
			String username = "root"; //
			String password = "tataTATA123."; // your password
			Class.forName(driver); // optional
			Connection connection = DriverManager.getConnection(url, username, password);
			String query = "DELETE FROM employees WHERE id=?";
			try (PreparedStatement pst = connection.prepareStatement(query)) {
				pst.setInt(1, employeeId);
				pst.executeUpdate();
				response.sendRedirect("/employe"); 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		// Redirect to the view page
	}
}

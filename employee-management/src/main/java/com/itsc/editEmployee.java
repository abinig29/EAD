package com.itsc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/editEmployee")
public class editEmployee extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		int employeeId = Integer.parseInt(request.getParameter("id"));
		try {
			String driver = "com.mysql.cj.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/employees";
			String username = "root"; //
			String password = "tataTATA123."; // your password
			Class.forName(driver); // optional
			Connection connection = DriverManager.getConnection(url, username, password);
			String query = "SELECT * FROM employees WHERE id = ?";
			PreparedStatement pst = connection.prepareStatement(query);
			pst.setInt(1, employeeId);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				String name = rs.getString("name");
				String designation = rs.getString("designation");
				double salary = rs.getDouble("salary");

				request.setAttribute("id", employeeId);
				request.setAttribute("name", name);
				request.setAttribute("designation", designation);
				request.setAttribute("salary", salary);
				request.getRequestDispatcher("edit-employee.jsp").forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		int employeeId = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String designation = request.getParameter("designation");
		double salary = Double.parseDouble(request.getParameter("salary"));

		try {
			String driver = "com.mysql.cj.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/employees";
			String username = "root"; //
			String password = "tataTATA123."; // your password
			Class.forName(driver); // optional
			Connection connection = DriverManager.getConnection(url, username, password);
			String query = "UPDATE employees SET name=?, designation=?, salary=? WHERE id=?";
			PreparedStatement pst = connection.prepareStatement(query);
			pst.setString(1, name);
			pst.setString(2, designation);
			pst.setDouble(3, salary);
			pst.setInt(4, employeeId);
			pst.executeUpdate();
			 response.sendRedirect("/employe");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}

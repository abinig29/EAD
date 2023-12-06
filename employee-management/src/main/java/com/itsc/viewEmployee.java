package com.itsc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/")
public class viewEmployee extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) {

		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException cnf) {
			cnf.printStackTrace();
		}
		try {
			String driver = "com.mysql.cj.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/employees";
			String username = "root"; //
			String password = "tataTATA123."; // your password
			Class.forName(driver); // optional
			Connection connection = DriverManager.getConnection(url, username, password); // Get your database
																							// connection here
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery("SELECT * FROM employees");
			List<Employee> employees = new ArrayList<>();
			while (resultSet.next()) {
				Employee employee = new Employee(resultSet.getInt("id"), resultSet.getString("name"),
						resultSet.getString("designation"), resultSet.getDouble("salary"));
				employees.add(employee);
			}
		

			request.setAttribute("employees", employees);
			request.getRequestDispatcher("viewEmployees.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			// Handle errors appropriately
		}

		
	}

}
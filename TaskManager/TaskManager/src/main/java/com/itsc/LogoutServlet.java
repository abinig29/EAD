package com.itsc;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class LogoutServlet extends HttpServlet {
    
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Clear the session
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        // Prevent caching by setting appropriate headers
        

        // Redirect to the login page
        response.sendRedirect("login.jsp");
    }
}

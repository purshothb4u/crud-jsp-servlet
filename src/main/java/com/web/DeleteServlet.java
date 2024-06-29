package com.web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import com.dao.EmployeeDAO;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		String name = request.getParameter("empName");
		
		EmployeeDAO empDAO = new EmployeeDAO();
		
		try {
			if(empDAO.deleteEmployee(name)) {
				response.sendRedirect("manage.jsp");
			}
			else {
				System.out.println("Issue in DeleteServlet");
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

}

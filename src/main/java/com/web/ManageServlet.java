package com.web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;

import com.dao.EmployeeDAO;
import com.model.EmployeeBean;

@WebServlet("/ManageServlet")
public class ManageServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		String name = request.getParameter("empName");
		
		EmployeeDAO empDAO = new EmployeeDAO();
		try {
			EmployeeBean empBean = empDAO.getEmployeeByName(name);
			request.setAttribute("empBean", empBean);
			RequestDispatcher rd = request.getRequestDispatcher("update.jsp");
			rd.forward(request, response);
			
		} catch (SQLException e) {
			System.out.println(e);
		}
		
	
	}

}

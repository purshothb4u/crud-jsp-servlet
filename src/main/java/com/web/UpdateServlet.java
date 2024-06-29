package com.web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import com.dao.EmployeeDAO;
import com.model.EmployeeBean;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String gender = request.getParameter("gender");
		String phone = request.getParameter("phone");
		
		System.out.println(email + password + name + age + gender + phone + "in Update Servlet");
		
		EmployeeBean empBean = new EmployeeBean(email, password, name, age, gender, phone);
		
		EmployeeDAO empDAO = new EmployeeDAO();
		try {
			if(empDAO.updateEmployee(empBean)) {
				response.sendRedirect("manage.jsp");
			}
			else {
				System.out.println("Issue in UpdateServlet");
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

}

package com.web;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import com.dao.EmployeeDAO;
import com.model.EmployeeBean;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String gender = request.getParameter("gender"); 
		String phone = request.getParameter("phone");
		
		PrintWriter out = response.getWriter();		
		System.out.println(email + password + name + age + gender + phone + "in Register Servlet");
		EmployeeBean emp = new EmployeeBean(email, password, name, age, gender, phone);
		EmployeeDAO empDAO = new EmployeeDAO();
		try {
			if(empDAO.addEmployee(emp)) {
				out.println("<h1>Employee details updated in SQL</h1>");
				response.sendRedirect("adminHome.jsp");
			}
			/*else {
				
				RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
				rd.include(request, response);
				out.println("<h1 align='center' style='color:red;'>Not Updated pls give valid data</h1>");
				
			}*/
		} catch (SQLException e) {
			System.out.println(e);
			RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
			rd.include(request, response);
			out.println("<h3 align='center' style='color:red;margin-top:20px;'>Not Registered Duplicate Entry pls give valid data</h3>");
			System.out.println("Not Registered Duplicate Entry pls give valid data");
		}
		finally {
			out.close();
		}
	}

}

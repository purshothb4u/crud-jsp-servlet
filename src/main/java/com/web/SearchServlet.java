package com.web;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.dao.EmployeeDAO;
import com.model.EmployeeBean;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		String searchName = request.getParameter("searchInput");
		
		EmployeeDAO empDAO = new EmployeeDAO();
		try {
			if(searchName != null && !searchName.isEmpty()) {
			List<EmployeeBean> empList= empDAO.searchEmployeeByNameLike(searchName);
			request.setAttribute("empList", empList);
			}
			RequestDispatcher rd = request.getRequestDispatcher("employeeHome.jsp");
			rd.forward(request, response);
			
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

}

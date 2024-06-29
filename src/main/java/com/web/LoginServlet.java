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

import jakarta.servlet.http.HttpSession;
//import javax.servlet.http.HttpSession;

import com.dao.EmployeeDAO;
import com.model.EmployeeBean;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		EmployeeDAO empDAO = new EmployeeDAO();
		String Uname = request.getParameter("username");
		String Upass = request.getParameter("password");
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
	try {		
			if	(empDAO.verifyLoginUser(Uname,Upass)) {
				
				if(Uname.equalsIgnoreCase("admin")) {
				out.print("<h1 align='center' style='color:green'>Welcome Admin</h1>");
				response.sendRedirect("adminHome.jsp");				
				session.setAttribute("Uname", Uname); }
				else {
					out.print("<h1 align='center' style='color:green'>Welcome EMP</h1>");
					response.sendRedirect("employeeHome.jsp");
					session.setAttribute("Uname", Uname);
				}
				
			}	
		else {
			
			RequestDispatcher rs = request.getRequestDispatcher("index.jsp");
			rs.include(request, response);
			out.print("<h1 align='center' style='color:red; margin-top:100px;'>Please give valid data</h1>");
		
		}
	} 
	catch (SQLException e) {
		System.out.println(e);
	}
	finally {
		out.close();		
	}
	
	
	}

}

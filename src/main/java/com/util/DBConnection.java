package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	private static final String URL = "jdbc:mysql://localhost:3306/employees_project_1";
	private static final String USER = "root";
	private static final String PASS = "root";

	public static Connection getConnection() throws SQLException{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new SQLException("Unable to load database driver.", e);
		}
		return DriverManager.getConnection(URL,USER,PASS);
	}
}

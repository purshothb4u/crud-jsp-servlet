package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.model.EmployeeBean;
import com.util.DBConnection;

public class EmployeeDAO {

	public boolean verifyLoginUser(String name , String password) throws SQLException{
		String query = "select * from emp_details where name = ? and password = ?";
		try(Connection con = DBConnection.getConnection();
		    PreparedStatement ps = con.prepareStatement(query)){
			ps.setString(1,name);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
		      return rs.next();	    		  
		}	
	}
	
	public boolean addEmployee(EmployeeBean empBean) throws SQLException {
		String query = "insert into emp_details(email,password,name,age,gender,phone) values(?,?,?,?,?,?)";
		try(Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(query)){
			ps.setString(1, empBean.getEmail());
			ps.setString(2, empBean.getPassword());
			ps.setString(3, empBean.getName());
			ps.setString(4, empBean.getAge());
			ps.setString(5, empBean.getGender());
			ps.setString(6, empBean.getPhone());
		return	ps.executeUpdate() == 1;
		}	
	}
	
	public List<EmployeeBean> viewList() throws SQLException{
		List<EmployeeBean> empList = new ArrayList<>();
		String query = "select * from emp_details";		
		
		try(Connection con = DBConnection.getConnection();
				Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);){
			
			while(rs.next()) {
				String email = rs.getString("email");
				String password = rs.getString("password");
				String name = rs.getString("name");
				String age = rs.getString("age");
				String gender = rs.getString("gender");
				String phone = rs.getString("phone");
				
				EmployeeBean emp = new EmployeeBean(email, password, name, age, gender, phone);
				empList.add(emp);
			}
			
		}
		
		return empList;
	}

	public EmployeeBean getEmployeeByName(String name) throws SQLException {
		String query = "select * from emp_details where name = ?";
		EmployeeBean emp = null;
		
		try(Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(query)){
			ps.setString(1, name);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				String email = rs.getString("email");
				String password = rs.getString("password");
				String age = rs.getString("age");
				String gender = rs.getString("gender");
				String phone = rs.getString("phone");
				
				 emp = new EmployeeBean(email, password, name, age, gender, phone);
			}
		}
		
		return emp;
	}
	
	public boolean updateEmployee(EmployeeBean empBean) throws SQLException {
		String query = "update emp_details set email = ?, password = ?, age = ?, gender = ?, phone = ? where name = ?";
	
	try(Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(query)){
		ps.setString(1, empBean.getEmail());
		ps.setString(2, empBean.getPassword());
		ps.setString(3, empBean.getAge());
		ps.setString(4, empBean.getGender());
		ps.setString(5, empBean.getPhone());
		ps.setString(6, empBean.getName());
		return ps.executeUpdate() == 1;
	}
	
	}
	
	public boolean deleteEmployee(String name) throws SQLException {
		String query = "delete from emp_details where name = ?";
		
		try(Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(query)){
			ps.setString(1, name);
			return ps.executeUpdate() == 1;
		}
	}
	
	
	public List<EmployeeBean> searchEmployeeByNameLike(String nameLike) throws SQLException {
		String query ="select * from emp_details where name like ?";
		List<EmployeeBean> empList = new ArrayList<>();
		try(Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(query)){
			ps.setString(1, "%" + nameLike + "%");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				String email = rs.getString("email");
				String password = rs.getString("password");
				String name = rs.getString("name");
				String age = rs.getString("age");
				String gender = rs.getString("gender");
				String phone = rs.getString("phone");
				
				EmployeeBean emp = new EmployeeBean(email, password, name, age, gender, phone);
				empList.add(emp);
			}
		}
		
		return empList;	
	}
	
	
	
}

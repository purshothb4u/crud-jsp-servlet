<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.util.List" %>
     <%@ page import="com.model.EmployeeBean"%>
      <%@ page import="com.dao.EmployeeDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Employee</title>
<link rel="stylesheet" href="bs/bootstrap.css">
<style type="text/css">
body{
background-color:#FCDC94;
}
#manageH1{
background-color:#704264;
}
#viewForm{
position:absolute;
left:50%;
top:50%;
transform:translate(-50%,-50%);
text-align:center;
height:80vh;
width:85vw;
}

</style>
</head>
<body>

<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		
		if(session.getAttribute("Uname") == null){
			response.sendRedirect("index.jsp");
		}
%>

<div class="container-fluid py-2 " style="background-color:#EF9C66;border-bottom:1px solid #8B322C;">
<div class="row">

<div class="col-3 d-flex justify-content-center align-items-center">
<a href="adminHome.jsp"><button class="btn btn-success me-4 px-4"> BACK </button></a>
<a href="adminHome.jsp"><button class="btn btn-success px-4"> HOME </button></a>
</div>

<div class="col-6">
<h1 align='center' style='color:#1A2130' class="text-capitalize">Welcome ${Uname}</h1>
</div>

<div class="col-3 d-flex justify-content-center align-items-center">
<form action="LogoutServlet">
<button class="btn btn-danger ms-5"> LOGOUT </button>
</form>
</div>

</div>
</div>


<div class="container">
<div id="viewForm">
<h1 class="text-center py-3 text-light" id="manageH1">Manage Employees</h1>
<table class="table table-striped table-success table-bordered border-dark table-hover ">
<thead>
<tr>

<th>Name</th><th>Email</th><th>Password</th><th>Age</th><th>Gender</th><th>Phone</th><th>Actions</th>

</tr>
</thead>
<tbody>
<%  
     EmployeeDAO empDAO = new EmployeeDAO();
	List<EmployeeBean> empList = empDAO.viewList();
	
     if(empList != null && !empList.isEmpty()){
     for(EmployeeBean emp : empList){
%>
<tr >

<td><%= emp.getName() %></td><td><%= emp.getEmail() %></td><td><%= emp.getPassword() %></td>
<td><%= emp.getAge() %></td><td><%= emp.getGender() %></td><td><%= emp.getPhone() %></td>
<td >
    <form action="ManageServlet" method="post" style="display:inline;" class="me-2">
    <input type="hidden" value="<%=emp.getName() %>" name="empName">
    <input type="submit" value="Update" class="btn btn-success" >
    </form>
    <form action="DeleteServlet" method="post" style="display:inline;" class="ms-2">
    <input type="hidden" value="<%=emp.getName() %>" name="empName">
    <input type="submit" value="Delete" class="btn btn-danger">
    </form>

</td>

</tr>
            <% 
                    } 
                } else {
            %>
            <tr>
                <td colspan="6" class="text-center py-4">No users found</td>
            </tr>
            
            <% } %>
</tbody>
</table>
</div>
</div>
</body>
</html>
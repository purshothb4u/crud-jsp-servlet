<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
     <%@ page import="com.model.EmployeeBean"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Page</title>
<link rel="stylesheet" href="bs/bootstrap.css">
<style type="text/css">
body{
background-color:#FCDC94;
}
#updateForm{
position:absolute;
top:50%;
left:50%;
transform:translate(-50%,-50%);
background-color:#AF8260;
min-height:50vh;
width:32vw;
border:2px solid black;
box-shadow:-2px -2px 7px black;
}
.row{
display:flex;
justify-content:center;
align-items:center;

}

#updateForm input{
padding-left:20px;
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
<a href="manage.jsp"><button class="btn btn-success me-4 px-4"> BACK </button></a>
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
<form action="UpdateServlet" method="post" id="updateForm" class="rounded-4">
<h1 align="center" class="my-4">Update Employee</h1>

<%
EmployeeBean emp = (EmployeeBean) request.getAttribute("empBean");
     if(emp != null){
    	
%>

<div class="row my-3">
<div class="col-2">
<label for="name" class="fw-bold form-label">Name</label>
</div>
<div class="col-8">
<input type="text" class="form-control" name="name" id="name" value="<%= emp.getName() %>" readonly >
</div>
</div>

<div class="row my-3">
<div class="col-2">
<label for="email" class="fw-bold form-label">Email</label>
</div>
<div class="col-8">
<input type="email" class="form-control" name="email" id="email"  placeholder="name@example.com" value="<%= emp.getEmail() %>">
</div>
</div>

<div class="row my-3">
<div class="col-2">
<label for="password" class="fw-bold form-label">Password</label>
</div>
<div class="col-8">
<input type="password" class="form-control" name="password" id="password" value="<%= emp.getPassword() %>">
</div>
</div>

<div class="row my-3">
<div class="col-2">
<label for="age" class="fw-bold form-label">Age</label>
</div>
<div class="col-8">
<input type="number" class="form-control" name="age" id="age" value="<%= emp.getAge() %>">
</div>
</div>

<div class="row my-3">
<div class="col-2">
<label for="gender" class="fw-bold form-label">Gender</label>
</div>
<div class="col-8">
<input type="text" class="form-control" name="gender" id="gender" value="<%= emp.getGender() %>" readonly >
</div>
</div>

<div class="row my-3">
<div class="col-2">
<label for="phone" class="fw-bold form-label">Phone</label>
</div>
<div class="col-8">
<input type="tel" class="form-control" name="phone" id="phone" value="<%= emp.getPhone() %>">
</div>
</div>

<div class="mt-4 mb-5" align="center" >
<input type="submit" value="Update" class="btn px-4 " style="background-color:#FCDC94;">
</div>
          <% } %>
</form>
</div>
</body>
</html>
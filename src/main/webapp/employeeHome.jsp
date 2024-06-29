<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.util.List" %>
     <%@ page import="com.model.EmployeeBean"%>
      <%@ page import="com.dao.EmployeeDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Home</title>
<link rel="stylesheet" href="bs/bootstrap.css">
<style type="text/css">
body{
background-color:#FCDC94;
}
#formSearch{
background-color:#DD5746;

}
#searchCol{
display:flex;
justify-content:space-evenly;
align-items:center;
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
<a href="index.jsp"><button class="btn btn-success me-4 px-4"> BACK </button></a>
<a href="employeeHome.jsp"><button class="btn btn-success px-4"> HOME </button></a>
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


<div class="container mt-3" >

<form class="form-inline" action="SearchServlet" method="get" id="formSearch">

<div class="row py-3">

<div class="col-5" id="searchCol">

<div class="col-6 ms-4">
<input name="searchInput" type="search" placeholder="Search by Employee Name" class="form-control">
</div>
<div class="col-4">
<input  type="submit" placeholder="Search by Employee Name" class="btn btn-outline-dark px-4 " value="Search">
</div>

</div>

<div class="col-7" >
<h2>Employee Details</h2>
</div>

</div>

</form>
<table class="table table-danger table-striped table-bordered border-dark table-hover mt-2 text-center" id="table">
<thead>
<tr>
<th>Name</th><th>Email</th><th>Age</th><th>Gender</th><th>Phone</th>
</tr>
</thead>

<tbody>
<% 
    List<EmployeeBean> empList = (List<EmployeeBean>) request.getAttribute("empList");
    if(empList != null && !empList.isEmpty()){
        for(EmployeeBean emp : empList){

%>
<tr>

<td><%= emp.getName() %></td><td><%= emp.getEmail() %></td>
<td><%= emp.getAge() %></td><td><%= emp.getGender() %></td><td><%= emp.getPhone() %></td>

</tr>


<%     }
    }
    else {
    	
    	%>
    	 <tr>
              <td colspan="5" class="text-center py-3">No users found</td>
         </tr>
  <%   } %>
</tbody>
</table>
</div>
</body>
</html>
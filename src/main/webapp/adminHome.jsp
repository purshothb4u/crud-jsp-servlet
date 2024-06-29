<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Home Page</title>
<link rel="stylesheet" href="bs/bootstrap.css">
<style type="text/css">

#body{
background-color:#FCDC94;

}

#form{
position:absolute;
left:50%;
top:50%;
transform:translate(-50%,-50%);
background-color:#028391;
width:40vw;
padding: 20px;
border-radius: 10px;

border: 2px solid black;
box-shadow: -2px -2px 5px black;
}

h2{
width:28vw;
height:15vh;
background-color:#C8CFA0 ;
margin:5%;
display: flex;
justify-content: center;
align-items: center;
margin-left: auto;
margin-right: auto;
border-radius: 10px;
cursor:pointer;
}
a{
text-decoration:none;
color:#153448;
}

</style>
</head>
<body id="body">

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


<div class="container" id="container">
<form action="" id="form">
 
<div class="row g-3 mx-4">

<div class="col-12">
<a href="register.jsp"><h2 class="my-4">Add New Employee Details</h2></a>
</div>

<div class="col-12">
<a href="manage.jsp"><h2 class="my-4">Update Employee Details</h2></a>
</div>

<div class="col-12">
<a href="viewList.jsp"><h2 class="my-4">View Employees List</h2></a>
</div>

</div>

</form>
</div>
</body>
</html>
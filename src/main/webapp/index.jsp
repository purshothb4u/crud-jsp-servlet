<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<link rel="stylesheet" href="bs/bootstrap.css">
<style>
#form{
position:absolute;
top:50%;
left:50%;
transform:translate(-50%,-50%);
width:25vw;
height:47vh;
background-color:#EF9C66;
border-radius:20px;

border: 2px solid black;
box-shadow: -2px -2px 7px black;
}

</style>
</head>

<body style="background-color:#FCDC94;">
<div class="container " >

<div class="row" id="form">
<div class="col">

<form action="LoginServlet" method="post" class="form mx-3" id="loginForm">

<h1 class="text-center my-3">Login Page</h1>

<div class="mb-3">
  <label for="username" class="form-label">UserName</label>
  <input type="text" class="form-control" id="username" name="username">
  <div class="error mt-1" style="color:red; font-weight:bold"></div>
</div>

<div class="mb-3">
  <label for="password" class="form-label">Password</label>
  <input type="password" class="form-control" id="password" name="password">
   <div class="error mt-1" style="color:red; font-weight:bold"></div>
</div>

<div class="mt-4" align="center" >
<input type="submit" value="Login" class="btn px-4 mx-2" style="background-color:#FCDC94;" >
<input type="reset" value="Reset" class="btn px-4 mx-2" style="background-color:#FCDC94;">
</div>

<!-- <p class="text-center mt-3 text-dark">New users :  -->
<!-- <a href="register.jsp" class="text-dark fw-bold">Register here</a></p> -->

</form>
</div>
</div>
</div>


<script type="text/javascript">

document.getElementById("loginForm").addEventListener("submit", (event)=> {
	event.preventDefault();
	login();
	});

function login(){
 let unameElement = document.getElementById("username");
 let upassElement = document.getElementById("password");
	    
 let uname = unameElement.value.trim();
 let upass = upassElement.value.trim();
 
 let isValid = true;
 
//Name Validation
 if(uname === ''){
	 setError(unameElement,"Username is required");
	 isValid = false;
 }
 else if(uname.length < 3){
	 setError(unameElement,"minimum 3 letters");
	 isValid = false;
 }
 else {
	 setSuccess(unameElement);
 }
 
//Password Validation	
 if(upass === ''){
	 setError(upassElement,"password is required");
	 isValid = false;
 }
  else if(!validPassword(upass)){
	 setError(upassElement,"Atleast one letter and one digit");
	 isValid = false;
 } 
 else {
	 setSuccess(upassElement);
 }
	
 if(isValid){
	 document.getElementById("loginForm").submit();
 }
 
}

function setError(element,message){
	let inputGroup = element.parentElement;
	let errorElement = inputGroup.querySelector(".error");
	errorElement.innerText = message;
}

function setSuccess(element){
	let inputGroup = element.parentElement;
	let errorElement = inputGroup.querySelector(".error");
	errorElement.innerText = '';
}

//Name validation
function validName(name){
const nameRegex = /^[a-zA-Z\s]*$/; // Regular expression to allow only letters and spaces
return nameRegex.test(name);
}

// Email validation 
 function ValidEmail(email) {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; // Regular expression for basic email validation
   return emailRegex.test(email);
 }

//Password validation
 function validPassword(password) {
   const passwordRegex =
     /^(?=.*\d)(?=.*[a-zA-Z])[a-zA-Z\d]+$/; // At least one letter, one digit, and only letters and digits
   return passwordRegex.test(password);
 }
 
 
 // Password validation
/* function validPassword(password) {
    const passwordRegex =
      /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()_+])[A-Za-z\d!@#$%^&*()_+]{8,}$/; //At least one uppercase letter, one lowercase letter, one digit, one symbol, and be at least 8 characters long
  return passwordRegex.test(password);
} */

</script>
</body>
</html>
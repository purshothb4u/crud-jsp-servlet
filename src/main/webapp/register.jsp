<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>
<link rel="stylesheet" href="bs/bootstrap.css">
<style type="text/css">
body{
background-color:#FCDC94;
}
#registerForm{
position:absolute;
left:50%;
top:50%;
transform:translate(-50%,-50%);
min-height:60vh;
min-width:32vw;
background-color:#E1ACAC;
border:2px solid black;
border-radius:20px;
box-shadow:-2px -2px 7px black;

}

.row{
display:flex;
justify-content:center;
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

<form action="RegisterServlet" id="registerForm" method="post">

<h1 class="text-center my-4">Register Page</h1>

<div class="row my-3">
<div class="col-2">
<label for="name" class="fw-bold form-label">Name</label>
</div>
<div class="col-8">
<input type="text" class="form-control" name="name" id="name">
 <div class="error mt-1" style="color:red; font-weight:bold"></div>
</div>
</div>

<div class="row my-3">
<div class="col-2">
<label for="email" class="fw-bold form-label">Email</label>
</div>
<div class="col-8">
<input type="email" class="form-control" name="email" id="email"  placeholder="name@example.com">
 <div class="error mt-1" style="color:red; font-weight:bold"></div>
</div>
</div>

<div class="row my-3">
<div class="col-2">
<label for="password" class="fw-bold form-label">Password</label>
</div>
<div class="col-8">
<input type="password" class="form-control" name="password" id="password">
 <div class="error mt-1" style="color:red; font-weight:bold"></div>
</div>
</div>

<!-- <div class="row my-3">
<div class="col-2">
<label for="cpassword" class="fw-bold form-label">Confirm Password</label>
</div>
<div class="col-8">
<input type="password" class="form-control" name="cpassword" id="cpassword">
 <div class="error mt-1" style="color:red; font-weight:bold">Confirm Password is required</div>
</div>
</div> -->

<div class="row my-3">
<div class="col-2">
<label for="age" class="fw-bold form-label">Age</label>
</div>
<div class="col-8">
<input type="number" class="form-control" name="age" id="age">
 <div class="error mt-1" style="color:red; font-weight:bold"></div>
</div>
</div>

<div class="row my-3 form-check me-5">
<div class="col-5">
<label class="fw-bold ">Gender</label>
</div>
<div class="col-3">
<input type="radio" class="form-check-input" name="gender" id="gender_male" value="male" checked>
 <label class="form-check-label" for="gender_male">Male</label>
</div>
<div class="col-3">
<input type="radio" class="form-check-input" name="gender" id="gender_female" value="female">
 <label class="form-check-label" for="gender_female">Female</label>
</div>
</div>

<div class="row my-3">
<div class="col-2">
<label for="phone" class="fw-bold form-label">Phone</label>
</div>
<div class="col-8">
<input type="tel" class="form-control" name="phone" id="phone">
 <div class="error mt-1" style="color:red; font-weight:bold"></div>
</div>
</div>

<div class="mt-4 mb-5" align="center" >
<input type="submit" value="Register" class="btn btn-success  px-4 mx-2 " >
<input type="reset" value="Reset" class="btn btn-success px-4 mx-2" >
</div>

</form>
</div>
<script type="text/javascript">

document.getElementById("registerForm").addEventListener("submit", (event)=> {
	event.preventDefault();
	register();
	});

function register(){
	let nameElement = document.getElementById("name");
	let emailElement = document.getElementById("email");
	let passwordElement = document.getElementById("password");
	let ageElement = document.getElementById("age");
	let phoneElement = document.getElementById("phone");
	
	let nameValue = nameElement.value.trim();
	let emailValue = emailElement.value.trim();
	let passwordValue = passwordElement.value.trim();
	let ageValue = Number(ageElement.value.trim());
	let phoneValue = phoneElement.value.trim();
	
	let isValid = true;
	
//Name Validation
	if(nameValue === ''){
		setError(nameElement,"Name is required");
		isValid = false;
	}
	else if(nameValue.length < 3){
		setError(nameElement,"Username must be atleast 3 characters");
		isValid = false;
	}
	else if(!validName(nameValue)){
		setError(nameElement,"Name must contains only letters");
		isValid = false;
	}
	else {
		setSuccess(nameElement);
	}
	
//Email Validation	
	if(emailValue === ''){
		setError(emailElement,"Email is required");
		isValid = false;
	}
	else if(!validEmail(emailValue)){
		setError(emailElement,"Pls enter valid email");
		isValid = false;
	}
	else {
		setSuccess(emailElement);
	}
	
//Password Validation	
	if(passwordValue === ''){
		setError(passwordElement,"Password is required");
		isValid = false;
	}
	else if(!validPassword(passwordValue)){
		setError(passwordElement,"Atleast one letter and one digit");
		isValid = false;
	}
	else {
		setSuccess(passwordElement);
	}
	
	// Age Validation
	console.log("Age value:", ageValue);
	if (ageValue === 0 || isNaN(ageValue)) {
	    console.log("Age is empty or not a number");
	    setError(ageElement, "Age is required");
	    isValid = false;
	} 
	else if (ageValue < 18 || ageValue > 45) {
	    setError(ageElement, "Age must be between 18 and 45");
	    console.log("Age must be between 18 and 45");
	    isValid = false;
	} else {
	    setSuccess(ageElement);
	}

//Phone Validation	
	if(phoneValue === ' '){
		setError(phoneElement,"Phonenumber is required");
		isValid = false;
	}
	else if(phoneValue.length !== 10){
		setError(phoneElement,"Phonenumber must be in 10 digits");
		isValid = false;
	}
	else {
		setSuccess(phoneElement);
	}
	
	if(isValid){
		document.getElementById("registerForm").submit();
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
	errorElement.innerText = '' ; 
}


//Name validation
function validName(name){
const nameRegex = /^[a-zA-Z\s]*$/; // Regular expression to allow only letters and spaces
return nameRegex.test(name);
}

// Email validation 
 function validEmail(email) {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; // Regular expression for basic email validation
   return emailRegex.test(email);
 }

//Password validation
 function validPassword(password) {
   const passwordRegex =
     /^(?=.*\d)(?=.*[a-zA-Z])[a-zA-Z\d]+$/; // At least one letter, one digit, and only letters and digits
   return passwordRegex.test(password);
 }
</script>
</body>
</html>
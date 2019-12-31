<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="/jsp/error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- Isolated Version of Bootstrap, not needed if your site already uses Bootstrap -->
<link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />

<!-- Bootstrap Date-Picker Plugin -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>Registration</title>


</head>
<style>


body { 
  background: url(/E-Living_Mantras/images/yoga-back.jpg) no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}
.userreg{
width:400px;
height:100%;
background-color: #AED6F1  ;
border:5px solid black;
border-radius: 10px;
margin-top:20px;
}
</style>
<body>
<%String info=(String)request.getAttribute("msg3"); %>
<br>
<div class="container-fluid userreg">
<%if(info!=null){
  		%>
  		<div class="alert alert-danger alert-dismissible">
  <button type="button" class="close" data-dismiss="alert">&times;</button>
  <strong>ID!</strong> Already Exists Please Login
</div>
  		<%} %>
<form method="post" action="/E-Living_Mantras/userRegistrationServlet" class="was-validated">
  <div class="form-group">
    <label for="id">User ID:</label>
    <input type="text" class="form-control" id="id" placeholder="Enter ID" name="id" required>
    <div class="valid-feedback"> </div>
    <div class="invalid-feedback">Please fill out this field.</div>
  </div>
  <div class="form-group">
    <label for="password">User Password:</label>
    <input type="password" class="form-control" id="password" placeholder="Enter Password" name="password" required>
    <div class="valid-feedback"> </div>
    <div class="invalid-feedback">Please fill out this field.</div>
  </div>
  
  <div class="form-group">
    <label for="name">Name:</label>
    <input type="text" class="form-control" id="name" placeholder="Enter Name" name="name" required>
    <div class="valid-feedback"> </div>
    <div class="invalid-feedback">Please fill out this field.</div>
  </div>
  
  <div class="form-group">
    <label for="address">Address:</label>
    <input type="text" class="form-control" id="address" placeholder="Enter Address" name="address" required>
    <div class="valid-feedback"> </div>
    <div class="invalid-feedback">Please fill out this field.</div>
  </div>
  
   <div class="form-group">
    <label for="email">Email:</label>
    <input type="email" class="form-control" id="email" placeholder="Enter Email" name="email" required>
    <div class="valid-feedback"> </div>
    <div class="invalid-feedback">Please fill out this field.</div>
  </div>
  
 
<div class="form-group">
  <label for="gender">Gender:</label>
  <select class="form-control" id="gender"name="gender">
    <option>Male</option>
    <option>Female</option>
    <option>Others</option>
    
  </select>
</div>


  <div class="form-group">
    <label for="phone">Phone Number:</label>
    <input type="text" class="form-control" id="phone" placeholder="Enter Phone Number" name="phone" required>
    <div class="valid-feedback"> </div>
    <div class="invalid-feedback">Please fill out this field.</div>
  </div>
  
  
 <div class="form-group">
    <label for="dob">Date of Birth:</label>
    <input type="Date" class="form-control" id="dob" placeholder="Enter DOB" name="dob" required>
    <div class="valid-feedback"> </div>
    <div class="invalid-feedback">Please fill out this field.</div>
  </div>
  
  
  <button type="submit" class="btn btn-success"style="margin-left:40%;">Submit</button>
</form>
<br>
</div>

<br>
<footer class="page-footer font-small blue"style="background-color:blue;">

  <!-- Copyright -->
  <div class="footer-copyright text-center py-3">© 2019 Copyright:
    <a href="http://shivangprofile.ml/?i=1"target="_blank"> Shivang Srivastava</a>
  </div>
</footer>

</body>
</html>
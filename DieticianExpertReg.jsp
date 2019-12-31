<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Yoga Expert</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<style>


body { 
  background: url(/E-Living_Mantras/images/yoga-back.jpg) no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}
.expertreg{
width:400px;
height:100%;
background-color: #AED6F1  ;
border:5px solid black;
border-radius: 10px;
margin-top:20px;
}
</style>
<body>
<%
// main code for login user to get the value of login user
		HttpSession hs=request.getSession(false);
		String studentid=(String)hs.getAttribute("sessionkey");
		 if(studentid==null || hs.isNew()){
			
		}
		else{ 
			
		%>

<br>

<div class="container-fluid expertreg">
<form method="post" action="/E-Living_Mantras/YogaExpertServlet" class="was-validated">
  <div class="form-group">
    <label for="id">ID:</label>
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
    <label for="city">City:</label>
    <input type="text" class="form-control" id="city" placeholder="Enter City" name="city" required>
    <div class="valid-feedback"> </div>
    <div class="invalid-feedback">Please fill out this field.</div>
  </div>
  
 
<div class="form-group">
  <label for="sel1">Gender:</label>
  <select class="form-control" id="gender" name="gender">
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
    <label for="Qualification">Qualification:</label>
    <input type="text" class="form-control" id="Qualification" placeholder="Enter Qualification" name="Qualification" required>
    <div class="valid-feedback"> </div>
    <div class="invalid-feedback">Please fill out this field.</div>
  </div>
  
  <div class="form-group">
    <label for="college">College:</label>
    <input type="text" class="form-control" id="college" placeholder="Enter college" name="college" required>
    <div class="valid-feedback"> </div>
    <div class="invalid-feedback">Please fill out this field.</div>
  </div>
  
  <div class="form-group">
    <label for="experience">Experience:</label>
    <input type="text" class="form-control" id="experience" placeholder="Enter college" name="experience" required>
    <div class="valid-feedback"> </div>
    <div class="invalid-feedback">Please fill out this field.</div>
  </div>
  
   <div class="form-group">
    <label for="skills">Skills:</label>
    <input type="text" class="form-control" id="skills" placeholder="Enter skills seperated by comma" name="skills" required>
    <div class="valid-feedback"> </div>
    <div class="invalid-feedback">Please fill out this field.</div>
  </div>
  
   <div class="form-group">
    <label for="Certificate">Certificate Number:</label>
    <input type="text" class="form-control" id="Certificate" placeholder="Enter Certificate Number" name="Certificate" required>
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
<%} %>




</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="/jsp/error.jsp"%>
    
     <%@page import="java.sql.*" %>
    <%@page import="eliving.dbtasks.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>Admin Profile</title>
 
</head>
<style>
  .dash{
  
  hight:100%;
  background-color: black;
  border:4px solid #979A9A;
  
  }
  a{
  color:white;
  }
  a:hover{
  text-decoration: underline;
  color:white;
  }
 body{
 background-color: #D0D3D4;
 }
 
  </style>
<body>
<%
// main code for login user to get the value of login user
		HttpSession hs=request.getSession(false);
		String studentid=(String)hs.getAttribute("sessionkey");
		if(studentid==null || hs.isNew()){
			%>
			 <script>
			 document.location.href ="/E-Living_Mantras/jsp/login.jsp";
			 </script>
			 <%
		}
		else{ 
			
		%>
<nav class="navbar navbar-expand-lg bg-dark navbar-dark">
  <a class="navbar-brand" href="/E-Living_Mantras/Dietician/DietYogahome.jsp"><%=studentid %></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="/E-Living_Mantras/Dietician/addtips.jsp">Add Tips</a>
      </li>
     
      
    
    
      <li class="nav-item">
        <a class="nav-link" href="/E-Living_Mantras/Dietician/deletetips.jsp">Delete Tips</a>
      </li>
      
      
      
    
      <li class="nav-item">
        <a class="nav-link" href="/E-Living_Mantras/jsp/userreg.jsp">User Registration</a>
      </li>
      </ul>
      </div>
     
    
    
    
       
    
  
</nav>

<div class="row container-fluid">
<div class="col-sm-2 dash"style="margin-top: 30px;margin-left: 70px; height:100%;">

<br>
<div style="border-bottom:1px solid #979A9A; width:100%; ">
<ul>

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras/Dietician/DietYogahome.jsp" >Dashboard</a></li>
</ul>
</div>
<br>
<div style="border-bottom:1px solid #979A9A; width:100%">
<ul>

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras/Dietician/expertcompose.jsp">Compose</a></li>
</ul>
</div>
<br>
<div style="border-bottom:1px solid #979A9A; width:100%">
<ul>

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras/Dietician/expertinbox.jsp">Inbox</a></li>
</ul>
</div>
<br>
<div style="border-bottom:1px solid #979A9A; width:100%">
<ul>

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras/Dietician/expertsentitems.jsp"style="color:white;" >Sent Items</a></li>
</ul>
</div>
<br>
<div style="border-bottom:1px solid #979A9A; width:100%">
<ul>

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras/Dietician/expertprofile.jsp"style="color:white;">View Profile</a></li>
</ul>
</div>
<br>
<div style="border-bottom:1px solid #979A9A; width:100%">
<ul>

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras/Dietician/editexpertprofile.jsp" style="color:blue;">Edit Profile</a></li>
</ul>
</div>
<br>

<ul>

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras//Logout">Logout</a></li>
</ul>

</div>
<br>


<div class="col-sm-9"style="margin-top: 30px;margin-left:25px; border-radius:10px;">

<%
   String strsql="select * from experts where ExpertId=?";
	//we have to send it to a java file
	ResultSet rsdata=CrudOperation.getData(strsql,studentid);// now go to crudoperation class
	if(rsdata.next())
	{//rs->column and ps->variable name
	String name=rsdata.getString("Name");
	String address=rsdata.getString("Address");
	String city=rsdata.getString("city");
	String phone=rsdata.getString("PhoneNo");
	String qualification=rsdata.getString("Qualifications");
	String skills=rsdata.getString("skills");
	String certi=rsdata.getString("CertificateNo");
%>
<!-- HTML
 -->
 <div class="container-fluid" style="border:2px solid black; color:white;">
<form action="/E-Living_Mantras/editexpertprofile" class="was-validated" method="post">
  <div class="form-group">
    <label for="name">Name:</label>
    <input type="text" class="form-control" value="<%=name %>" name="name" required>
    <div class="valid-feedback"> </div>
    <div class="invalid-feedback">Please fill out this field.</div>
  </div>
  <div class="form-group">
    <label for="address">Address:</label>
    <input type="text" class="form-control" value="<%=address %>"  name="address" required>
    <div class="valid-feedback"> </div>
    <div class="invalid-feedback">Please fill out this field.</div>
  </div>
  
  <div class="form-group">
    <label for="">City:</label>
    <input type="text" class="form-control" value="<%=city %>"  name="city" required>
    <div class="valid-feedback"> </div>
    <div class="invalid-feedback">Please fill out this field.</div>
  </div>
  <div class="form-group">
    <label for="phone">Phone Number:</label>
    <input type="text" class="form-control" value="<%=phone %>"  name="phone" required>
    <div class="valid-feedback"> </div>
    <div class="invalid-feedback">Please fill out this field.</div>
  </div>
  
  <div class="form-group">
    <label for="qualification">Qualification:</label>
    <input type="text" class="form-control" value="<%=qualification %>"  name="qualification" required>
    <div class="valid-feedback"> </div>
    <div class="invalid-feedback">Please fill out this field.</div>
  </div>
  
  <div class="form-group">
    <label for="skills">Skills:</label>
    <input type="text" class="form-control" value="<%=skills %>"  name="skills" required>
    <div class="valid-feedback"> </div>
    <div class="invalid-feedback">Please fill out this field.</div>
  </div>
  
  <div class="form-group">
    <label for="certificate">Certificate Number:</label>
    <input type="text" class="form-control" value="<%=certi %>"  name="certificate" required>
    <div class="valid-feedback"> </div>
    <div class="invalid-feedback">Please fill out this field.</div>
  </div>
  
  <button type="submit" class="btn btn-primary" style="margin-left:45%;" onclick='msg()'>Update</button>
</form>
  <br>
</div>
<% } %>
</div>

</div>


<!-- ...................footer.......................................... -->
<br>
<footer class="page-footer font-small blue"style="background-color:blue;position:relative; top:10px">

  <!-- Copyright -->
  <div class="footer-copyright text-center py-3">© 2019 Copyright:
    <a href="http://shivangprofile.ml/?i=1"target="_blank"> Shivang Srivastava</a>
  </div>
  <!-- Copyright -->

</footer>
<script>
function msg(){

alert("Are You Sure You want to change your Data");
}

</script>




<%} %>


</body>
</html>
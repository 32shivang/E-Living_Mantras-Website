<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="/jsp/error.jsp"%>
     <%@page import="java.sql.*" %>
    <%@page import="eliving.dbtasks.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<style>
body{

background-color: #0895F4  ;
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
		
		<div style="background-color: #0895F4; height:100%" >
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="/E-Living_Mantras/jsp/userhome.jsp"><%=studentid %></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
     
      <li class="nav-item">
        <a class="nav-link" href="/E-Living_Mantras/jsp/services.jsp">Our Services</a>
      </li>
      
       <li class="nav-item">
        <a class="nav-link " href="/E-Living_Mantras/jsp/Tips.jsp">Tips</a>
      </li>
      
       <li class="nav-item">
        <a class="nav-link" href="/E-Living_Mantras/jsp/contact.jsp">ContactUs</a>
      </li>
      
      
    
    <li class="nav-item dropdown" style="float:right;">
      <a class="nav-link dropdown-toggle active" href="#" id="navbardrop" data-toggle="dropdown">
        <img src="/E-Living_Mantras/images/avatar1.png" alt="Logo" style="width:20px;"><%=studentid %> view your Account
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item active" href="/E-Living_Mantras/jsp/useraccount.jsp">My Account</a>
        <a class="dropdown-item" href="/E-Living_Mantras/Logout">Logout</a>
        
      </div>
    </li>
      </ul>
      
      
    
  
  </div>
</nav>

<div class="container-fluid">
    <!-- Control the column width, and how they should appear on different devices -->
    <div class="row" style="margin-bottom:80px;">
      <div class="col-sm-2" style=" margin-left:120px;margin-top:-30px; ">
      
     <div style="background-color: #34495E; width:180px; height:270px; margin-top:70%; border:2px solid white;">

<br>
<div style="border-bottom:1px solid #979A9A; width:100%">
<ul>

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras/jsp/usercompose.jsp"style="color:#F5B041;">Compose</a></li>
</ul>
</div>
<br>
<div style="border-bottom:1px solid #979A9A; width:100%">
<ul>

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras/jsp/userinbox.jsp"style="color:#F5B041;">Inbox</a></li>
</ul>
</div>
<br>
<div style="border-bottom:1px solid #979A9A; width:100%">
<ul>

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras/jsp/usersentmsg.jsp"style="color:#F5B041;">Sent Items</a></li>
</ul>
</div>
<br>


<div style=" width:100%">
<ul>

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras/jsp/edituserprofile.jsp"style="color:#F5B041;">Edit Profile</a></li>
</ul>

</div>

</div>
      
      </div>
      <div class="col-sm-7" style=" margin-left:10px;margin-top:60px; background-color: #D7DBDD;border-radius:10px;">
      <%
   String strsql="select * from userdetails where Userid=?";
	//we have to send it to a java file
	ResultSet rsdata=CrudOperation.getData(strsql,studentid);// now go to crudoperation class
	if(rsdata.next())
	{//rs->column and ps->variable name
	String name=rsdata.getString("Name");
	String address=rsdata.getString("Address");
	String phone=rsdata.getString("PhoneNo");
	
%>
	<div class="container-fluid" style=" color:white; margin-top:20px;">
<form action="/E-Living_Mantras/edituserprofile" class="was-validated" method="post" >
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
    <label for="">Phone Number:</label>
    <input type="text" class="form-control" value="<%=phone %>"  name="phone" required>
    <div class="valid-feedback"> </div>
    <div class="invalid-feedback">Please fill out this field.</div>
  </div>
  <button type="submit" class="btn btn-primary" style="margin-left:45%;" onclick='msg()'>Update</button>
  </form>
 <br>
  </div>
   <%} %>
      </div>
      
      </div>
      </div>
      </div>
     <%} %>
     

</body>
</html>
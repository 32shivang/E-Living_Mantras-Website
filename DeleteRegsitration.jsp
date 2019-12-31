<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="/jsp/error.jsp"%>
    
    <%@page import="java.sql.*" %>
    <%@page import="eliving.dbtasks.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Accounts</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
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
  <a class="navbar-brand" href="/E-Living_Mantras/Admin/adminhome.jsp"><%=studentid %></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      
      <li class="nav-item">
        <a class="nav-link" href="/E-Living_Mantras/Admin/ViewRegsitration.jsp">View Registrations</a>
      </li>
      
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="/E-Living_Mantras/Admin/DeleteRegsitration.jsp">Delete Registrations</a>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Registration
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="/E-Living_Mantras/jsp/userreg.jsp">User Registration</a>
          <a class="dropdown-item" href="/E-Living_Mantras/YogaExpert/YogaExpertReg.jsp">Yoga Expert Registration</a>
          <a class="dropdown-item" href="/E-Living_Mantras/Dietician/DieticianExpertReg.jsp">Dietician Registration</a>
          
      </li>
     
    </ul>
    
  </div>
</nav>
<br>
<h2 style="text-align: center;">LIST OF ALL USERS</h2>
<div class="container">
<form action="/E-Living_Mantras/userdelete" method="post">
<table class="table table-hover table-bordered">
    <thead>                                                
      <tr>
      	<th> </th>
        <th>USER ID</th>
        <th>NAME</th>
        <th>ADDRESS</th>
        <th>EMAIL</th>
        <th>GENDER</th>
        <th>PHONE NUMBER</th>
        <th>DATE OF REGISTRATION</th>
      </tr>
    </thead>
    
<%
   String strsql="select * from userdetails";
	//we have to send it to a java file
	ResultSet rsdata=CrudOperation.getData(strsql);// now go to crudoperation class
	
	
	while(rsdata.next()){//rs->column and ps->variable name
	String id=rsdata.getString("Userid");	
	String name=rsdata.getString("Name");
	String address=rsdata.getString("Address");
	String email=rsdata.getString("Email");
	String gender=rsdata.getString("Gender");
	String phone=rsdata.getString("PhoneNo");
	String dor=rsdata.getString("dor");
	
%>

 
 
<tbody>
<tr> 
<th><input type="checkbox" name="chk" value="<%=id%>"></th>
<td><%=id %></td>
<td><%=name %></td>
<td><%=address %></td>
<td><%=email %></td>
<td><%=gender %></td>
<td><%=phone %></td>
<td><%=dor %></td>
</tr>
</tbody>



<% } %>
<tr><th colspan="9" style="text-align: center;"><Button type="submit" class="btn-success" style="border:2px solid red; 
border-radius: 10px; width:150px;">Delete</Buton></th></tr>
</table>
</form>
</div>

<br>
<h2 style="text-align: center;">LIST OF ALL EXPERTS</h2>
<div class="container">
<form action="/E-Living_Mantras/expertdelete" method="post">
<table class="table table-hover table-bordered">
    <thead>
      <tr>
      	<th> </th>
        <th>EXPERT ID</th>
        <th>NAME</th>
        <th>ADDRESS</th>
        <th>EMAIL</th>
        <th>GENDER</th>
        <th>PHONE NUMBER</th>
        <th>EXPERIENCE</th>
        <th>EXPERT TYPE</th>
      </tr>
    </thead>
    
<%
   String str="select * from experts";
	//we have to send it to a java file
	ResultSet rsexp=CrudOperation.getData(str);// now go to crudoperation class
	
	
	while(rsexp.next()){//rs->column and ps->variable name
	String id=rsexp.getString("ExpertId");	
	String name=rsexp.getString("Name");
	String address=rsexp.getString("Address");
	String email=rsexp.getString("Email");
	String gender=rsexp.getString("Gender");
	String phone=rsexp.getString("PhoneNo");
	String experience=rsexp.getString("Experience");
	String type=rsexp.getString("ExpertType");
	
%>

 
 
<tbody>
<tr> 
<th><input type="checkbox" name="chk1" value="<%=id%>"></th>
<td><%=id %></td>
<td><%=name %></td>
<td><%=address %></td>
<td><%=email %></td>
<td><%=gender %></td>
<td><%=phone %></td>
<td><%=experience %></td>
<td><%=type %></td>
</tr>

</tbody>



<% } %>
<tr><th colspan="9" style="text-align: center;"><Button type="submit" class="btn-success" style="border:2px solid red; 
border-radius: 10px; width:150px;">Delete</Buton></th></tr>
</table>

</form>
</div>
<%} %>

</body>
</html>
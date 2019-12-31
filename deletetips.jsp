<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="/jsp/error.jsp"%>
    <%@page import="java.sql.*" %>
    <%@page import="eliving.dbtasks.*" %>
    <%@page import="java.text.DecimalFormat" %>
    
    <%! int growth=0; %>
    <%! int users=0,yogaex=0,diet=0,m=0,f=0;%>
    <%! int mpercent=0 ,fpercent=0; %>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Experts Home</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  
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
 margin:0px;
 background-color: #D0D3D4;
 }
 
  </style>
</head>
<body>
<%
String id = request.getParameter("start");
String info=(String)request.getAttribute("msg");
%>
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

<div style="background-color: #D0D3D4;">
<div class="row container-fluid " id="left" >
<div class="col-sm-2 dash"style="margin-top: 30px;margin-left: 70px;">

<br>
<div style="border-bottom:1px solid #979A9A; width:100%; ">
<ul>

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras/Dietician/DietYogahome.jsp" style="color:blue;">Dashboard</a></li>
</ul>
</div>
<br>
<div style="border-bottom:1px solid #979A9A; width:100%">
<ul>

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras/Admin/admincompose.jsp"style="color:white;">Compose</a></li>
</ul>
</div>
<br>
<div style="border-bottom:1px solid #979A9A; width:100%">
<ul>

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras/Admin/admininbox.jsp"style="color:white;">Inbox</a></li>
</ul>
</div>
<br>
<div style="border-bottom:1px solid #979A9A; width:100%">
<ul>

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras/Admin/adminsentitems.jsp"style="color:white;">Sent Items</a></li>
</ul>
</div>
<br>
<div style="border-bottom:1px solid #979A9A; width:100%">
<ul>

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras/Admin/adminprofile.jsp"style="color:white;">View Profile</a></li>
</ul>
</div>
<br>
<div style="border-bottom:1px solid #979A9A; width:100%">
<ul>

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras/Admin/editadminprofile.jsp"style="color:white;">Edit Profile</a></li>
</ul>
</div>
<br>

<ul>

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras//Logout"style="color:white;">Logout</a></li>
</ul>

</div>
<br>
<div class="col-sm-9"style="margin-top: 30px;margin-left:25px; border-radius:10px;" id="right">
<%if(info!=null){
  		%>
  		<div class="alert alert-success alert-dismissible">
  <button type="button" class="close" data-dismiss="alert">&times;</button>
  <strong>No!</strong> Record To Delete
</div>
  		<%} %>
<form method="post" action="/E-Living_Mantras/deletetips">
<table class="table" style="border: 2px solid black;">
	<thead>
	<tr>
		
		<th colspan=3 style="font-size: 22px;text-align: center;">DELETE TIPS</th>
		
		
	</tr>
	</thead>
<% 
	String strsql="select * from tips where Userid=?";
	//we have to send it to a java file
	ResultSet rsdata=CrudOperation.getData(strsql,studentid);
	%>
	
	<% 
	int i=0;
	rsdata.afterLast();
	while(rsdata.previous()){
		i=i+1;
		String tipsid=rsdata.getString("Tipsid");
		String userid=rsdata.getString("Userid");
		String date=rsdata.getString("Date");
		String Tips=rsdata.getString("Tips");
		%>
		
		<tbody>
		<tr>
		<th> <input type="checkbox" value="<%=tipsid%>" name="chk"> </th>
		<th><%=date %></th>
		<th><%=Tips %></th>
		</tr>
		</tbody>
		
		<%}%>
		<tr><th colspan="3" style="text-align: center;"><Button type="submit"class="btn-success" style="border:2px solid red; 
border-radius: 10px; width:150px;">Delete</Button></th></tr>
		</table>
</form>

</div>
</div>
</div>
<%} %>
</body>
</html>
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
  <a class="navbar-brand" href="/E-Living_Mantras/Admin/adminhome.jsp"><%=studentid %></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="/E-Living_Mantras/Admin/ViewRegsitration.jsp">Add Tips</a>
      </li>
      
     
      
    
    
      <li class="nav-item">
        <a class="nav-link" href="/E-Living_Mantras/Admin/DeleteRegsitration.jsp">Delete Tips</a>
      </li>
      
      
      
    
      <li class="nav-item">
        <a class="nav-link" href="/E-Living_Mantras/Admin/DeleteRegsitration.jsp">Delete Tips</a>
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
<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras/Dietician/DietYogahome.jsp" style="color:blue;" >Dashboard</a></li>
</ul>
</div>
<br>
<div style="border-bottom:1px solid #979A9A; width:100%">
<ul>

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras/Dietician/expertcompose.jsp" style="color:white;">Compose</a></li>
</ul>
</div>
<br>
<div style="border-bottom:1px solid #979A9A; width:100%">
<ul>

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras/Dietician/expertinbox.jsp" style="color:white;">Inbox</a></li>
</ul>
</div>
<br>
<div style="border-bottom:1px solid #979A9A; width:100%">
<ul>

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras/Dietician/expertsentitems.jsp" style="color:white;">Sent Items</a></li>
</ul>
</div>
<br>
<div style="border-bottom:1px solid #979A9A; width:100%">
<ul>

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras/Dietician/expertprofile.jsp" style="color:white;">View Profile</a></li>
</ul>
</div>
<br>
<div style="border-bottom:1px solid #979A9A; width:100%">
<ul>

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras/Dietician/editexpertprofile.jsp" style="color:white;">Edit Profile</a></li>
</ul>
</div>
<br>

<ul>

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras//Logout"style="color:white;" >Logout</a></li>
</ul>


</div>
<br>
<div class="col-sm-9"style="margin-top: 30px;margin-left:25px; border-radius:10px;" id="right">

<% 
String id1 = request.getParameter("start");

%>
<h2 style="text-align: center;"><%=id1 %></h2>
<div class="container">

    
    <%
   String str="select * from userdetails where Userid=?";
	//we have to send it to a java file
	
	ResultSet rsexp=CrudOperation.getData(str,id1);// now go to crudoperation class
	if(rsexp.next()){
	String name=rsexp.getString("Name");
	String address=rsexp.getString("Address");
	String email=rsexp.getString("Email");
	String gender=rsexp.getString("gender");
	String phone=rsexp.getString("PhoneNo");
	String dor=rsexp.getString("Dor");
	
%>
    
   
<table class="table table-dark table-striped">
   <tr><th>NAME</th><td><%=name %></td></tr>
   <tr><th>ADDRESS</th><td><%=address %></td></tr>
        <tr><th>EMAIL</th><td><%=email %></td></tr>
        <tr><th>GENDER</th><td><%=gender %></td></tr>
        <tr><th>PHONE NUMBER</th><td><%=phone %></td></tr>
        <tr><th>DOR</th><td><%=dor %></td></tr>
    	<tr><th colspan=2><button type="submit" class="btn btn-primary form-control" onclick="send()">Send Message</button></th></tr>

    
    </table>

</div>
</div>

<%} 
	else{
		%>
		<h2>Data Not available </h2>
		<%
	}

%>




<script>
function send(){
	document.location.href ="/E-Living_Mantras/Dietician/expertcompose.jsp";
	
}


</script>


</div>
</div>
</div>
<%} %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="/jsp/error.jsp"%>
    <%@page import="java.sql.*" %>
    <%@page import="eliving.dbtasks.*" %>
    <%@page import="java.util.*" %>
   <%! int i; %>
   <%! int j; %>
   <%! String arr; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sent Items</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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
String info=(String)request.getAttribute("msg2");
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


<div class="row container-fluid">
<div class="col-sm-2 dash"style="margin-top: 30px;margin-left: 50px;">

<br>
<div style="border-bottom:1px solid #979A9A; width:100%; ">
<ul>

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras/Admin/adminhome.jsp">Dashboard</a></li>
</ul>
</div>
<br>
<div style="border-bottom:1px solid #979A9A; width:100%">
<ul>

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras/Admin/admincompose.jsp">Compose</a></li>
</ul>
</div>
<br>
<div style="border-bottom:1px solid #979A9A; width:100%">
<ul>

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras/Admin/admininbox.jsp">Inbox</a></li>
</ul>
</div>
<br>
<div style="border-bottom:1px solid #979A9A; width:100%">
<ul>

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras/Admin/adminsentitems.jsp" style="color:blue">Sent Items</a></li>
</ul>
</div>
<br>
<div style="border-bottom:1px solid #979A9A; width:100%">
<ul>

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras/Admin/adminprofile.jsp">View Profile</a></li>
</ul>
</div>
<br>
<div style="border-bottom:1px solid #979A9A; width:100%">
<ul>

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras/Admin/editadminprofile.jsp">Edit Profile</a></li>
</ul>
</div>
<br>

<ul>

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras//Logout">Logout</a></li>
</ul>

</div>

<div class="col-sm-9 container"style="margin-top: 30px;margin-left:15px; border-radius:10px;">
<%if(info!=null){
  		%>
  		<div class="alert alert-success alert-dismissible">
  <button type="button" class="close" data-dismiss="alert">&times;</button>
  <strong>No!</strong> Record To Delete
</div>
  		<%} %>
<form method="post" action="/E-Living_Mantras/sentmsgdeladmin">
<table class="table table-striped"id="myTable">
<thead>
		<tr>
		<th> Delete</th>
		
		<th> Receiver Id</th>
        <th>Subject</th>
        <th>Date of Message</th>
        </tr>
</thead>
<%
   String strsql="select * from sentitem where Senderid=?";
	//we have to send it to a java file
	ResultSet rsdata=CrudOperation.getData(strsql,studentid);// now go to crudoperation class
	
	rsdata.afterLast();
	while(rsdata.previous())
	{//rs->column and ps->variable name
		
	
	String i=rsdata.getString("Msgid");
	String rec=rsdata.getString("Receiverid");
	String sub=rsdata.getString("Subject");
	String date=rsdata.getString("Dateofmsg");
%>

<tbody>
      <tr>
      <th > <input type="checkbox" value="<%=i%>" name="chk"></th>
        
        <td onclick="al()"style="cursor: pointer;"id="serial"><%=rec%></td>
        <td onclick="al()"style="cursor: pointer;"><%=sub %></td>
        <td onclick="al()"style="cursor: pointer;"><%= date%></td>
       </tr>
      </tbody>
  
  

<%}%>
<tr><th colspan="5" style="text-align: center; "><Button type="submit" class="btn-success" style="border:2px solid red; 
border-radius: 10px; width:150px;">Delete</Button></th></tr>
</table>
</form>
</div>


</div>

<br><br>
<footer class="page-footer font-small blue"style="background-color:blue;">

  <!-- Copyright -->
  <div class="footer-copyright text-center py-3">© 2019 Copyright:
    <a href="http://shivangprofile.ml/?i=1"target="_blank"> Shivang Srivastava</a>
  </div>
  <!-- Copyright -->

</footer>
<%} %>


<script>


function al(){
	$(document).ready(function(){
	$("#myTable tr").click(function() {
		 var row = parseInt( $(this).parent().index()-1 ); 
		 document.location.href ="/E-Living_Mantras/Admin/showsentmessage.jsp?start="+row;
	    });
	});

		
	}
</script>





</body>
</html>
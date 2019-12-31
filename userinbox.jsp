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
<title>Inbox</title>
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
String info=(String)request.getAttribute("msg");
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
      <div class="col-sm-2" style=" margin-left:120px;margin-top:-20px; ">
      
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
      
      <form method="post" action="/E-Living_Mantras/msgdelete">
      <%if(info!=null){
  		%>
  		<div class="alert alert-success alert-dismissible">
  <button type="button" class="close" data-dismiss="alert">&times;</button>
  <strong>No!</strong> Record To Delete
</div>
  		<%} %>
<table class="table table-striped"id="myTable">
<thead>
		<tr>
		<th> Delete</th>
		
		<th> Sender Id</th>
        <th>Subject</th>
        <th>Date of Message</th>
        </tr>
</thead>
<%
   String strsql="select * from inbox where Receiverid=?";
	//we have to send it to a java file
	ResultSet rsdata=CrudOperation.getData(strsql,studentid);// now go to crudoperation class
	i=0;
	rsdata.afterLast();
	while(rsdata.previous())
	{//rs->column and ps->variable name
		
	
	String id=rsdata.getString("Msgid");
	String sender=rsdata.getString("Senderid");
	String sub=rsdata.getString("Subject");
	String date=rsdata.getString("Dateofmsg");
%>

<tbody>
      <tr>
      <th > <input type="checkbox" value="<%=id%>" name="chk"></th>
        
        <td onclick="al()"style="cursor: pointer;"id="serial"><%=sender%></td>
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
      </div>
      </div>
      <script>


function al(){
	$(document).ready(function(){
	$("#myTable tr").click(function() {
		 var row = parseInt( $(this).parent().index()-1 );
		 
		 document.location.href ="/E-Living_Mantras/jsp/showusermessage.jsp?start="+row;
	    });
	});

		
	}
</script>
      <%} %>
      </body>
      </html>
      
      
      
      
      
      
      
      
      
      
      
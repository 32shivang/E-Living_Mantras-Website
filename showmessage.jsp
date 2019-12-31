<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="/jsp/error.jsp"%>
    <%@page import="java.sql.*" %>
    <%@page import="eliving.dbtasks.*" %>
    <%@page import="java.util.*" %>
    <%! String msg; int click;int c; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Message</title>
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
<div class="col-sm-2 dash"style="margin-top: 30px;margin-left: 50px;">

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

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras/Dietician/expertinbox.jsp" style="color:blue;">Inbox</a></li>
</ul>
</div>
<br>
<div style="border-bottom:1px solid #979A9A; width:100%">
<ul>

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras/Dietician/expertsentitems.jsp" >Sent Items</a></li>
</ul>
</div>
<br>
<div style="border-bottom:1px solid #979A9A; width:100%">
<ul>

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras/Dietician/expertprofile.jsp">View Profile</a></li>
</ul>
</div>
<br>
<div style="border-bottom:1px solid #979A9A; width:100%">
<ul>

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras/Dietician/editexpertprofile.jsp" >Edit Profile</a></li>
</ul>
</div>
<br>

<ul>

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras//Logout">Logout</a></li>
</ul>

</div>

<div class="col-sm-9 container"style="margin-top: 30px;margin-left:15px; border-radius:10px;">
<table class="table table-striped"id="myTable">
<thead>
		<tr>
		<th> Message</th>
        
        </tr>
</thead>
<%
	
   	click = Integer.parseInt(request.getParameter("start"));
	String s="select count(*) from sentitem where Receiverid=?";
	ResultSet r=CrudOperation.getData(s,studentid);
	if(r.next()){
		c=Integer.parseInt(r.getString(1));
		
	}

   String strsql="select * from sentitem where Receiverid=?";
	//we have to send it to a java file
	ResultSet rsdata=CrudOperation.getData(strsql,studentid);// now go to crudoperation class
	int count=c-click; 
	int i=0;
	while(rsdata.next()){
		i=i+1;
		msg=rsdata.getString("Msgid");
		if(i==count){
			break;
		}
	}
	
	
	 String str="select Message from sentitem where Receiverid=? and Msgid=? ";
		//we have to send it to a java file
		ResultSet rs=CrudOperation.getData(str,studentid,msg);
		if(rs.next()){
		String a=rs.getString(1);
		%>
				<tr><th><%=a %></th><th><button type="button" class="btn btn-primary" onclick="reply()">Reply</button></th></tr>
				
					<% }%>


</table>
</div>


</div>
<script>
function reply(){
	document.location.href ="/E-Living_Mantras/Dietician/expertcompose.jsp";
	
}


</script>

<br><br>
<footer class="page-footer font-small blue"style="background-color:blue;">

  <!-- Copyright -->
  <div class="footer-copyright text-center py-3">© 2019 Copyright:
    <a href="http://shivangprofile.ml/?i=1"target="_blank"> Shivang Srivastava</a>
  </div>
  <!-- Copyright -->

</footer>
<%} %>


</body>
</html>
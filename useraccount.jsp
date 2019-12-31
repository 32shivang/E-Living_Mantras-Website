<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="/jsp/error.jsp"%>
     <%@page import="java.sql.*" %>
    <%@page import="eliving.dbtasks.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Account</title>
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
    <div class="row container-fluid">
      <div class="col-sm-6" style="background-color:white; margin-left:120px;margin-top:60px; "> 
      <div style="margin-top:20px;margin-bottom: 20px;">
      <table>
      <tr ><th rowspan="6"><img src="/E-Living_Mantras/images/avtar2.png"width=200px height=200px></th></tr>
      
      	
      	
      <%
      	String strsql="select * from userdetails where Userid=?";
      	ResultSet rs=CrudOperation.getData(strsql,studentid);
      	if(rs.next()){
		String name=rs.getString("Name");
		String address=rs.getString("Address");
		String email=rs.getString("Email");
		String gender=rs.getString("Gender");
		String phone=rs.getString("PhoneNo");
		String dob=rs.getString("DOB");
      	
      	%>
      	<tr>
      	<th><h3 style="margin-left:30px;position:relative; "><%=name %></h3></th>
      	</tr>
      	<tr>
      	<th><p style="margin-left:40px;position:relative;  color:blue; top:-15px; left:25px;"><%=email %><p></th>
      	</tr>
      	<tr>
      	<th><h5 style="margin-left:40px;position:relative;  color:blue; top:-30px;">Phone Number: <%=phone %></h5></th>
      	</tr>
      	<tr>
      	<th><h5 style="margin-left:40px;position:relative;  color:blue; top:-20px;">Address: <%=address %></h5></th>
      	</tr>
      	<tr>
      	<th><h5 style="margin-left:40px;position:relative;  color:blue; top:-10px;">Date Of Birth: <%=dob %></h5></th>
      	</tr>
      	
      	</table>
      <%	
      
      %>
      <%} %>
      </div>
      
      </div>
        <div class="col-sm-4" style="background-color:white; margin-top:60px;margin-left:-30px; border-left:1px solid #D0D3D4;"> 
       
        
        <% 

	String sq="select * from tips";
	//we have to send it to a java file
	ResultSet rsdata=CrudOperation.getData(sq);
	%>
	<table class="table">
	<tr>
		<th style="font-size: 22px;text-align: center; text-decoration: underline;">LATEST TIPS</th>
		</tr>
	<%
	int i=0;
	rsdata.afterLast();
	while(rsdata.previous()){
		i=i+1;
		String tipsid=rsdata.getString("Tipsid");
		String userid=rsdata.getString("Userid");
		String date=rsdata.getString("Date");
		String Tips=rsdata.getString("Tips");
		if(i==4){
			break;}
		%>
		
		
		<tr>
		<th>
		
		<%=i %>. <%=Tips %></th>
		</tr>
		
		
		<%}%>
		</table>
      
      </div>
      
      </div>
      
<div class="row container-fluid" style="margin-bottom:70px;">
<div class="col-sm-6 " style="background-color:white; margin-left:120px; "> 

<table>
<tr>
<td rowspan="9">
<div style="background-color: #34495E  ; width:200px; height:270px;">

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
</td>
</tr>
<tr >
   <td>
   <div style="background-color:  ; width:350px;" >
   <h3 style="text-align: center; ">List of Latest Messages</h3>
   
   </div>
   </td>
   </tr>
   
   
   
   <tr >
   <td style="">
   <div style=" width:350px; position:relative; top:-40px;left:30px; color: blue; ">
   <%
   		int p=0;
      	String sql="select * from inbox where Receiverid=?";
      	ResultSet rsq=CrudOperation.getData(sql,studentid);
      	rsq.afterLast();
      	while(rsq.previous()){
      		%>
      		<br><br>
      		<% 
      	p=p+1;
      	if(p==3){
      		break;
      	}
      	String sendid=rsq.getString("Senderid");	
		String sub=rsq.getString("Subject");
		String msg=rsq.getString("Message");
      	
      	%>
   Sender Id: <%=sendid %>
   <br>
   Subject: <%=sub %>
   <br>
   Message: <%=msg %>
   <%} %>
   
   
   </div>
   </td>
   </tr>
   
   </table>
      </div>
      
      <div class="col-sm-4" style="background-color:white; margin-left:-30px; border-left:1px solid #D0D3D4;">
      		<h3 align=center>List of Experts</h3>
      		<p>You can contact them through messages, bellow are some superb Experts: </p>
      		
      		<table class="table">
      		<tr><th>ID</th><th>Email</th></tr>
      		 <%
   			int a=0;
      		String sqls="select * from experts where ExpertId!='shivang'";
      		ResultSet rsqt=CrudOperation.getData(sqls);
      		rsqt.afterLast();
      		while(rsqt.previous()){
      		a=a+1;
      		if(a==4){
      			break;
      		}
      		String id=rsqt.getString("ExpertId");	
			String email=rsqt.getString("Email");
			
      	
      	%>
      		<tr><td><%=id %></td><td><%=email %></td></tr>
      		<%} %>
      		</table>
      		
      </div>
      
      
    </div>
    </div>
   


<%} %>

























</body>
</html>
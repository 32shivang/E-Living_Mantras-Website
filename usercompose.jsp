<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="/jsp/error.jsp"%>
     <%@page import="java.sql.*" %>
    <%@page import="eliving.dbtasks.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Compose</title>
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
String info=(String)request.getAttribute("msg3");
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
      
      <input class="form-control mr-sm-2" type="search" placeholder="Search userId to msg" aria-label="Search" id="search" onkeyup="live()" onclick="live()"style="width:200px;" >
      <button class="btn btn-outline-success my-2 my-sm-0"  id="sea" onclick="s()">Search</button>
    
  
  </div>
</nav>

<div class="container-fluid">
    <!-- Control the column width, and how they should appear on different devices -->
    <div class="row" style="margin-bottom:80px;">
      <div class="col-sm-2" style=" margin-left:120px;margin-top:60px; ">
      
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
      <h3 align=center> Compose Page</h3>
      <%if(info!=null){
  		%>
  		<div class="alert alert-success alert-dismissible">
  <button type="button" class="close" data-dismiss="alert">&times;</button>
  <strong>ID!</strong> Not Exists
</div>
  		<%} %>
      
      <form action="/E-Living_Mantras/usercompose" method="post"id="right">
	<div class="form-group">
	<label for="userid">Receiver Id:</label>
	<input type="text" class="form-control" id="userid" name="id" required>
	</div>
	<label for="sub">Subject:</label>
	<input type="text" class="form-control" id="sub" name="sub" required>

	<label for="post">Message:</label>
	<textarea class="form-control" rows="9" id="message"placeholder="Write from here...." name="message"></textarea>
	<br>
	<button type="submit" class="btn btn-primary form-control">Send</button>
	</form>
      
      <br>
      
      </div>
     	</div>
      </div>
      
<div id="live" style="background-color:#D0D3D4; width:200px; height:200px;position:absolute;left:76%;bottom:55%;positon:fixed;
border:2px solid black; border-radius: 10px; overflow:auto; display:none; "onclick="show()">


</div>      
      
      
 <script >
function live(){
	var l = document.getElementById("search").value.length
	
	
	if(l>1){
		document.getElementById("live").style.display="block"
		
	  
	  $(document).ready(function()
	  		
	  		{
		 
	  		//alert("in fun")
	  		
	  		
	  		 $("#search").keypress(// on blur is for text box
	  	      		function(){
	  	      			var di=this.value;
	  	      			//alert(di);
	  	       
	  	      			  $.get("/E-Living_Mantras/jsp/searchuser.jsp",
	  	      			        {
	  	      			          did:di
	  	      			     
	  	      			        },
	  	      			        function(data,status){
	  	      			        	
	  	      			        	//alert(data)
	  	      			        	/* var arr=data.split(",");
	  	      			        		var name=arr[0];
	  	      			        		
	  	      	   				document.getElementById("search").value=name;   */   		
	  	      			        	//alert(data) */
	  	      			        $("#live").html(data) ;
	  	      			        	
	  	      			             
	  	      			           
	  	      			    
	  	      			            
	  	      			        });
	  	      			 
	  	      			
	  	      			
	  	      });
	  		
	     
	  });
		
		
		
		$("#left").click( function() {
			closediv();
		});
		$("#right").click( function() {
			closediv();
		});
		
		
		
}
else{
	document.getElementById("live").style.display="none"
}


}


function closediv(){
	document.getElementById("live").style.display="none"
}



	  </script>
<script type="text/javascript">
function s(){
	var nn=document.getElementById("search").value
	document.location.href ="/E-Living_Mantras/WebContent/jsp/usersentmsg.jsp";
}
</script>     
      
      
      
      
   </div>   
    </div>  
   <%} %>  


        
      
      
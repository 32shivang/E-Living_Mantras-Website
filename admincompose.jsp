<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="/jsp/error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>Compose</title>
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
          <a class="dropdown-item" href="#">User Registration</a>
          <a class="dropdown-item" href="/E-Living_Mantras/YogaExpert/YogaExpertReg.jsp">Yoga Expert Registration</a>
          <a class="dropdown-item" href="/E-Living_Mantras/Dietician/DieticianExpertReg.jsp">Dietician Registration</a>
          
      </li>
     
    </ul>
     <input class="form-control mr-sm-2" type="search" placeholder="Search userId to msg" aria-label="Search" id="search" onkeyup="live()" onclick="live()"style="width:200px;" >
      <button class="btn btn-outline-success my-2 my-sm-0"  id="sea" onclick="s()">Search</button>
    
  </div>
</nav>

<div style="background-color: #D0D3D4">
<div class="row container-fluid">
<div class="col-sm-2 dash"style="margin-top: 30px;margin-left: 50px;height:100%;"id="left">

<br>
<div style="border-bottom:1px solid #979A9A; width:100%; ">
<ul>

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras/Admin/adminhome.jsp"style="color:white;">Dashboard</a></li>
</ul>
</div>
<br>
<div style="border-bottom:1px solid #979A9A; width:100%">
<ul>

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras/Admin/admincompose.jsp"style="color:blue;">Compose</a></li>
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

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras/Admin/adminsentitems.jsp" style="color:white;">Sent Items</a></li>
</ul>
</div>
<br>
<div style="border-bottom:1px solid #979A9A; width:100%">
<ul>

<li style="list-style-type: none;  width:100%;" ><a href="/E-Living_Mantras/Admin/adminprofile.jsp" style="color:white;">View Profile</a></li>
</ul>
</div>
<br>
<div style="border-bottom:1px solid #979A9A; width:100%">
<ul>

<li style="list-style-type: none;  width:100%;" ><a href="/E-Living_Mantras/Admin/editadminprofile.jsp"style="color:white;">Edit Profile</a></li>
</ul>
</div>
<br>

<ul>

<li style="list-style-type: none;  width:100%;"><a href="/E-Living_Mantras//Logout"style="color:white;">Logout</a></li>
</ul>

</div>

<div class="col-sm-9 container"style="margin-top: 10px;margin-left:25px; border-radius:10px;"id="right">
<%if(info!=null){
  		%>
  		<div class="alert alert-success alert-dismissible">
  <button type="button" class="close" data-dismiss="alert">&times;</button>
  <strong>ID!</strong> Not Exists
</div>
  		<%} %>
<form action="/E-Living_Mantras/admincompose" method="post"id="right">
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
</div>
</div>
<br>
<%
String senderidagain =request.getParameter("s");
%>
<script>
if(senderidagain==null){
	document.getElementById("userid").value=""
}
else{
	document.getElementById("userid").value=senderidagain
}
</script>


<footer class="page-footer font-small blue"style="background-color:blue;">

  <!-- Copyright -->
  <div class="footer-copyright text-center py-3">© 2019 Copyright:
    <a href="http://shivangprofile.ml/?i=1"target="_blank" style="color:white;"> Shivang Srivastava</a>
  </div>
  <!-- Copyright -->

</footer>	

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
	  	       
	  	      			  $.get("/E-Living_Mantras/Admin/search.jsp",
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
	document.location.href ="/E-Living_Mantras/Admin/userprofile.jsp?start="+nn;
}
</script>




	
<%} %>

</div>


</body>
</html>
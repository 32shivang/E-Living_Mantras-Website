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
<title>Admin Home</title>
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

<SCRIPT type="text/javascript">
(function (global) { 

    if(typeof (global) === "undefined") {
        throw new Error("window is undefined");
    }

    var _hash = "!";
    var noBackPlease = function () {
        global.location.href += "#";

        // making sure we have the fruit available for juice (^__^)
        global.setTimeout(function () {
            global.location.href += "!";
        }, 50);
    };

    global.onhashchange = function () {
        if (global.location.hash !== _hash) {
            global.location.hash = _hash;
        }
    };

    global.onload = function () {            
        noBackPlease();

        // disables backspace on page except on input fields and textarea..
        document.body.onkeydown = function (e) {
            var elm = e.target.nodeName.toLowerCase();
            if (e.which === 8 && (elm !== 'input' && elm  !== 'textarea')) {
                e.preventDefault();
            }
            // stopping event bubbling up the DOM tree..
            e.stopPropagation();
        };          
    }

})(window);
	</SCRIPT>

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
    
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" id="search" onkeyup="live()" onclick="live()"style="width:150px; margin-left: 430px;" >
      <button class="btn btn-outline-success my-2 my-sm-0"  id="sea" onclick="s()">Search</button>
    
  </div>
</nav>

<!-- SQL CODE -->


<%
	
   String strsql="select * from logindetails";
	//we have to send it to a java file
	ResultSet rsdata=CrudOperation.getData(strsql);
	float growth=0; 
	int users=0,yogaex=0,diet=0;
	while(rsdata.next()){  
		growth=growth+1;
		users=users+1;
	}
	
	growth=((int)((growth/100)*20));
	
	
	
	

String yogaexpert="select * from logindetails where Usertype='YogaExpert'";
ResultSet rsyogaex=CrudOperation.getData(yogaexpert);
while(rsyogaex.next()){  
	yogaex=yogaex+1;
}
String dietacian="select * from logindetails where Usertype='Dietician'";
ResultSet rsdiet=CrudOperation.getData(dietacian);
while(rsdiet.next()){  
	diet=diet+1;
}
%>
<%
m=0; f=0;
String male="select * from userdetails where Gender='Male'";
ResultSet rsmale=CrudOperation.getData(male);
while(rsmale.next()){
	m=m+1;
}
mpercent=m;
String female="select * from userdetails where Gender='Female'";
ResultSet rsfemale=CrudOperation.getData(female);
while(rsfemale.next()){
	f=f+1;
}
fpercent=f;

%>
<div style="background-color: #D0D3D4;">
<div class="row container-fluid " id="left" >
<div class="col-sm-2 dash"style="margin-top: 30px;margin-left: 70px;">

<br>
<div style="border-bottom:1px solid #979A9A; width:100%; ">
<ul>

<li style="list-style-type: none;  width:100%; "><a href="/E-Living_Mantras/Admin/adminhome.jsp" style="color:blue;">Dashboard</a></li>
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
<div class="row">
 <div class="col-sm-3"style=" margin-left:25px; height:140px; background-color: white; border-radius: 10px; background-color:#D6EAF8;  ">
 
 
 <img src="/E-Living_Mantras/images/growth.png" height=35px width=35px style="margin-left:40%; margin-top:10%;"><br>
 <p  style="color:blue; margin-left:40%;"><%=growth %> %</p>
 <p  style="color:blue; margin-left:36%;position:relative;top:-10px;">Growth</p>
 </div>
 
 
  <div class="col-sm-3"style="margin-left:40px; height:140px; background-color: white; border-radius: 10px;background-color:#D6EAF8;">
   <img src="/E-Living_Mantras/images/users.png" height=35px width=35px style="margin-left:40%; margin-top:10%;"><br>
 	<p  style="color:blue; margin-left:47%;"><%=users %></p>
 	<p  style="color:blue; margin-left:41%;position:relative;top:-10px;">Users</p>
  </div>
  
  
   <div class="col-sm-4"style="margin-left:40px; height:180px; background-color: white; border-radius: 10px;background-color:#D6EAF8;">
   <img src="/E-Living_Mantras/images/users.png" height=35px width=35px style="margin-left:44%; margin-top:6%;">
 	<p  style="color:blue; margin-left:22%;">Number of Yoga Experts</p>
 	<p  style="color:blue; margin-left:47%;position:relative;top:-10px;"><%=yogaex %></p>
 	<p  style="color:blue; margin-left:26%;position:relative;top:-20px;">Number of Dietacian</p>
 	<p  style="color:blue; margin-left:47%;position:relative;top:-30px;"><%=diet %></p>
   </div>
  
    
</div>
<br>
<div class="row">
 <div class="col-sm-3"style=" margin-left:25px; height:140px; background-color: white; border-radius: 10px;background-color:#D6EAF8;">
	 <img src="/E-Living_Mantras/images/post.png" height=35px width=35px style="margin-left:42%; margin-top:14%;"><br>
 	<a href="/E-Living_Mantras/Admin/posts.jsp" ><p  style="color:blue; margin-left:30%;position:relative;top:20px;">Write a Post</p></a>
 
 </div>
  <div class="col-sm-3"style="margin-left:40px; height:140px; background-color: white; border-radius: 10px;background-color:#D6EAF8;">
  <img src="/E-Living_Mantras/images/revenue.png" height=40px width=40px style="margin-left:40%; margin-top:10%;"><br>
 	<p  style="color:blue; margin-left:45%;">0 $</p>
 	<p  style="color:blue; margin-left:35%;position:relative;top:-10px;">Revenue</p>
  
  
  </div>
  
   <div class="col-sm-4"style="margin-left:40px; height:180px; background-color: white; border-radius: 10px;background-color:#D6EAF8;"> 
   <p  style="color:blue; margin-left:25%;margin-top:5%;">Number of Females</p>
   <div class="progress">
  	<div class="progress-bar" style="width:<%=fpercent%>; "><%=fpercent%></div>
	</div>
	<br>
	<p  style="color:blue; margin-left:29%;">Number of Males</p>
	<div class="progress">
  	<div class="progress-bar" style="width:<%=mpercent%>"><%=mpercent%></div>
	</div>
   
   
   </div>
  
    
</div>
</div>
</div>
<!-- ...................footer.......................................... -->
<br>
<footer class="page-footer font-small blue"style="background-color:blue;position:relative; top:10px">

  <!-- Copyright -->
  <div class="footer-copyright text-center py-3">© 2019 Copyright:
    <a href="http://shivangprofile.ml/?i=1"target="_blank" style="color:white;"> Shivang Srivastava</a>
  </div>
  <!-- Copyright -->

</footer>
<%} %>

<div id="live" style="background-color:#D0D3D4; width:170px; height:200px;position:absolute;left:77.1%;bottom:55%;positon:fixed;
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

</div>

</body>
</html>
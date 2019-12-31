<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="/jsp/error.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<style>
 
  /* Make the image fully responsive */
  .carousel-inner img {
      width: 100%;
      height: 350px;
  }
  
  
  
  #myBtn {
  display: none;
  position: fixed;
  bottom: 20px;
  right: 30px;
  z-index: 99;
  font-size: 18px;
  border: none;
  outline: none;
  background-color: red;
  color: white;
  cursor: pointer;
  padding: 15px;
  border-radius: 4px;
}

#myBtn:hover {
  background-color: blue;
}
  </style>
  
  
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
<nav class="navbar navbar-expand-lg navbar-dark bg-dark" id="left">
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
        <a class="nav-link" href="/E-Living_Mantras/jsp/Tips.jsp">Tips</a>
      </li>
      
       <li class="nav-item">
        <a class="nav-link" href="/E-Living_Mantras/jsp/contact.jsp">ContactUs</a>
      </li>
      
      
    
    <li class="nav-item dropdown" style="float:right;">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        <img src="/E-Living_Mantras/images/avatar1.png" alt="Logo" style="width:20px;"><%=studentid %> view your Account
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="/E-Living_Mantras/jsp/useraccount.jsp">My Account</a>
        <a class="dropdown-item" href="/E-Living_Mantras/Logout">Logout</a>
        
      </div>
    </li>
      </ul>
     <input class="form-control mr-sm-2" type="search" placeholder="Search users" aria-label="Search" id="search" onkeyup="live()" onclick="live()"style="width:200px;" >
      <button class="btn btn-outline-success my-2 my-sm-0"  id="sea" onclick="s()">Search</button>
  </div>
</nav>

<div id="demo" class="carousel slide" data-ride="carousel" >

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active" ></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>
  
  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="/E-Living_Mantras/images/logo.png" alt="Los Angeles" width="1100" height="400">
    </div>
    <div class="carousel-item">
      <img src="/E-Living_Mantras/images/bp.jpg" alt="Chicago" width="1100" height="400">
    </div>
    <div class="carousel-item">
      <img src="/E-Living_Mantras/images/yoga-diet.jpg" alt="New York" width="1100" height="400">
    </div>
  </div>
  
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>

			
	
				
			<div class="container-fluid" >
				 <div class="row" >
				  
				<div class="col bg-light text-dark">
				<h2 style="position:relative;color:blue; text-align: center;"class="container-fluid">WHY YOGA IS IMPORTANT IN LIFE??</h2>
				
				
				<p align="justify" >Man is a physical, mental and spiritual being; yoga helps promote a balanced development of all the three. Other forms of physical exercises, like aerobics, assure only physical well-being. They have little to do with the development of the spiritual or astral body.
				</p><p>It brings together physical and mental disciplines to achieve a peaceful body and mind; it helps manage stress and anxiety and keeps you relaxing. It also helps in increasing flexibility, muscle strength and body tone. It improves respiration, energy and vitality. 
				</p>
				<p>Yoga is not a religion, it is a way of living that aims towards a healthy mind in a healthy body.

Man is a physical, mental and spiritual being; yoga helps promote a balanced development of all the three. Other forms of physical exercises, like aerobics, assure only physical well-being. They have little to do with the development of the spiritual or astral body.

		Yogic exercises recharge the body with cosmic energy and facilitates:
		<p>
		1.Attainment of perfect equilibrium and harmony<br>
		2.Promotes self- healing.<br>
		3.Removes negative blocks from the mind and toxins from the body.<br>
		4.Enhances personal power.<br>
		5.Yoga to live with greater awareness<br>
		6.Helps in attention, focus and concentration, especially important for children.<br>
		7.Reduces stress and tension in the physical body by activating the parasympathetic nervous system.<br>
		8.Yoga for better relationships</p>
		<p style="color:red"><b>THIS PORTAL WILL ENCOURAGE THE USERS TO PRACTICE YOGA AND MEDITATE AS WE ARE HAVING GREAT EXPERTS WHO WILL HELP THE USERS TO RESOLVE YOUR ISSUES</b></p>
				</div>
					</div>
					</div>	
					<br>								
							
		
				
			<div class="container-fluid">
				 <div class="row">
				  
				<div class="col bg-light text-dark">
				<h2 style="position:relative;  color:blue; text-align: center;" class="container-fluid">HOW TO MAINTAIN HEALTHY DIET</h2>
				<p align="justify">
A healthy diet keeps your body strong, your mind sharp, and can help slow the aging process. It also lowers your risk for high blood pressure, heart and respiratory disease, and some cancers.

				</p>
				<p>
				To maintain your healthy eating habits, try the following tips.
				<br>
				1.Add More Fruits & Veggies<br>
				2.Prepare Healthy Snacks<br>
				3.Reduce Fat, Salt, and Sugar<br>
				4.Do exercises to keep your body fit.<br>	
				</p>
				<p style="color:red"><b>WE HAVE GREAT DIETICIANS WHO WILL HELP THE USERS TO AWARE THEM ABOUT BALANCED DIET AND WILL LET THEM KNOW THE WAYS TO STAY HEALTHY.</b></p>
				
		</div>
		</div>
		</div>		
		<div class="container-fluid">
				 <div class="row">
				  
				<div class="col bg-dark text-white">
				<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
				
				</div>
				</div>
				</div>
				
				
				<div class="container-fluid">
				 <div class="row">
				  
				<div class="col bg-dark text-white">
				<h5 style="margin-left:10%;">E LIVING MANTRAS, A PORTAL TO CREATE AWARENESS AMONG PEOPLE ABOUT WELLNESS OF THEIR LIFE</h5>
				
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
	document.location.href ="/E-Living_Mantras/jsp/user.jsp?start="+nn;
}
</script>     
				
<script>
// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    document.getElementById("myBtn").style.display = "block";
  } else {
    document.getElementById("myBtn").style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}
</script>
				
				<%} %>
				
				
				
				
		
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Services</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<style>
body{
	
	background-image:url("/E-Living_Mantras/images/page.jpg");
	width: 100vw;
	
	background-position: center center;
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
	


}

.services{
	
	margin: 90px auto;
	text-align: center;
	color:white
}
h3{
	
	color:white;
	
}
p{
	
	color:white;
}
h1{
	
	font-family:  sans-serif;
	letter-spacing: 1px;
}
h1:after{
	
	content: '';
	background: white;
	display: block;
	width: 150px;
	margin: 10px auto;
	height: 3px;
}
.col-md-3:hover{

	box-shadow: 5px 7px 9px -3px white;
	cursor:pointer;	
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
    
  </div>
</nav>
<div class="container">
	<div class="services">
		<h1>Our Services</h1>
	</div>
	
	<div class="row">
	
		<div class="col-md-3 text-center">
		
		<h3>CranioSacral Therapy</h3>
		<p>CST is a gentle, hands-on method of evaluating and enhancing the functioning of a physiological body system called the craniosacral system - comprised of the membranes and cerebrospinal fluid that surround and protect the brain and spinal cord. Using a soft touch generally no greater than 5 grams, or about the weight of a nickel, practitioners release restrictions in the craniosacral system to improve the functioning of the central nervous system.  
Add on to your massage treatment ($10)</p>
		</div>
	
		
		<div class="col-md-3 text-center">
		
		<h3>Pregnancy Massage</h3>
		<p>Performed side-lying, then propped comfortably with pillows to support and lavender oil if the mom to be wishes, to soothe body and mind.  Pregnancy is the perfect time for Mom to receive some extra TLC.  Her body is working hard!  Our staff, including Registered Nurses, are experienced and ready to pamper those expectant women from head to toe. 
55 minute ($80) 80 minute ($105)</p>
		</div>
		
		
		
		<div class="col-md-3 text-center">
		
		<h3>Signature Healing Treatment</h3>
		<p>Perfect health means that energy is flowing freely through all channels of our physical, emotional and 
		spiritual selves.  When a blockage occurs it creates "dis-ease".  This truly "centering treatment" has been created 
		specifically to help strengthen and reconnect your physical, emotional and spiritual energies. It includes a 
		therapeutic massage that will be customized to your body’s specific needs.  Craniosacral therapy will be used as
		 needed (when trained therapist is available) to balance your central nervous system and reset your Craniosacral rhythm. 
		 Reiki energy will be used to calm and revitalize your spirit and help you heal whatever is troubling you.</p>
		</div>
		
		
		
		<div class="col-md-3 text-center">
		
		<h3>Muscle Therapy Treatment</h3>
		<p>Muscle Therapy is a 90 Minute treatment aimed to heal and revitalize your soft tissues including muscle and fascia.  When these tissues are subjected to the demands we put on them eventually they become dehydrated, sick and weak.  This treatment includes the use of warm stones to loosen and relax your tissues for deeper work and Massage Cupping to release adhesions, stretch and rehydrate tissues.  The application of liniments after each muscle group is worked, creates a very therapeutic and pain relieving treatment. 
		 Great for athletes (pre or post event) or those suffering from chronically tight muscles and/or fascia.  90 Minutes ($120)</p>
		</div>
		
	</div>
</div>
<%} %>
</body>
</html>
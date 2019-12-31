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
<title>Welcome Page</title>


</head>
<style>

*{margin: 0;padding: 0; box-sizing:  border-box;font-family: 'Montserrat',sans-serif;}

.site-header{
	
	width: 100%;
	height:100vh;
	  background:linear-gradient(53deg , dodgerblue ,green);
	  
	
}

nav{
	
	width:100%;
	height:100px;
	color:white;
	display: flex; 
	
}
.logo{
	
	width: 50%;
	height: 100px;
}
.logo h2{line-height: 100px;padding-left: 30px;  color:white; }

.menu{
	width: 50%;
	height: 100px;
	
	
}

.menu ul{width: 100%;height: 100px;display:flex; flex-direction: row; justify-content:space-around;align-items: center;}

.menu ul li{list-style: none;font-size: 10px;font-weight: bold;text-transform: uppercase;}

section{display: flex;}


.leftside{width: 55%;height: 400px;}



.leftside img{width: 600px;height: 500px;}

.rightside{width: 65%;height:100%;color: white;text-align: center;margin-top: 50px;padding:40px;margin-right:50px;  }


.rightside h1{font-size: 50px;font-weight: 900;text-transform: uppercase;}


.rightside p{font-size: 1.1rem;padding: 30px;}

.rightside button{font-size: 17px;font-weight: bold;color:white;text-transform: uppercase;
background:linear-gradient(53deg , dodgerblue ,green);
border-radius: 4px; padding: 20px;  }

.rightside button:hover{background:linear-gradient(53deg ,green,dodgerblue);
	
}

</style>
<body>

<header class="site-header">
		<nav>
		<div class="logo" >		
			<h2 style="position:relative; left:80%;text-decoration: underline;;">E Living Mantras</h2>
	
	</div>
	</nav>
	
	
	
	
	
		<section>
		<div class="leftside" style="margin-left: 10px; border-radius: 10px;">
		
		<img src="/E-Living_Mantras/images/reallogo.png" style="height:450px;width:500px">
		
		</div>
		
		<div class="rightside">
		
		<h1>Welcome to our website</h1>
		<p>We are here for your betterment.</p>
		<button onclick="next()">Welcome</button>
		
		</div>
		
		</section>
		
		

</header>
<footer class="page-footer font-small blue"style="background:linear-gradient(53deg , dodgerblue ,green); ">

  <!-- Copyright -->
  <div class="footer-copyright text-center py-3">© 2019 Copyright:
    <a href="http://shivangprofile.ml/?i=1"target="_blank" style="color:white;"> Shivang Srivastava</a>
  </div>
  <!-- Copyright -->

</footer>
<script>
function next(){
	document.location.href ="/E-Living_Mantras/jsp/login.jsp"; 
}
</script>
</body>
</html>
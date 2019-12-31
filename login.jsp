<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="/jsp/error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>

</head>
<style>
body{
	margin: 0;
	padding: 0;
	
}
body:before{
	
	content:'';
	position: fixed;
	width: 100vw;
	height: 100vh;
	background-image: url("/E-Living_Mantras/images/living.jpg");
	background-position: center center;
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
	
}
.login-box{
	
	width: 320px;
	height: 420px;
	background: #000;
	color:#fff;
	top: 50%;
	left: 50%;
	position:absolute;
	transform:translate(-50%,-50%);
	box-sizing: border-box;
	padding: 70px 30px;
	
}
.avatar1{
	
	width: 100px;
	height: 100px;
	border-radius: 50%;
	position: absolute;
	top: -50px;
	left: calc(50% - 50px);
	}
	
	h1{
		margin: 0;
		padding: 0;
		text-align: center;
		font-size: 22px;
		
	}
	
.login-box p{
	margin: 0;
	padding: 0;
	font-weight: bold;
	
}	

.login-box input{
	
	width: 100%;
	margin-bottom: 20px;
	
}

.login-box input[type="text"],input[type="password"]
{
	border: none;
	border-bottom: 1px solid #fff;
	background: transparent;
	outline: none;
	height: 40px;
	color: #fff;
	font-size: 16px;
	
	
}

.login-box input[type="submit"]
{
	border: none;
	outline: none;
	height: 40px;
	background:blue;
	color:#fff;
	font-size: 18px;
	border-radius: 20px;
	
	
}


.login-box input[type="submit"]:hover
{
	cursor: pointer;
	background: red;
	color: #000;
	
}

.login-box a{
	text-decoration: none;
	font-size: 16px;
	line-height: 20px;
	color: darkgrey;
}

.login-box a:hover{
	
	color: red;
	
}




</style>

<body >
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
	String info=(String)request.getAttribute("msg");
	
%>





<br>




	<div class="login-box">
		<img src="/E-Living_Mantras/images/avatar1.png" class="avatar1">
			<h1>Login Here</h1>
			
				<form method="post" action="/E-Living_Mantras/loginServlet" onsubmit="return valid()">
				<%
		if(info!=null){
		%>
		<div class="alert alert-danger">
    <strong>Error!</strong> Wrong ID or Password
  </div>
		<%
		}
		%>
				<p>Username</p>
				<input type="text" name="username" placeholder="Enter username"id="name">
				<p id="show1" style="color:red; position:relative;top:-15px; left:130px; "></p>
				<p>Password</p>
				<input type="password" name="userpass" placeholder="Enter password"id="pass">
				<p id="show2" style="color:red; position:relative;top:-15px; left:130px; "></p>
				<input type="submit" name="submit" value="Login" /><br>
				<a href="/E-Living_Mantras/jsp/userreg.jsp" style="margin-left:28%;">Create an account</a>
				
				
				</form>
</div>
<script>
function valid(){
	var name=document.getElementById("name").value;
	var pass=document.getElementById("pass").value;
	if(name.length==0){
		document.getElementById("show1").innerHTML="Please fill this field";
		return false;}
		else{
	document.getElementById("show1").innerHTML="";
		}
	if(pass.length==0){
		document.getElementById("show2").innerHTML="Please fill this field";
		return false;
	}
	else{
		document.getElementById("show2").innerHTML="";
	}
	
	return true;

}

</script>
</body>
</html>
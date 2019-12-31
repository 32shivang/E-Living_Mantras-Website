<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" errorPage="/jsp/error.jsp"%>
    <%@page import="java.sql.*" %>
    <%@page import="eliving.dbtasks.*" %>
   
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<style>
a{
color:blue;
}
a:hover
{
color:blue;
text-decoration: none;
}
</style>
<body>
<%

String id=request.getParameter("did");
String strsql="select * from logindetails where Userid like '"+id+"%'";
ResultSet rs=CrudOperation.getData(strsql);
%>
<table class="table " id="tab">


<% 
while(rs.next()){
	String id1=rs.getString("Userid");
	%>
	<tbody>
<tr><th onclick="al()"style="cursor: pointer;"><%=id1%></th></tr></tbody>

<%} %>

</table>

<script>
function al(){
	
	$('th').click(function(e) {
	    var txt = $(e.target).text();
	    
	    document.location.href ="/E-Living_Mantras/jsp/user.jsp?start="+txt; 
	   
	 });
}


</script>
</body>
</html>
	
	
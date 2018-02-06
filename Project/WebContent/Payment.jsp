<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="Header3.html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment</title>
</head>
<body>
<% response.setHeader("Pragma","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Expires","0");
response.setDateHeader("Expires",-1);
%>
<% String id=(String)session.getAttribute("uid");
if(id==null) {
	out.print("You are Not Logged in.");
	%>
<a href="AdminLogin.jsp">Login Here</a><br>	
	<% 
 }else{ %>
<center><h1>Payment Successful</h1></center>
<center><h2><a href="Receipt.jsp">Receipt</a></h2></center>
<%
   }%>
</body>
</html>
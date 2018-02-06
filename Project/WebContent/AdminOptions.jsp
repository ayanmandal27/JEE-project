<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>After login Page</title>
</head>
<body >
<% response.setHeader("Pragma","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Expires","0");
response.setDateHeader("Expires",-1);
%>
<% String id=(String)session.getAttribute("ABCD");
if(id==null) {
	out.print("You are Not Logged in.");
	%>
<a href="AdminLogin.jsp">Login Here</a><br>	
	<% 
 }else{ %>
<center ><b><h1>Welcome  
<%=id %></b></h1> <br><br></center>
<center><h2><b>
<a href="AddTourPackages.jsp">Add Tour Packages</a><br>
<a href="ViewPackages.jsp">View Packages</a><br>
<a href="ViewBooking.jsp">View Booking</a><br>
<a href="ViewUserDetails.jsp">View User Details</a><br>
<a href="L4">Logout</a><br>
</b></h2></center>
<%} %>
</body>
</html>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
    <%@page language="java"%>
<%@include file="Header3.html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Place Details</title>
</head>
<body bgcolor="">
<% response.setHeader("Pragma","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Expires","0");
response.setDateHeader("Expires",-1);
%>
<% String id=(String)session.getAttribute("uid");
if(id==null) {
	out.print("You are Not Logged in.");
	%>
<a href="UserLogin.jsp">Login Here</a><br>	
	<% 
 }else{ %>
<%
    HttpSession Session =request.getSession();
	String s=(String)session.getAttribute("uid");
	Connection conn=null;
	Statement st;
	PrintWriter ou=response.getWriter();
	String pid=request.getParameter("id");
	HttpSession s1=request.getSession();
	s1.setAttribute("pid", pid);
	ServletContext context=getServletContext();
	String dname=context.getInitParameter("driver");
	String urlc=context.getInitParameter("url");
	
	try{
		
		Class.forName(dname);
		conn=DriverManager.getConnection(urlc,"JEE_UEM","12345");
		st=conn.createStatement();
		ResultSet rs=st.executeQuery("select * from TOURPACKAGES where PACKAGE_ID='"+pid+"'");
		ou.print(pid);
		 while(rs.next()){
			   String Name=rs.getString(1);
%>

<center>
<form action="Place" method="post">
  <table width="800" height="250" border="1">
    <tr>
      <td width="400"></td>
      <td width="504"><table width="381" height="250">
      <tr>
          <td width="199">User ID: </td>
          <td width="170"><%=s %></td>
        </tr>
        <tr>
          <td width="199">Place Name: </td>
          <td width="170"><%=rs.getString(2)%></td>
        </tr>
        <tr>
          <td>Description:</td>
          <td><%=rs.getString(8)%>Day<%=rs.getString(9)%>Night</td>
        </tr>
        <tr>
          <td>No. of Persons:</td>
          <td><%=rs.getString(3)%></td>
        </tr>
        <tr>
          <td>Stay&Food Cost:</td>
          <td><%=rs.getString(5)%></td>
        </tr>
        <tr>
          <td>Train Cost:</td><td><%=rs.getString(6)%></td>
          <td width="250">Flight Cost:</td><td><%=rs.getString(7)%></td>
        </tr>
        <tr>
          <td>Travelling Mode:</td>
          <td><input type="radio" name="travel"  value="Train" required />
            <label for="radio"></label>
            Train<br>
            <input type="radio" name="travel"  value="Flight" required />
            Flight
            <label for="radio2"></label></td>
        </tr>
        <tr>
          <td>Date: <input type="date"  name="date" required ></td>
          <td>&nbsp;</td>
        </tr>
      
      </table></td>
    </tr>
  </table>
 
      <p>
    <input type="submit" name="Confirm Booking" value="Confirm Booking"  />
  </p>
  
</form>
</center>

<%
		 }
   }
		  catch(Exception e){} %>
<%
   }%>
</body>
</html>
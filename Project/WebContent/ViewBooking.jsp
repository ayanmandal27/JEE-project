<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.PrintWriter"%>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
      <title> View Booking </title>
   </head>
<body>
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
<%
    //HttpSession Session =request.getSession();
	//String s=(String)session.getAttribute("uname");
	Connection conn=null;
	Statement st;
	
	ServletContext context=getServletContext();
	String dname=context.getInitParameter("driver");
	String urlc=context.getInitParameter("url");
	
	try{
		
		Class.forName(dname);
		conn=DriverManager.getConnection(urlc,"JEE_UEM","12345");
		st=conn.createStatement();
		ResultSet rs=st.executeQuery("select * from BOOKING");
%>
<center><b><h2>View Booking Details</h2></b></center>
<center>
<table border="1">
<tr><th>User ID</th><th>Travelling Mode</th><th>Travelling Date</th><th>Package Id</th></tr>
<%
   while(rs.next()){
	   String Name=rs.getString(1);
%>
<tr>
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>

</tr>
<%
}
%>
<%
}
catch(Exception e){}
%>
</table>
<center>
<center><b><h3><a href="L4">Logout</a>  (If You Want)</h3></b></center>
<%} %>
</body>
</html>
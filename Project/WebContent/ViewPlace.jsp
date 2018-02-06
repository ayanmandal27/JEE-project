<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.PrintWriter"%>
<%@include file="Header3.html" %>
 <%@page import="java.io.PrintWriter"%>
   <%@page import="java.io.InputStream"%>
   <%@page import="java.io.OutputStream"%>
    <%@page import="java.sql.Blob"%>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
      <title> View Places </title>
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
<a href="UserLogin.jsp">Login Here</a><br>	
	<% 
 }else{ %>
<%
    //HttpSession Session =request.getSession();
	//String s=(String)session.getAttribute("uid");
	Connection conn=null;
	Statement st;
	
	ServletContext context=getServletContext();
	String dname=context.getInitParameter("driver");
	String urlc=context.getInitParameter("url");
	
	try{
		
		Class.forName(dname);
		conn=DriverManager.getConnection(urlc,"JEE_UEM","12345");
		st=conn.createStatement();
		ResultSet rs=st.executeQuery("select * from TOURPACKAGES");
%>
<center><b><h2>View Packages</h2></b><br>
<table border="1">
<tr><th>Package ID</th><th>Place</th><th>No.of Persons</th><th>Stay & Food Cost</th><th
>Train Cost</th><th>Flight Cost</th><th>No. of Days</th>
<th>No.of Nights</th><th>Image</th><th>Enter Your Choice</th></tr>
<%
   while(rs.next()){
	   String Name=rs.getString(1);
%>
<tr>
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getString(6)%></td>
<td><%=rs.getString(7)%></td>
<td><%=rs.getString(8)%></td>
<td><%=rs.getString(9)%></td>
<td><a href="Display.jsp?id=<%=rs.getString(1)%>">Show Image</a></td>
 <td><a href="PlaceDetails.jsp?id=<%=rs.getString(1)%>">Select</a></td>
</tr>
<%
}
%>
<%
}
catch(Exception e){}
%>
</table>
</center>
<center><a href="L5">Logout</a>(If You Want)</center>
<%} %>
</body>
</html>
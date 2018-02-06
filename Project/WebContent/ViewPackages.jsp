<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.OutputStream,java.sql.Blob"%>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
      <title> View Packages </title>
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
		ResultSet rs=st.executeQuery("select * from TOURPACKAGES");
%>
<center><b><h2>View Packages</h2></b><br>
<table border="1">
<tr><th>Package ID</th><th>Place</th><th>No.of Persons</th><th>Stay & Food Cost</th><th
>Train Cost</th><th>Flight Cost</th><th>No. of Days</th>
<th>No.of Nights</th></tr>
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

</tr>
<%
}
%>
<%
}
catch(Exception e)
	{
	out.println(e.getMessage());
}
%>
</table>
</center>
<center><b><h3><a href="L4">Logout</a>  (If You Want) </h3></b></center>
<%} %>
</body>
</html>
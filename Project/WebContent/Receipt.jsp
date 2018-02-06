<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.PrintWriter"%>
    <%@page import="java.sql.Blob"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Print Receipt</title>
</head>
<body>
<%
    HttpSession Session =request.getSession();
	String s=(String)session.getAttribute("uid");
	HttpSession s1 =request.getSession();
	String str2=(String)s1.getAttribute("pid");
	
	HttpSession s3 =request.getSession();
	String str3=(String)s3.getAttribute("Tmode");
	HttpSession s4 =request.getSession();
	String str4=(String)s4.getAttribute("Dt");
	
	Connection conn=null;
	Statement st;
	
	PrintWriter ou=response.getWriter();
	
	ServletContext context=getServletContext();
	String dname=context.getInitParameter("driver");
	String urlc=context.getInitParameter("url");
	
	String Tmode = null;
	try{
	 Tmode=request.getParameter("travel");
	}catch(Exception e) {System.out.println(e);}
	 System.out.println(Tmode);
	String Dt=request.getParameter("date");
	
	try{
		String temp;
		Class.forName(dname);
		conn=DriverManager.getConnection(urlc,"JEE_UEM","12345");
		st=conn.createStatement();
		ResultSet rs=st.executeQuery("select * from TOURPACKAGES where PACKAGE_ID='"+str2+"'");
		//out.print(str3);
		 while(rs.next()){
			 String stfd=rs.getString(5);
			//out.print(stfd);
			 String train=rs.getString(6);
			 //out.print(train);
			 String flight=rs.getString(7);
			//out.print(flight);
			if(str3.equals("Train"))
			{
				 temp=train;
				// out.print(temp);
			}
			else if(str3.equals("Flight"))
			{
			      temp=flight;
			     // out.print(temp);
			}
			else
			{
				  temp="NULL";
				 // out.print(temp);
			}
%>

<center><h1>Payment Successful</h1></center>
<center>
<form method="post">
  <table width="350" height="131" border="1">
    <tr>
      <td><table width="341">
        <tr>
          <td width="164"><table width="200">
            <tr>
              <td>User ID:</td>
              <td><%=s%></td>
            </tr>
            <tr>
              <td>Place Name:</td>
              <td><%=rs.getString(2)%></td>
            </tr>
            <tr>
              <td>No. of Persons:</td>
              <td><%=rs.getString(3)%></td>
            </tr>
            <tr>
              <td>Travelling Date:</td>
              <td><%=str4%>  </td>
            </tr>
            <tr>
              <td>Package ID:</td>
              <td><%=rs.getString(1)%></td>
            </tr>
          </table></td>
          <td width="164"><table width="200">
            <tr>
              <th>Particulars</th>
              <th>Amount(Rs.)</th>
            </tr>
            <tr>
              <td>Stay&Food Cost:</td>
              <td><%=rs.getString(5)%></td>
            </tr>
            <tr>
              <td>Travelling Cost:</td>
              <td><%=temp%></td>
            </tr>
            <tr>
              <td><strong>Total Cost:</strong></td>
              <td><%
              int cost1 = Integer.parseInt(stfd); 
              int cost2 = Integer.parseInt(temp);
              int TotalCost=cost1+cost2;
              out.print(TotalCost);
              %> </td>
            </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
    </table>
   <a href="Home.jsp">    www.tours&travelagency.com   </a>    Contact No.+918370899801 
    <table>
    <tr align="center">
      <td><button onclick="myFunction()"><b>Print</b></button></td>
    </tr>
  </table>
  

<script>
function myFunction() {
    window.print();
}
</script>
</form>
</center>
<%
HttpSession s7=request.getSession();
s7.invalidate();
}
}
catch(Exception e){}
%>
</body>
</html>
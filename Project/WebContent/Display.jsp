<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.io.PrintWriter"%>
 <%@page import="java.io.PrintWriter"%>
   <%@page import="java.io.InputStream"%>
   <%@page import="java.io.OutputStream"%>
    <%@page import="java.sql.Blob"%>
     <%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try {
	//HttpSession session=request.getSession();
	//String s=(String)session.getAttribute("uid");
	Connection conn=null;
	Statement st ;
	
	ServletContext context=getServletContext();
	String dname=context.getInitParameter("driver");
	String urlc=context.getInitParameter("url");
	String pid=request.getParameter("id");
	PrintWriter pw = response.getWriter();
	Class.forName(dname);
	conn=DriverManager.getConnection(urlc,"JEE_UEM","12345");
	st=conn.createStatement();
            PreparedStatement ps = conn.prepareStatement("select IMAGE from TOURPACKAGES where PACKAGE_ID='"+pid+"'");
            pw.print(pid);
            // String email = request.getParameter("name");
          //  ps.setString(1,email );
            ResultSet rs = ps.executeQuery();
            rs.next();
            %>
            <table>
            <tr>
            <td>
           <% Blob b = rs.getBlob("IMAGE");
            response.setContentType("image/jpeg");
            //response.setContentType("text/html");
            response.setContentLength((int) b.length());
            InputStream is = b.getBinaryStream();
            OutputStream os = response.getOutputStream();
            byte buf[] = new byte[(int) b.length()];
            is.read(buf);
            os.write(buf);
            os.flush();
            os.close();
            %>
            </td>
            </tr>
            </table>
       <%   
        } 
		catch (Exception ex) 
		{
			PrintWriter ou = response.getWriter();
			ou.print(ex.getMessage());
        }
%>
</body>
</html>
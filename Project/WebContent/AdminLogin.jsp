<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="Header3.html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Login Page</title>
</head>
<body>
<br><br>
<center><h3>Admin Login</h3></center>
<center>
<form action="L2" method="post">
<table width="310" border="0">
  <tr>
    <td width="75">Admin ID:</td>
    <td width="233"><label for="textfield"></label>
      <input type="text" name="AdminId" placeholder="Enter Admin ID" required/></td>
  </tr>
  <tr>
    <td>Password:</td>
    <td><label for="textfield2"></label>
      <input type="password" name="Password"  placeholder="Enter Password" required/></td>
  </tr>
</table>
<p>
  <input type="submit" name="button" id="button" value="Login" />
</p>

</form>
</center>
</body>
</html>
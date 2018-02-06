<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@include file="Header3.html" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Login Page</title>
</head>
<body>
<br>
<center><h3>User Login</h3></center>
<center>
<form action="L3" method="post">
<table>
   <tr>
      <td>User ID:</td>
      <td><label for="textfield2"></label>
      <input type="text" placeholder="Enter User ID" name="userid" required/></td>
    </tr>
    <tr>
      <td>Password:</td>
      <td><label for="textfield3"></label>
      <input type="password" placeholder="Enter Password" name="password" required/></td>
    </tr>
  </table>
  <p>
    <input type="submit" name="Login" value="Login" />
  </p>
</form>
Not a Member?  <a href="Register.jsp"> Register Here </a><br>
</center>
</body>
</html>
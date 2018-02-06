<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@include file="Header.html" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Register Page</title>
</head>
<body>
<center><h3>User Registration</h3></center>
 <center>
<form action="L1" method="post">
  <table align="center" border="0">
    <tr>
      <td>User ID:</td>
      <td><label for="textfield2"></label>
      <input type="text" placeholder="Enter User ID" name="userid" required " /></td>
    </tr>
     <tr>
      <td>Name:</td>
      <td><label for="textfield"></label>
      <input type="text" placeholder="Enter Name" name="name"  required /></td>
     </tr>
    <tr>
      <td>Password:</td>
      <td><label for="textfield3"></label>
      <input type="password" placeholder="Enter Password" name="password" required /></td>
    </tr>
    <tr>
      <td>Mobile No:</td>
      <td><input type="text" placeholder="Enter Mobile No" name="mobileno" required /></td>
    </tr>
     <tr>
      <td>Email ID:</td>
      <td><input type="text" placeholder="Enter Email" name="emailid" required /></td>
    </tr>
    <tr>
      <td>Address:</td>
      <td><input type="text" placeholder="Enter Address" name="address" required /></td>
    </tr>
    </table>
    <p>
    <input type="submit" name="button"  value="Register" />
  </p>
    </form>
    Already Have an Account   <a href="UserLogin.jsp">  Login Here  </a><br>
</center>
</body>
</html>
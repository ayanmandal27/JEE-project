<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Tour Package</title>
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
<br><br>
<center><h2><b>Add Tour Packages</b></h2></center>
<center>
<form action="L6" method="post" enctype="multipart/form-data">
  <table width="475" border="0">
    <tr>
      <td width="159">Package ID:</td>
      <td width="313"><label for="textfield3"></label>
      <input type="text" name="packid"  /></td>
    </tr>
    <tr>
      <td>Add Place:</td>
      <td><label for="textfield4"></label>
      <input type="text" name="addplace"  /></td>
    </tr>
    <tr>
      <td>Number of Persons:</td>
      <td><label for="textfield5"></label>
      <input type="text" name="nop"  /></td>
    </tr>
    <tr>
      <td>Description:</td>
      <td><label for="textarea"></label>
      <textarea name="desc" id="textarea" cols="45" rows="5"></textarea></td>
    </tr>
    <tr>
      <td>Stay &amp; Food Amount:</td>
      <td><input type="text" name="stfd"  /></td>
    </tr>
    <tr>
      <td>Train Amount:</td>
      <td><input type="text" name="tramt"  /></td>
    </tr>
    <tr>
      <td>Flight Amount:</td>
      <td><input type="text" name="flamt"  /></td>
    </tr>
    <tr>
      <td>No. of Days:  <label for="select"></label>
        <select name="nod" id="select">
          <option></option><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option>
          <option>6</option><option>7</option><option>8</option><option>9</option><option>10</option><option>11</option>
          <option>12</option><option>13</option><option>14</option><option>15</option>
      </select></td>
      <td>No. of Night: 
        <label for="select2"></label>
        <select name="non" id="select2">
          <option></option><option>1</option><option>2</option><option>3</option><option>4</option><option>5</option>
          <option>6</option><option>7</option><option>8</option><option>9</option><option>10</option><option>11</option>
          <option>12</option><option>13</option><option>14</option><option>15</option>
          </select></td>
    </tr>
   <tr>
   <td>Upload Image:</td>
   <td>
   <label for="fileField"></label>
  <input type="file" name="photo" size="50" />
  </td>
  </tr>
  </table>
  <p>
    <label for="textfield7"></label>
    <input type="submit" name="button" id="button" value="Submit" /><br>
  </p>
</form>
</center>
<center><a href="L4">Logout</a>(If You Want)</center>
<%} %>
</body>
</html>
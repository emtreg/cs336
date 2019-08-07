<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
	<% out.println("Login or Sign Up"); %>

	<br>
	<br> Enter username and password or sign up.   
	<br>
	<br>
	<form method="post" action="customerHome.jsp">
		<table>
			<tr>
				<td>Username</td>
				<td><input type="text" name="user_id"></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="text" name="password"></td>
			</tr>
		</table>
		<input type="submit" value="Login">
	</form>
	<br>
	<br>
	<form method="post" action="register.jsp">
		<input type="submit" value="Create New Account">
	</form>
	<br>
	<form method="post" action="employeeLogin.jsp">
		<input type="submit" value="Employee Login">
	</form>
</body>
</html>
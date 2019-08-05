<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Login</title>
</head>
<body>
	<% out.println("Employee Login"); %>
	<br>
	<br> Enter ID and password.
	<br>
	<br>
	<form method="post" action="employeeHome.jsp">
		<table>
			<tr>
				<td>Employee ID</td>
				<td><input type="text" name="employee_id"></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="text" name="password"></td>
			</tr>
		</table>
		<input type="submit" value="Login">
	</form>
</body>
</html>
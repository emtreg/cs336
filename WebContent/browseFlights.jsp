<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Flights</title>
</head>
<body>
	<% //sort flights by diff criteria (prce, take-off time, landing time)%>

	<% //filter the list of flights by various criteria (price, nuber of stops, airline)%>
	
	<% //let customers make flight reservations%>
	<form method="post" action="MakeReservation.jsp">
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
		<% //enter waitling list if flight is full -- Popup?%>

</body>
</html>
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
	<h3>Flights</h3>
	<%try{
		
	}
	catch (Exception e) {
		out.print(e);
	}
	%>
	<% //let customers make flight reservations%>

		<% //enter waitling list if flight is full -- Popup?%>
	<center>	
		<% //sort flights by diff criteria (price, take-off time, landing time)%>
		<h3>Sort by</h3>
		
		<% //filter the list of flights by various criteria (price, nuber of stops, airline)%>
		<h3>Filter</h3>
	</center>
</body>
</html>
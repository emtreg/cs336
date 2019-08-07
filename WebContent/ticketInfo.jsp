<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	table, th, td{
		border:1px solid black;
		border-collapse: collapse;
	}
	td{
		text-align: center;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ticket Information</title>
</head>
<body>
	<h1>Ticket Information</h1>
	<%
	try{
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();		
		Statement stmt = con.createStatement();
		
		String user = request.getParameter("command");
		String str = "SELECT * FROM Reservations join Flights using (flight_num) where user_id='"+user+"';";  
		ResultSet result = stmt.executeQuery(str); 
		
		
		//close the connection.
		db.closeConnection(con);
	}catch(Exception e){
		out.println(e);
	}
	%>
</body>
</html>
<!-- Code Done by Erika Cruz -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Confirm Ticket</title>
</head>
<body>
	<%
	try{
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();		
		Statement stmt = con.createStatement(); 
		
		String user= request.getParameter("submit");
		String meal= request.getParameter("meal");
		String classType= request.getParameter("class");
		String seat= request.getParameter("trip");
		
		
		
		out.print("Ticket Purchase Successful. Thank you for your purchase");	
		%>
		<form method="post" action="upcomingReservations.jsp">
			<button type="submit" name="command" value="<%=user%>">View Your Upcoming Flights</button> 
		</form>
		<%
		con.close();
	}catch(Exception e){
		out.print(e);
	}%>
</body>
</html>
<!-- Code Done by Erika Cruz -->
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
		
		String userflight = request.getParameter("ticket");
		int comma = userflight.indexOf(','); 
		
		String user = userflight.substring(0,comma);
		String flight= userflight.substring(comma+1);

		String str = "SELECT * FROM Tickets t join Flights using (flight_num) where user_id='"+user+"' and flight_num= '"+flight+"';";  
		ResultSet result = stmt.executeQuery(str); 
		
		%>
		<table frame="box" style="width:100%">
		<tr><th><b>Ticket #</b></th>
			<th><b>Flight #</b></th>
			<th><b>Departure Time</b></th>
			<th><b>Booking Fee</b></th>
			<th><b>Purchase Date</b></th>
			<th><b>Purchase Time</b></th>
			<th><b>Class</b></th>
			<th><b>Seat</b></th>
			<th><b>Special Meal</b></th>
			<th><b>Total Cost</b></th>
		</tr>
		
		<%
		//parse out the results
		while (result.next()) {
		%> 
			<tr><td><%= result.getString("ticket_num")%></td>
				<td><%= result.getString("flight_num")%></td>
				<td><%= result.getString("depart_time")%></td>
				<td><%= result.getString("booking_fee")%></td>
				<td><%= result.getString("purchase_date")%></td>
				<td><%= result.getString("purchase_time")%></td>
				<td><%= result.getString("class")%></td>
				<td><%= result.getString("seat_num")%></td>
				<td><%= result.getString("special_meal")%></td>
				<td><%= result.getFloat("total_cost")%></td>
				
			</tr>
		<%
		}
		%>
		</table>
		
		<br><br><form method="post" action="logout.jsp">
				<br><br><input type="submit" value="Logout">
			</form>
		<%
		//close the connection.
		db.closeConnection(con);
	}catch(Exception e){
		out.println(e);
	}
	%>
</body>
</html>
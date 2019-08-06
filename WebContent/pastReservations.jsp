<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Past Reservations</title>
</head>
<body>
	<h1>Past Reservations</h1>
	<%
		try {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		
			Statement stmt = con.createStatement();
			
			//Get the selected radio button from the index.jsp
			String entity = request.getParameter("command");
			out.print(entity);
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "SELECT * FROM Reservations join Tickets using (ticket_num) where user_id='" + entity+ "';";  
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str); 
			%>
				
			<table>
				<tr><td><b>Ticket Number</b></td>
					<td><b>Flight</b></td>
					<td><b>Departure</b></td>
					<td><b>Arrival</b></td>
					<td><b>Departure Time</b></td>
					<td><b>Arrival Time</b></td>
					<td><b>Aircraft</b></td>
					<td><b>Airline</b></td>
				</tr>
				
				<%
				//parse out the results
				while (result.next()) {
				%> 
					<tr><td><%= result.getString("ticket_num")%></td>
						<td><%= result.getString("depart_airport_id")%></td>
						<td><%= result.getString("arrival_airport_id")%></td>
						<td><%= result.getString("depart_time")%></td>
						<td><%= result.getString("arrival_time")%></td>
						<td><%= result.getString("flight_type")%></td>
						<td><%= result.getString("aircraft_id")%></td>
						<td><%= result.getString("airline_id")%></td>
					</tr>
				<%
				}
				%>
			</table>
			<%
			//close the connection.
			db.closeConnection(con);
		} catch (Exception e) {
			out.print(e);
		}
	%>
</body>
</html>
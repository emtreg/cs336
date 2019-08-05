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
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "SELECT * FROM Reservations where user_id=" + entity;
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			%>
				
			<table>
				<tr><td>Ticket Number</td>
					<td>Flight</td>
					<td>Departure</td>
					<td>Arrived</td>
					<td>Airline</td>
				</tr>
				
				<%
				//parse out the results
				while (result.next()) {
				%> 
					<tr><td>out.print(result.getString("ticket_id"));</td>
						<td>out.print(result.getString("flight_id"));</td>
						<td>out.print(result.getString("depart_airport_id"));</td>
						<td>out.print(result.getString("arrival_airport_id"));</td>
						<td>out.print(result.getString("airline_id"));</td>
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
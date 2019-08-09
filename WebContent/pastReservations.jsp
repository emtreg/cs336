<!-- Code Done by Erika Cruz -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

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
<title>Past Reservations</title>
</head>
<body>
	<h1>Past Reservations</h1>
	<%
		try {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		
			Statement stmt = con.createStatement();
			
			String user = request.getParameter("command");
			String select = "SELECT * FROM Reservations";  
			String join= " JOIN Flights using (flight_num)";
			String where= " WHERE user_id='"+user+"' and DATE(NOW())>DATE(depart_time);";
			
			ResultSet result = stmt.executeQuery(select+join+where); 
			%>
				
			<table frame="box" style="width:100%">
				<tr><th><b>Flight #</b></th>
					<th><b>Departure Airport</b></th>
					<th><b>Departure Time</b></th>
					<th><b>Arrival Airport</b></th>
					<th><b>Arrival Time</b></th>
					<th><b>Flight Type</b></th>
					<th><b>Aircraft</b></th>
					<th><b>Airline</b></th>
				</tr>
				
				<%
				//parse out the results
				while (result.next()) {
				%> 
					<tr><td><%= result.getString("flight_num")%></td>
						<td><%= result.getString("depart_airport_id")%></td>
						<td><%= result.getString("arrival_airport_id")%></td>
						<td><%= result.getString("depart_time")%></td>
						<td><%= result.getString("arrival_time")%></td>
						<td><%= result.getString("flight_type")%></td>
						<td><%= result.getString("aircraft_id")%></td>
						<td><%= result.getString("airline_id")%></td>
						
						<td><form method="post" action="ticketInfo.jsp">
							<button type="submit" name="ticket" value="<%=user%>,<%=result.getString("flight_num")%>">View Ticket Info</button> 
						</form></td>
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
		} catch (Exception e) {
			out.print(e);
		}
	%>
</body>
</html>
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
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();		
		Statement stmt = con.createStatement(); 
		
		String depart= request.getParameter("depart");
		String arrival= request.getParameter("arrival");
		out.print("d "+depart);
		out.print("a "+arrival);
		String str= "Select * from Flights where depart_airport_id= '"+depart+"' and arrival_airport_id='"+arrival+"';";
		
		ResultSet flights = stmt.executeQuery(str);
		%>	
		<table>
				<tr><td><b>Flight #</b></td>
					<td><b>Departure Airport</b></td>
					<td><b>Departure Time</b></td>
					<td><b>Arrival Airport</b></td>
					<td><b>Arrival Time</b></td>
					<td><b>Class</b></td>
					<td><b>Flight Type</b></td>
					<td><b>Aircraft</b></td>
					<td><b>Airline</b></td>
					<td><b>Total Cost</b></td>
				</tr>
				
				<%
				//parse out the results
				while (flights.next()) {
					out.print("<tr><td>");
					out.print(flights.getString("flight_num"));					
					out.print("</td>");
					out.print("<td>");
					out.print("</td>");
					out.print("<td>");					
					out.print(flights.getString("depart_airport_id"));					
					out.print("</td>");
					out.print("<td>");
					out.print("</td>");
					out.print("<td>");					
					out.print(flights.getString("arrival_airport_id"));					
					out.print("</td>");
					out.print("<td>");
					out.print("</td>");
					out.print("<td>");					
					out.print(flights.getString("depart_time"));
					out.print("</td>");	
					out.print("<td>");					
					out.print(flights.getString("arrival_time"));
					out.print("</td>");	
					out.print("<td>");					
					out.print(flights.getString("flight_type"));
					out.print("</td>");
					out.print("<td>");		
					out.print("</td>");	
					out.print("<td>");		
					out.print("</td>");	
					out.print("<td>");		
					out.print("</td>");	
					out.print("<td>");					
					out.print(flights.getString("aircraft_id"));
					out.print("</td>");	
					out.print("<td>");		
					out.print("</td>");	
					out.print("<td>");		
					out.print("</td>");	
					out.print("<td>");					
					out.print(flights.getString("airline_id"));
					out.print("</td>");	
					out.print("</tr>");
				}
	}catch (Exception e) {
		out.print(e);
	}
				%>
		</table>
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
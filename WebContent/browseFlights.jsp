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
		String trip= request.getParameter("trip");
		
		//Getting OneWay DB or RoundTrip DB
		String select= "Select * from "+trip;
		String join=" JOIN Flights f using (flight_num)";
		String where= " WHERE f.depart_airport_id= '"+depart+"' and f.arrival_airport_id='"+arrival+"';";
		
		ResultSet flights = stmt.executeQuery(select+join+where);
		
		%>	
		<table frame="box" style="width:90%">
				<tr><th><b>Flight #</b></th>
					<th><b>Departure Airport</b></th>
					<th><b>Departure Time</b></th>
					<th><b>Arrival Airport</b></th>
					<th><b>Arrival Time</b></th>
					<th><b>Flight Type</b></th>
					<th><b>Aircraft</b></th>
					<th><b>Airline</b></th>
					<%
					if(trip.equals("RoundTrip")){
						%>
						<th><b>Return Flight#</b></th>
						<th><b>Return Flight Date and Time</b></th>
						<%
					}
				%>
				</tr>
				
				<% 
		while(flights.next()){
		%>
			<tr><td><%=flights.getString("flight_num")%></td>
				<td><%=flights.getString("depart_airport_id")%></td>
				<td><%=flights.getString("depart_time")%></td>
				<td><%=flights.getString("arrival_airport_id")%></td>
				<td><%=flights.getString("arrival_time") %></td>
				<td><%=flights.getString("flight_type") %></td>
				<td><%=flights.getString("aircraft_id") %></td>
				<td><%=flights.getString("airline_id") %></td>
				<%
					if(trip.equals("RoundTrip")){
						%>
						<td><%=flights.getString("return_flight")%></td>
						
						<%
					}
				%>
			</tr>					
					<%
				}%>
		</table>
	<%			
	}catch (Exception e) {
		out.print(e);
	}
				%>
		
		<!--let customers make flight reservations-->

		<!--enter waitling list if flight is full -- Popup?-->
	<center>	
		<!--sort flights by diff criteria (price, take-off time, landing time)-->
		<h3>Sort by</h3>
		
		<!--filter the list of flights by various criteria (price, nuber of stops, airline)-->
		<h3>Filter</h3>
	</center>
</body>
</html>
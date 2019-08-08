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
<title>Flights</title>
</head> 
<body>
	<h3>Flights</h3>
		<!--enter waitling list if flight is full -- Popup?-->
	<center>	
		<!--sort flights by diff criteria (price, take-off time, landing time)-->
		<h3>Sort by</h3>
		<form method="post" action="sellsNewBeer.jsp">
		Price:
			<input type="radio" name="sortprice" value="highlow"/>Highest to Lowest
			<input type="radio" name="sortprice" value="lowhigh"/>Lowest to Highest
		
		<br>Depart Time:
			<input type="radio" name="sortdepart" value="soonlater"/>Sooner to Later
			<input type="radio" name="sortdepart" value="latersooner"/>Later to Sooner
			
		<br>OR
		<br>Arrival Time:
			<input type="radio" name="sortarrival" value="soonlater"/>Sooner to Later
			<input type="radio" name="sortarrival" value="latersooner"/>Later to Sooner
			
		<br><input type="submit" value="Sort">
		</form>

		
		<!--filter the list of flights by various criteria (price, nuber of stops, airline)-->
		<h3>Filter</h3>
		Price:
		<form method="post" action="query.jsp">
			<select name="price" size=1>
				<option value="1.0">$100-300</option>
				<option value="3.0">$300-500</option>
				<option value="5.0">$500-800</option>
				<option value="8.0">$800 and over</option>
			</select>&nbsp;<br> <input type="submit" value="submit">
		</form>
		
		Number of Stops:
		
		Airline:
		
	</center>
	
	<%try{
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();		
		Statement stmt = con.createStatement(); 
		
		String user= request.getParameter("submit");
		String depart= request.getParameter("depart");
		String arrival= request.getParameter("arrival");
		String trip= request.getParameter("trip");
		String flex= request.getParameter("flex");
		String date= request.getParameter("date");		
		
		//Getting OneWay DB or RoundTrip DB
		String select= "Select * from "+trip;
		String join=" JOIN Flights f using (flight_num)";
		String dquery= " JOIN (select abs(datediff('"+date+"',DATE(depart_time))) diff,flight_num from Flights) t using (flight_num)";
		String wherePort= " WHERE f.depart_airport_id= '"+depart+"' and f.arrival_airport_id='"+arrival+flex;
		
		ResultSet flights = stmt.executeQuery(select+join+dquery+wherePort);
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
					<%
					if(trip.equals("RoundTrip")){
						%>
						<th><b>Return Flight#</b></th>
						<th><b>Return Flight Date and Time</b></th>
						<%
					}
				%>
					<th><b>Price</b></th>
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
						String q= "(SELECT r.return_flight FROM RoundTrip r JOIN Flights f using (flight_num)";
						String qWhere =" WHERE f.flight_num='"+flights.getString("flight_num")+"');";
						ResultSet returnDate = stmt.executeQuery("SELECT f.depart_time FROM Flights f WHERE f.flight_num="+q+qWhere);
						
						returnDate.next();
						%>
						<td><%=returnDate.getString("depart_time")%></td>	
						<%
					}
				%>
				<td><%=flights.getString("Price") %></td>
				
				<!--let customers make flight reservations-->
				<td><form method="post" action="reservingFlight.jsp">
							<button type="submit" name="ticket" value="<%=user%>,<%=flights.getString("flight_num")%>">Reserve Spot for Flight</button> 
					</form></td>
			</tr>		
		<%
		}%>
		</table>
	<%			
		//close the connection.
		db.closeConnection(con);
	}catch (Exception e) {
		out.print(e);
	}
	%>
</body>
</html>
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
	
	<%try{
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();		
		Statement stmt = con.createStatement(); 
		Connection con2 = db.getConnection();	
		Statement stmt2 = con.createStatement(); 
		//Flight Choices
		String user= request.getParameter("submit");
		String depart= request.getParameter("depart");
		String arrival= request.getParameter("arrival");
		String trip= request.getParameter("trip");
		String flex= request.getParameter("flex");
		String date= request.getParameter("date");	
		
		//Getting OneWay DB or RoundTrip DB
		String select= "Select * from "+trip;
		String join=" JOIN Flights f using (flight_num)";
		String resJOIN= " JOIN Reservations r (flight_num)";
		String dquery= " JOIN (select abs(datediff('"+date+"',DATE(depart_time))) diff,flight_num from Flights) t using (flight_num)";
				
		//Sort Choices
		String sort= request.getParameter("sort");
		String orderBy=";";
		if(sort.equals("ATlatersooner")){
			orderBy=" ORDER BY arrival_time DESC;";			
		}else if(sort.equals("pricehighlow")){
			orderBy=" ORDER BY price DESC;";
		}else if(sort.equals("pricelowhigh")){
			orderBy=" ORDER BY price ASC;";
		}else if(sort.equals("DTsoonerlater")){
			orderBy=" ORDER BY depart_time ASC;";
		}else if(sort.equals("DTlatersooner")){
			orderBy=" ORDER BY depart_time DESC;";
		}else if(sort.equals("ATsoonerlater")){
			orderBy=" ORDER BY arrival_time ASC;";
		}else{
			orderBy=";";
		}
		
		//Filter Choices
		String price= request.getParameter("price"); //Under 300,500, or 800
		String numStops= request.getParameter("stops"); //0,1,2+
		String airline= request.getParameter("airline");	
		String filter;
		
		if(price.equals("300")||price.equals("500")||price.equals("1000")){
			filter=" and f.price<="+price;
		}else{
			filter="";
		}
		
		if(numStops.equals("0")||numStops.equals("1")){
			filter=filter+" and f.stops="+numStops;
		}
		else if(numStops.equals("2+")){ 
			filter=filter+" and f.stops>=2";
		}
		else{
			filter= filter+"";
		}
		
		if(airline.equals("null")){
			filter=filter+"";
		}
		else{
			filter=filter+" and f.airline_id='"+airline+"'";			
		}
		
		//To get rid of Flights the User is already reserved to
		String q= " and f.flight_num not in (SELECT flight_num FROM Reservations WHERE user_id='"+user+"')";
		String wherePort= " WHERE f.depart_airport_id= '"+depart+"' and f.arrival_airport_id='"+arrival+flex+filter+q;
		
		//out.print(select+join+dquery+wherePort+orderBy);
		ResultSet flights = stmt.executeQuery(select+join+dquery+wherePort+orderBy);
		
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
					<th><b>Stops</b></th>
					
					<% if(trip.equals("RoundTrip")){
						out.print("<th><b>Return Flight#</b></th>");
						out.print("<th><b>Return Flight Date and Time</b></th>");
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
				<td><%=flights.getString("stops") %></td>
				
				<%float flightPrice= flights.getFloat("Price");
				String flight_num= flights.getString("flight_num");
				
				if(trip.equals("RoundTrip")){
					String selectq= "SELECT f.flight_num, f.depart_time FROM Flights f WHERE f.flight_num=";
					String q2= "(SELECT r.return_flight FROM RoundTrip r JOIN Flights f using (flight_num)";
					String qWhere =" WHERE f.flight_num='"+flights.getString("flight_num")+"');";
					ResultSet returnDate = stmt2.executeQuery(selectq+q2+qWhere);
					//out.print(selectq+q2+qWhere);
						
					returnDate.next();
						String rFlight=returnDate.getString("flight_num");
						String rDTime=returnDate.getString("depart_time");
						
						out.print("<td>"+rFlight+"</td>");
						out.print("<td>"+rDTime+"</td>");
					
				}
				%>
				
				<td><%=flightPrice%></td>
				
				<!--let customers make flight reservations-->
				<td><form method="post" action="reserveSpot.jsp">
							<button type="submit" name="ticket" value="<%=user%>,<%=flight_num%>">Reserve Spot for Flight</button> 
					</form></td>
			</tr>		
		<%
		}%>
		</table>
		
	<%			
		//close the connection.
		con.close();
		con2.close();
		db.closeConnection(con);
	    db.closeConnection(con2);
	}catch (Exception e) {
		out.print(e);
	}
	%>
</body>
</html>
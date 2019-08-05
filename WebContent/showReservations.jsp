<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Flight Reservations</title>
</head>
<body>
<%
try {

	//Get the database connection
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	
	//Create a SQL statement
	Statement stmt = con.createStatement();
	String customer_id = request.getParameter("customer_id");
	String flight_num = request.getParameter("flight_num");
	
	//Make a SELECT query from the Flights table using the flight_num in the reserves table where user_id equals the entered customer id
	String str = "SELECT * FROM Flights JOIN reserves using(flight_num) WHERE reserves.user_id = '" + customer_id + "'";
	
	//Run the query against the database.
	//if user does not match any from db then do ERROR
	ResultSet result = stmt.executeQuery(str);
	
	//Make an HTML table to show the results in:
	out.print("<b>");
	out.print("Customer Reservations: ");
	out.print("</b>");
	out.print("<br>");
	out.print("<br>");
	
	out.print("<table>");
	out.print("<tr>");
	out.print("<td>");
	out.print("<b>");
	out.print("Flight Number");
	out.print("</b>");
	out.print("</td>");
	out.print("<td>");
	out.print("</td>");
	out.print("<td>");
	out.print("<b>");
	out.print("Departure Airport");
	out.print("</b>");
	out.print("</td>");
	out.print("<td>");
	out.print("</td>");
	out.print("<td>");
	out.print("<b>");
	out.print("Arrival Airport");
	out.print("</b>");
	out.print("</td>");
	out.print("<td>");
	out.print("</td>");
	out.print("<td>");
	out.print("<b>");
	out.print("Departure Time");
	out.print("</b>");
	out.print("</td>");	
	out.print("<td>");
	out.print("<b>");
	out.print("Arrival Time");
	out.print("</b>");
	out.print("</td>");	
	out.print("<td>");
	out.print("<b>");
	out.print("Flight Type");
	out.print("</b>");
	out.print("</td>");	
	out.print("<td>");		
	out.print("</td>");	
	out.print("<td>");		
	out.print("</td>");	
	out.print("<td>");		
	out.print("</td>");	
	out.print("<td>");
	out.print("<b>");
	out.print("Aircraft");
	out.print("</b>");
	out.print("</td>");	
	out.print("<td>");		
	out.print("</td>");	
	out.print("<td>");		
	out.print("</td>");	
	out.print("<td>");
	out.print("<b>");
	out.print("Airline");
	out.print("</b>");
	out.print("</td>");	
	out.print("</tr>");
	
	//parse out the results
	while (result.next()) {
		//make a row
		out.print("<tr>");
		out.print("<td>");
		out.print(result.getString("flight_num"));					
		out.print("</td>");
		out.print("<td>");
		out.print("</td>");
		out.print("<td>");					
		out.print(result.getString("depart_airport_id"));					
		out.print("</td>");
		out.print("<td>");
		out.print("</td>");
		out.print("<td>");					
		out.print(result.getString("arrival_airport_id"));					
		out.print("</td>");
		out.print("<td>");
		out.print("</td>");
		out.print("<td>");					
		out.print(result.getString("depart_time"));
		out.print("</td>");	
		out.print("<td>");					
		out.print(result.getString("arrival_time"));
		out.print("</td>");	
		out.print("<td>");					
		out.print(result.getString("flight_type"));
		out.print("</td>");
		out.print("<td>");		
		out.print("</td>");	
		out.print("<td>");		
		out.print("</td>");	
		out.print("<td>");		
		out.print("</td>");	
		out.print("<td>");					
		out.print(result.getString("aircraft_id"));
		out.print("</td>");	
		out.print("<td>");		
		out.print("</td>");	
		out.print("<td>");		
		out.print("</td>");	
		out.print("<td>");					
		out.print(result.getString("airline_id"));
		out.print("</td>");	
		out.print("</tr>");
	}
	
	out.print("</table>");
	
	%>
	
	<br>
	<br> Enter flight number of reservation you wish to edit.   
	<br>
	<br>
	<form method="post" action="editReservation.jsp">
		<table>
			<tr>
				<td>Flight number: </td>
				<td><input type="text" name="flight_num"></td>
			</tr>
			<tr>
				<td>Customer ID: </td>
				<td><input type="text" name="customer_id"></td>
			</tr>
		</table>
		<br>
		<input type="submit" value="Submit">
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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Data</title>
</head>
<body>

<%
	    
try {
	
	//Get the database connection
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();		

	//Create a SQL statement
	Statement stmt = con.createStatement();
	
	//Get the selected radio button from the employeeHome.jsp
	String entity = request.getParameter("command");
	
	//Make a SELECT query from the table specified by the 'command' parameter at the employeeHome.jsp
	String str = "SELECT * FROM " + entity;
	
	//Run the query against the database.
	ResultSet result = stmt.executeQuery(str);
	
	
	//depending on the radio button selection make a table with the appropriate columns 
	if (entity.equals("Airport")) {
		
		out.print("<table>");
		out.print("<tr>");
		out.print("<td>");
		out.print("<b>");
		out.print("ID");
		out.print("</b>");
		out.print("</td>");
		out.print("<td>");
		out.print("</td>");
		out.print("<td>");
		out.print("<b>");
		out.print("Name");
		out.print("</b>");
		out.print("</td>");
		out.print("<td>");
		out.print("</td>");
		out.print("<td>");
		out.print("<b>");
		out.print("City");
		out.print("</b>");
		out.print("</td>");
		out.print("<td>");
		out.print("</td>");
		out.print("<td>");
		out.print("<b>");
		out.print("Country");
		out.print("</b>");
		out.print("</td>");	
		out.print("</tr>");
		
		//parse out the results
		while (result.next()) {
			//make a row
			out.print("<tr>");
			out.print("<td>");
			out.print(result.getString("airport_id"));					
			out.print("</td>");
			out.print("<td>");
			out.print("</td>");
			out.print("<td>");					
			out.print(result.getString("name"));					
			out.print("</td>");
			out.print("<td>");
			out.print("</td>");
			out.print("<td>");					
			out.print(result.getString("city"));					
			out.print("</td>");
			out.print("<td>");
			out.print("</td>");
			out.print("<td>");					
			out.print(result.getString("country"));
			out.print("</td>");						
			out.print("</tr>");
		}
		
		out.print("</table>");
		
%>

<b>
<br> Add new airport:   
</b>
<br>
<br>
<form method="post" action="addAirport.jsp">
	<table>
		<tr>
			<td>Airport ID: </td>
			<td><input type="text" name="airport_id"></td>
		</tr>
		<tr>
			<td>Airport name: </td>
			<td><input type="text" name="airport_name"></td>
		</tr>
		<tr>
			<td>City: </td>
			<td><input type="text" name="city"></td>
		</tr>
		<tr>
			<td>Country: </td>
			<td><input type="text" name="country"></td>
		</tr>
	</table>
	<br>
	<input type="submit" value="Add">
</form>
<br>
<br> 
<b>
Delete airport: 
</b>  
<br>
<br>
<form method="post" action="deleteAirport.jsp">
	<table>
		<tr>
			<td>Airport ID: </td>
			<td><input type="text" name="airport_id"></td>
		</tr>
	</table>
	<br>
	<input type="submit" value="Delete">
</form>
<br>
<br> 
<b>
Edit airport information: 
</b>  
<br>
<br>
<form method="post" action="editAirport.jsp">
	<table>
		<tr>
			<td>Airport ID: </td>
			<td><input type="text" name="airport_id"></td>
		</tr>
	</table>
	<br>

	Select the field you wish to update for this airport:
	<br>
	<br>
	<select name="field" size=1>
			<option value="airport_id">Airport ID</option>
			<option value="name">Airport name</option>
			<option value="city">City</option>
			<option value="country">Country</option>
	</select>&nbsp;
	<br>
	<br> 
	Enter the new value for selected field:
	<br>
	<br>
	<table>
		<tr>
			<td>New Value: </td>
			<td><input type="text" name="new_value"></td>
		</tr>
	</table>
	<br>
	<input type="submit" value="Update">
</form>
<br>
<br>
	
<%
				
	} else if (entity.equals("Aircraft")) {
				
		out.print("<table>");
		out.print("<tr>");
		out.print("<td>");
		out.print("<b>");
		out.print("ID");
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
		out.print("<td>");
		out.print("</td>");
		out.print("<td>");
		out.print("</td>");
		out.print("<td>");
		out.print("<b>");
		out.print("Name");
		out.print("</b>");
		out.print("</td>");
		out.print("<td>");
		out.print("</td>");
		out.print("<td>");
		out.print("</td>");
		out.print("<td>");
		out.print("<b>");
		out.print("Available Seats");
		out.print("</b>");
		out.print("</td>");	
		
		/* out.print("<td>");
		out.print("</td>");
		out.print("<td>");
		out.print("<b>");
		out.print("Economy Seats");
		out.print("</b>");
		out.print("</td>");	
		out.print("<td>");
		out.print("</td>");
		out.print("<td>");
		out.print("<b>");
		out.print("First Class Seats");
		out.print("</b>");
		out.print("</td>");	 */
		out.print("</tr>");
		
		//parse out the results
		while (result.next()) {
			//make a row
			out.print("<tr>");
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
			out.print("<td>");
			out.print("</td>");
			out.print("<td>");
			out.print("</td>");
			out.print("<td>");					
			out.print(result.getString("name"));					
			out.print("</td>");
			out.print("<td>");
			out.print("</td>");
			out.print("<td>");
			out.print("</td>");
			out.print("<td>");					
			out.print(result.getString("available_seat"));
			out.print("</td>");
			
			/* out.print("<td>");
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("econ_seats"));
			out.print("</td>");	
			out.print("<td>");
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("first_seats"));
			out.print("</td>");	
			out.print("</tr>"); */
		}
		
		out.print("</table>");
		
%>
	
<br>
<b> 
Add new aircraft: 
</b>  
<br>
<br>
<form method="post" action="addAircraft.jsp">
	<table>
		<tr>
			<td>Aircraft ID: </td>
			<td><input type="text" name="aircraft_id"></td>
		</tr>
		<tr>
			<td>Airline ID: </td>
			<td><input type="text" name="airline_id"></td>
		</tr>
		<tr>
			<td>Aircraft Name: </td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>Available seats: </td>
			<td><input type="text" name="num_seats"></td>
		</tr>
		<!-- <tr>
			<td>Number of economy seats: </td>
			<td><input type="text" name="economy_seats"></td>
		</tr>
		<tr>
			<td>Number of first class seats: </td>
			<td><input type="text" name="first_seats"></td>
		</tr> -->
	</table>
	<br>
	<input type="submit" value="Add">
</form>
<br>
<br>
<b>
Delete aircraft:
</b>    
<br>
<br>
<form method="post" action="deleteAircraft.jsp">
	<table>
		<tr>
			<td>Aircraft ID: </td>
			<td><input type="text" name="aircraft_id"></td>
		</tr>
	</table>
	<br>
	<input type="submit" value="Delete">
</form>
<br>
<b>
Edit aircraft information: 
</b>  
<br>
<br>
<form method="post" action="editAircraft.jsp">
	<table>
		<tr>
			<td>Aircraft ID: </td>
			<td><input type="text" name="aircraft_id"></td>
		</tr>
	</table>
	<br>

	Select the field you wish to update for this aircraft:
	<br>
	<br>
	<select name="field" size=1>
			<option value="aircraft_id">Aircraft ID</option>
			<option value="airline_id">Airline ID</option>
			<option value="name">Aircraft Name</option>
			<option value="available_seat">Available Seats</option>
			
			<!-- <option value="econ_seats">Economy Seats</option>
			<option value="first_seats">First Class Seats</option> -->
			
	</select>&nbsp;
	<br>
	<br> 
	Enter the new value for selected field:
	<br>
	<br>
	<table>
		<tr>
			<td>New Value: </td>
			<td><input type="text" name="new_value"></td>
		</tr>
	</table>
	<br>
	<input type="submit" value="Update">
</form>
<br>
<br>

<%
				
	} else if (entity.equals("Flights")) {
				
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
		out.print("Departure Date/Time");
		out.print("</b>");
		out.print("</td>");	
		out.print("<td>");
		out.print("<b>");
		out.print("Arrival Date/Time");
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
		out.print("<td>");		
		out.print("</td>");	
		out.print("<td>");		
		out.print("</td>");	
		out.print("<td>");		
		out.print("</td>");	
		out.print("<td>");
		out.print("<b>");
		out.print("Stops");
		out.print("</b>");
		out.print("<td>");		
		out.print("</td>");	
		out.print("<td>");		
		out.print("</td>");	
		out.print("<td>");		
		out.print("</td>");	
		out.print("<td>");
		out.print("<b>");
		out.print("Price");
		out.print("</b>");
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
			out.print("<td>");		
			out.print("</td>");	
			out.print("<td>");		
			out.print("</td>");	
			out.print("<td>");		
			out.print("</td>");	
			out.print("<td>");					
			out.print(result.getString("stops"));
			out.print("</td>");	
			out.print("<td>");		
			out.print("</td>");	
			out.print("<td>");		
			out.print("</td>");	
			out.print("<td>");		
			out.print("</td>");	
			out.print("<td>");					
			out.print(result.getString("Price"));
			out.print("</td>");	
			out.print("</tr>");
		}
		
		out.print("</table>");
		
%>

<br> 
<b>
Add new flight: 
</b>  
<br>
<br>
<form method="post" action="addFlight.jsp">
	<table>
		<tr>
			<td>Flight Number: </td>
			<td><input type="text" name="flight_num"></td>
		</tr>
		<tr>
			<td>Departure Airport ID: </td>
			<td><input type="text" name="depart_airport_id"></td>
		</tr>
		<tr>
			<td>Arrival Airport ID: </td>
			<td><input type="text" name="arrival_airport_id"></td>
		</tr>
		<tr>
			<td>Departure Date/Time (YYYY:MM:DD HH:MM:SS): </td>
			<td><input type="text" name="depart_time"></td>
		</tr>
		<tr>
			<td>Arrival Date/Time (YYYY:MM:DD HH:MM:SS): </td>
			<td><input type="text" name="arrival_time"></td>
		</tr>
		<tr>
			<td>Flight Type (International/Domestic): </td>
			<td><input type="text" name="flight_type"></td>
		</tr>
		<tr>
			<td>Aircraft ID: </td>
			<td><input type="text" name="aircraft_id"></td>
		</tr>
		<tr>
			<td>Airline ID: </td>
			<td><input type="text" name="airline_id"></td>
		</tr>
		<tr>
			<td>Stops: </td>
			<td><input type="text" name="stops"></td>
		</tr>
		<tr>
			<td>Price: </td>
			<td><input type="text" name="price"></td>
		</tr>
	</table>
	<br>
	<input type="submit" value="Add">
</form>
<br>
<br> 
<b>
Delete flight:   
</b>
<br>
<br>
<form method="post" action="deleteFlight.jsp">
	<table>
		<tr>
			<td>Flight Number: </td>
			<td><input type="text" name="flight_num"></td>
		</tr>
	</table>
	<br>
	<input type="submit" value="Delete">
</form>
<br>
<br>
<b>
Edit flight information: 
</b>  
<br>
<br>
<form method="post" action="editFlight.jsp">
	<table>
		<tr>
			<td>Flight Number: </td>
			<td><input type="text" name="flight_number"></td>
		</tr>
	</table>
	<br>
	Select the field you wish to update for this flight:
	<br>
	<br>
	<select name="field" size=1>
			<option value="flight_num">Flight Number</option>
			<option value="depart_airport_id">Departure Airport ID</option>
			<option value="arrival_airport_id">Arrival Airport ID</option>
			<option value="depart_time">Departure Date/Time</option>
			<option value="arrival_time">Arrival Date/Time</option>
			<option value="flight_type">Flight Type</option>
			<option value="aircraft_id">Aircraft ID</option>
			<option value="airline_id">Airline ID</option>
	</select>&nbsp;
	<br>
	<br> 
	Enter the new value for selected field:
	<br>
	<br>
	<table>
		<tr>
			<td>New Value: </td>
			<td><input type="text" name="new_value"></td>
		</tr>
	</table>
	<br>
	<input type="submit" value="Update">
</form>
<br>
<br>

<%

	}
		
	//close the connection.
	db.closeConnection(con);
			
} catch (Exception e) {
	out.print(e);
}

%>

</body>
</html>
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

<br> Add new airport:   
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
<br> Delete airport:   
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
<br> Edit airport information:   
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
	<input type="submit" value="Edit">
</form>

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
				out.print("Business Seats");
				out.print("</b>");
				out.print("</td>");	
				out.print("<td>");
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
				out.print("</td>");	
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
					out.print(result.getString("business seats"));
					out.print("</td>");
					out.print("<td>");
					out.print("</td>");
					out.print("<td>");
					out.print(result.getString("econ seats"));
					out.print("</td>");	
					out.print("<td>");
					out.print("</td>");
					out.print("<td>");
					out.print(result.getString("first seats"));
					out.print("</td>");	
					out.print("</tr>");
				}
				
				out.print("</table>");
				
				%>

				<br>
				<br> Enter ID of Aircraft that you wish to edit.   
				<br>
				<br>
				<form method="post" action="editTable.jsp">
					<table>
						<tr>
							<td>Aircraft ID: </td>
							<td><input type="text" name="aircraft_id"></td>
						</tr>
					</table>
					<br>
					<input type="submit" value="Submit">
				</form>

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
				<br> Enter number of flight that you wish to edit.   
				<br>
				<br>
				<form method="post" action="editTable.jsp">
					<table>
						<tr>
							<td>Flight Number: </td>
							<td><input type="text" name="flight_num"></td>
						</tr>
					</table>
					<br>
					<input type="submit" value="Submit">
				</form>

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
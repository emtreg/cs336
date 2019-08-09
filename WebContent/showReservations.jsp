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
	
	session.setAttribute("customer", customer_id);
	
	//Make a SELECT query from the Flights table using the flight_num in the reserves table where user_id equals the entered customer id
	String str1 = "SELECT * FROM user WHERE user_id = '" + customer_id + "'";
	String str2 = "SELECT * FROM Tickets WHERE Tickets.user_id = '" + customer_id + "'";
	
	//Run the query against the database.
	//if user does not match any from db then do ERROR
	ResultSet result = null, qrt = null;
	result = stmt.executeQuery(str1);
	
	if(result.next()) {
		
		qrt = stmt.executeQuery(str2);
	
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
		out.print("Ticket Number");
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
		out.print("</td>");
		out.print("<td>");
		out.print("<b>");
		out.print("Stops");
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
		out.print("Purchase Date");
		out.print("</b>");
		out.print("</td>");	
		out.print("<td>");
		out.print("</td>");
		out.print("<td>");
		out.print("</td>");
		out.print("<td>");
		out.print("</td>");
		out.print("<td>");
		out.print("</td>");
		out.print("<td>");
		out.print("<b>");
		out.print("Purchase Time");
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
		out.print("Class");
		out.print("</b>");
		out.print("</td>");	
		out.print("<td>");		
		out.print("</td>");	
		out.print("<td>");		
		out.print("</td>");	
		out.print("<td>");
		out.print("<b>");
		out.print("Seat Number");
		out.print("</b>");
		out.print("</td>");
		out.print("<td>");
		out.print("</td>");
		out.print("<td>");
		out.print("</td>");
		out.print("<td>");
		out.print("<b>");
		out.print("Special Meal");
		out.print("</b>");
		out.print("</td>");	
		out.print("<td>");
		out.print("</td>");
		out.print("<td>");
		out.print("</td>");
		out.print("<td>");
		out.print("<b>");
		out.print("Booking Fee");
		out.print("</b>");
		out.print("</td>");
		out.print("<td>");
		out.print("</td>");
		out.print("<td>");
		out.print("</td>");
		out.print("<td>");
		out.print("<b>");
		out.print("Total Cost");
		out.print("</b>");
		out.print("</td>");	
		out.print("</tr>");
		
		//parse out the results
		while (qrt.next()) {
			//make a row
			out.print("<tr>");
			out.print("<td>");
			out.print(qrt.getString("flight_num"));					
			out.print("</td>");
			out.print("<td>");
			out.print("</td>");
			out.print("<td>");					
			out.print(qrt.getString("ticket_num"));					
			out.print("</td>");
			out.print("<td>");
			out.print("</td>");
			out.print("<td>");					
			out.print(qrt.getString("depart_time"));					
			out.print("</td>");
			out.print("<td>");
			out.print("</td>");
			out.print("<td>");					
			out.print(qrt.getString("stops"));
			out.print("</td>");
			out.print("<td>");
			out.print("</td>");
			out.print("<td>");
			out.print("</td>");
			out.print("<td>");
			out.print("</td>");
			out.print("<td>");					
			out.print(qrt.getString("purchase_date"));
			out.print("</td>");
			out.print("<td>");
			out.print("</td>");
			out.print("<td>");
			out.print("</td>");
			out.print("<td>");
			out.print("</td>");
			out.print("<td>");
			out.print("</td>");
			out.print("<td>");					
			out.print(qrt.getString("purchase_time"));
			out.print("</td>");
			out.print("<td>");		
			out.print("</td>");	
			out.print("<td>");		
			out.print("</td>");	
			out.print("<td>");		
			out.print("</td>");	
			out.print("<td>");					
			out.print(qrt.getString("class"));
			out.print("</td>");	
			out.print("<td>");		
			out.print("</td>");	
			out.print("<td>");		
			out.print("</td>");	
			out.print("<td>");					
			out.print(qrt.getString("seat_num"));
			out.print("</td>");	
			out.print("<td>");
			out.print("</td>");
			out.print("<td>");
			out.print("</td>");
			out.print("<td>");
			out.print(qrt.getString("special_meal"));
			out.print("</td>");	
			out.print("<td>");
			out.print("</td>");
			out.print("<td>");
			out.print("</td>");
			out.print("<td>");					
			out.print(qrt.getString("booking_fee"));
			out.print("</td>");
			out.print("<td>");
			out.print("</td>");out.print("<td>");
			out.print("</td>");
			out.print("<td>");					
			out.print(qrt.getString("total_cost"));
			out.print("</td>");	
			out.print("</tr>");
		}
		
		out.print("</table>");
		
	%>
	
	<br>
	<br>
	<b>
	Add reservation: 
	</b> 
	<br>
	<br>
	<form method="post" action="addReservation.jsp">
		<table>
			<tr>
				<td>Flight number </td>
				<td><input type="text" name="flight_num"></td>
			</tr>
			<tr>
				<td>Ticket number </td>
				<td><input type="text" name="ticket_num"></td>
			</tr>
			<tr>
				<td>Class </td>
				<td><input type="text" name="class"></td>
			</tr>
			<tr>
				<td>Seat Number </td>
				<td><input type="text" name="seat_num"></td>
			</tr>
			<tr>
				<td>Special Meal </td>
				<td><input type="text" name="special_meal"></td>
			</tr>
			<tr>
				<td>Booking Fee </td>
				<td><input type="text" name="booking_fee"></td>
			</tr>
			<tr>
				<td>Total cost </td>
				<td><input type="text" name="total_cost"></td>
			</tr>
		</table>
		<br>
		<input type="submit" value="Submit">
	</form>
	<br>
	<b>
	Delete reservation:
	</b> 
	<br>
	<br>
	<form method="post" action="deleteReservation.jsp">
		<table>
			<tr>
				<td>Ticket number: </td>
				<td><input type="text" name="ticket_num"></td>
		</table>
		<br>
		<input type="submit" value="Submit">
	</form>
	<br>
	<b>
	Edit reservation:
	</b>
	<br>
	<br>
	<form method="post" action="editReservation.jsp">
		<table>
			<tr>
				<td>Flight Number: </td>
				<td><input type="text" name="flight_num"></td>
			</tr>
		</table>
		<br>
		Select the field you wish to update for this reservation:
		<br>
		<br>
		<select name="field" size=1>
				<!-- <option value="flight_num">Flight Number</option> -->
				<!-- <option value="tickt_num">Ticket Number</option> -->
				<!-- <option value="depart_time">Departure Date/Time</option> -->
				<!--  <option value="stops">Stops</option> -->
				<!--  <option value="purchase_date">Purchase Date</option> -->
				<!--  <option value="purchase_time">Purchase Time</option> -->
				<option value="class">Class</option>
				<option value="seat_num">Seat Number</option>
				<option value="special meal">Special Meal</option>
				<option value="stops">Stops</option>
				<option value="booking_fee">Booking Fee</option>
				<option value="total_cost">Total Cost</option>
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
	
	
	} else {
		
		out.print("Invalid customer ID.");
	}
	
	//close the connection.
	db.closeConnection(con);
	
} catch (Exception e) {
	out.println("Error");
	out.print(e);
	
}

%>

</body>
</html>
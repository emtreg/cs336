<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Customer Reservation</title>
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
	
	//Make a SELECT query from the Tickets table where the user_id equals the customer id that was entered
	String str = "SELECT * FROM Tickets WHERE user_id = '" + customer_id + "' and flight_num = '" + flight_num + "'";
	
	//Run the query against the database.
	//if user does not match any from db then do ERROR
	ResultSet result = stmt.executeQuery(str);
	
	//Make an HTML table to show the results in:
	out.print("<br>");
	out.print("<br>");
	out.print("<table>");
	
	//make a row
	out.print("<tr>");
	//make a column
	out.print("<td>");
	//print out column header
	out.print("<b>");
	out.print("Ticket Number");
	out.print("</b>");
	out.print("</td>");
	//make a column
	out.print("<td>");
	out.print("<b>");
	out.print("Departure Date/Time");
	out.print("</b>");
	out.print("</td>");
	out.print("<td>");
	out.print("<b>");
	out.print("Purchase Date");
	out.print("</b>");
	out.print("</td>");
	out.print("<td>");
	out.print("<b>");
	out.print("Purchase Time");
	out.print("</b>");
	out.print("</td>");
	out.print("<td>");
	out.print("<b>");
	out.print("Class");
	out.print("</b>");
	out.print("</td>");
	out.print("<td>");
	out.print("</td>");
	out.print("<td>");
	out.print("<b>");
	out.print("Seat Number");
	out.print("</b>");
	out.print("</td>");
	out.print("<td>");
	out.print("<b>");
	out.print("Special Meal");
	out.print("</b>");
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
	out.print("<b>");
	out.print("Booking Fee (Dollars)");
	out.print("</b>");
	out.print("</td>");
	out.print("<td>");
	out.print("<b>");
	out.print("Total Cost (Dollars)");
	out.print("</b>");
	out.print("</td>");
	out.print("<td>");
	out.print("</td>");
	out.print("</tr>");
	
	//parse out the results
	while (result.next()) {
		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		//Print out current customer tickets
		out.print(result.getString("ticket_num"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("departure"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("purchase_date"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("purchase_time"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("class"));
		out.print("</td>");
		out.print("<td>");
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("seat_num"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("special_meal"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("stops"));
		out.print("</td>");
		out.print("<td>");
		out.print("</td>");
		out.print("<td>");
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("booking_fee"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("total_cost"));
		out.print("</td>");
		out.print("<td>");
		out.print("</td>");
		out.print("</tr>");
	}
	
	out.print("</table>");
	
	//close the connection.
	db.closeConnection(con);
	
} catch (Exception e) {
	out.print(e);
}

%>

</body>
</html>
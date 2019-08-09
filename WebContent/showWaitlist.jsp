<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Waiting List</title>
</head>
<body>
<%
try {

	//Get the database connection
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();

	//Create a SQL statement
	Statement stmt = con.createStatement();
	String flight_num = request.getParameter("flight_num");
	
	//Make a SELECT query from the Waitlist table where flight_num matches the flight_num that was entered
	String str1 = "SELECT * FROM Flights WHERE flight_num = '" + flight_num + "'";
	String str2 = "SELECT * FROM Waitlist WHERE flight_num = '" + flight_num + "'";
	
	//Run the query against the database.
	//if the flight number does not match any from db then do ERROR
	ResultSet result = null, qrs = null;
	result = stmt.executeQuery(str1);
	
	if(result.next()) {
		
		qrs = stmt.executeQuery(str2);
		
		//Make an HTML table to show the results in:
		out.print("<b>");
		out.print("Waiting list for flight " + flight_num + ": ");
		out.print("</b>");
		out.print("<br>");
		out.print("<br>");
		out.print("<table>");
		
		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		//print out column header
		out.print("<b>");
		out.print("Customer ID");
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
		out.print("Position");
		out.print("</b>");
		out.print("</td>");
		out.print("</tr>");
		
		//parse out the results
		while (qrs.next()) {
			//make a row
			out.print("<tr>");
			out.print("<td>");
			//Print out current waiting list
			out.print(qrs.getString("user_id"));
			out.print("</td>");
			out.print("<td>");
			out.print("</td>");
			out.print("<td>");
			out.print("</td>");
			out.print("<td>");
			out.print("</td>");
			out.print("<td>");
			out.print(qrs.getString("position"));
			out.print("</td>");
			out.print("</tr>");
		}

		out.print("</table>");
		
	} else {
		
		out.print("Invalid flight number.");
	}
	
	//close the connection.
	db.closeConnection(con);
	
} catch (Exception e) {
	out.print("Unable to retrieve waitlist");
	out.print(e);
}

%>

</body>
</html>
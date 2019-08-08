<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Flight information</title>
</head>
<body>
Type in the name of an airport to get a list of all its provided flights.
	<form method="post" action="flightsByAirport.jsp">
	<input type="text" name="airport">
	<input type="submit" value="Submit">
	</form>
	<br>
	<br>
<%
try{
ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			String str="select flight_num, count(*) m from Flights join Tickets using(flight_num) group by flight_num order by m desc;";
			ResultSet result = stmt.executeQuery(str);
			out.println("Currently,these are most active flights (in descending order): ");
			out.print("<table border=\"1\">");
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("Flight no.");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Number of Tickets");
			out.print("</td>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar name:
				out.print(result.getString("flight_num"));
				out.print("</td>");
				out.print("<td>");
				//Print out current beer name:
				out.print(result.getString("m"));
				out.print("</td>");
			}
			con.close();
}catch (Exception e){
out.print(e);
}
%>
<br>
<br>
	<form method="post" action="AdminPage.jsp">
	<input type="submit" value="Return to Homepage">
	</form>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the combobox from the index.jsp
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str = "select t.user_id id, max(t.total) total from (select user_id, sum(total_cost) total from Tickets group by user_id) t;";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			//parse out the results
			while(result.next()) {
			out.println("The customer who generated the most revenue was "+result.getString("id")+" with a total of $"+result.getString("total")+".");
			}
			con.close();
	}catch(Exception e){
		out.print(e);
	}

			//close the connection.
		%>
		<br>
		<br>
		Get a summary of generated revenue by filling out one of the boxes below:
	<br>
	<form method="post" action="flightNumRevenue.jsp">
	<table>
	<tr>    
	<td>Flight No.:</td><td><input type="text" name="flight_num"></td>
	</table>
	<input type="submit" value="Enter">
	</form>
	<br>
	<br>
		<form method="post" action="airlineRevenue.jsp">
	<table>
	<tr>    
	<td>Airline ID:</td><td><input type="text" name="airline_id"></td>
	</table>
	<input type="submit" value="Enter">
	</form>
	<br>
	<br>
			<form method="post" action="customerRevenue.jsp">
	<table>
	<tr>    
	<td>Customer ID:</td><td><input type="text" name="customer_id"></td>
	</table>
	<input type="submit" value="Enter">
	</form>
	<br>
	<br>
		<br>
	<form method="post" action="AdminPage.jsp">
	<input type="submit" value="Return to Homepage">
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
</head>
<body>
	<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		
		String employee_id = request.getParameter("employee_id");
		String pwd = request.getParameter("password");
		
		//Make a SELECT query from the customer_rep table where employee_id matches the entered ID and password matches the entered password
		String str = "SELECT * FROM customer_rep WHERE employee_id = '" + employee_id +"' and password= '"+ pwd +"'";

		//Run the query against the database.
		//if user does not match any from db then do ERROR
		ResultSet result = stmt.executeQuery(str);
		
		if (result.next()) {
	        session.setAttribute("user", employee_id); // the username will be stored in the session
	        out.println("Welcome Employee " + employee_id);
	%>
<br>
<br>
Make flight reservation on behalf of customer:
<br>
<br>
<form method="post" action="reserveFlight.jsp">
		<table>
			<tr>
				<td>Customer ID: </td>
				<td><input type="text" name="customer_id"></td>
			</tr>
		</table>
		<br>
		<input type="submit" value="Submit">
	</form>
<br>
Access and edit customer reservations:
<br>
<br>
<form method="post" action="showReservations.jsp">
		<table>
			<tr>
				<td>Customer ID: </td>
				<td><input type="text" name="customer_id"></td>
			</tr>
		</table>
		<br>
		<input type="submit" value="Submit">
	</form>
<br>
Access and edit airport, aircraft or flight information:
<br>
<br>
Select appropriate option:
<br>
<br>
<form method="post" action="displayTable.jsp">
  <input type="radio" name="command" value="Airport"/>Airports
  <br>
  <input type="radio" name="command" value="Aircraft"/>Aircrafts
  <br>
   <input type="radio" name="command" value="Flights"/>Flights
  <br>
  <br>
  <input type="submit" value="Submit" />
  </form>
<br>
Display waiting list for flight:
<br>
<br>
<form method="post" action="showWaitlist.jsp">
		<table>
			<tr>
				<td>Flight Number: </td>
				<td><input type="text" name="flight_num"></td>
			</tr>
		</table>
		<br>
		<input type="submit" value="Submit">
	</form>
<br>
<form method="post" action="logout.jsp">
		<input type="submit" value="Logout">
</form>
	
	<%
		} else {
	        out.println("Invalid login <a href='employeeHome.jsp'>try again</a>");
	    }
	
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		result.close();
		stmt.close();
		con.close();
		
	} catch (Exception ex) {
		out.print("Login Failed");
	}
%>
</body>
</html>
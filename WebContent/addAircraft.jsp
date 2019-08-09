<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
	

		//Get parameters from the HTML form at the HelloWorld.jsp
		String aircraft_id = request.getParameter("aircraft_id");
		String airline_id = request.getParameter("airline_id");
		String name = request.getParameter("name");
		String num_seats = request.getParameter("num_seats");
		//String economy_seats = request.getParameter("economy_seats");
		//String first_seats = request.getParameter("first_seats");


		//Make an insert statement for the Sells table:
		String insert = "INSERT INTO Aircraft(aircraft_id, airline_id, name, available_seat)"
			+ "VALUES (?, ?, ?, ?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, aircraft_id);
		ps.setString(2, airline_id);
		ps.setString(3, name);
		ps.setString(4, num_seats);
		//ps.setString(5, economy_seats);
		//ps.setString(6, first_seats);
		//Run the query against the DB
		ps.executeUpdate();

		//Get parameters from the HTML form at the HelloWorld.jsp
		//String username = request.getParameter("user_id");
		//String password = request.getParameter("password");

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		out.print("Aircraft Added");
		
	} catch (Exception ex) {
		//out.print(ex);
		
%>

Error:
<br>
<br>
* Aircraft ID may already exist
<br>
* Airline ID may be invalid
<br>
* Fields were left blank

<%	
	}
%>
		
</body>
</html>
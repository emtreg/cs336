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
		String flight_num = request.getParameter("flight_num");
		String arrival_airport = request.getParameter("arrival_airport_id");
		String depart_airport = request.getParameter("depart_airport_id");
		String arrival_time = request.getParameter("arrival_time");
		String depart_time = request.getParameter("depart_time");
		String flight_type = request.getParameter("flight_type");
		String aircraft_id = request.getParameter("aircraft_id");
		String airline_id = request.getParameter("airline_id");
		String stops = request.getParameter("stops");
		String price = request.getParameter("price");


		//Make an insert statement for the Sells table:
		String insert = "INSERT INTO Flights(flight_num, arrival_airport_id, depart_airport_id, arrival_time, depart_time, flight_type, aircraft_id, airline_id, stops, Price)"
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, flight_num);
		ps.setString(2, arrival_airport);
		ps.setString(3, depart_airport);
		ps.setString(4, arrival_time);
		ps.setString(5, depart_time);
		ps.setString(6, flight_type);
		ps.setString(7, aircraft_id);
		ps.setString(8, airline_id);
		ps.setString(9, stops);
		ps.setString(10, price);
		//Run the query against the DB
		ps.executeUpdate();

		//Get parameters from the HTML form at the HelloWorld.jsp
		//String username = request.getParameter("user_id");
		//String password = request.getParameter("password");

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		out.print("Flight Added");
		
	} catch (Exception ex) {
		//out.print(ex);
		out.print("Error: Unable to add flight. Please make sure all fields are filled in correctly.");
	}
%>
</body>
</html>
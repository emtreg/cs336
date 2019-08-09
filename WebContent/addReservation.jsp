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
		String ticket_num = request.getParameter("ticket_num");
		String class_type = request.getParameter("class");
		String seat_num = request.getParameter("seat_num");
		String special_meal = request.getParameter("special_meal");
		String booking_fee = request.getParameter("booking_fee");
		String total_cost = request.getParameter("total_cost");
		String customer_id = (String)session.getAttribute("customer");
		
		
		//Make an insert statement for the Sells table:
			
		String getFlightInfo = "SELECT * FROM Flights WHERE flight_num = '" + flight_num + "'";
		String getDate = "SELECT CURDATE()";
		String getTime = "SELECT CURTIME()";
		
		ResultSet result = null, result2 = null, result3 = null;
		
		result = stmt.executeQuery(getFlightInfo);
		
		String depart_time = "";
		String stops = "";
		
		if(result.next()) {
			
			 depart_time = result.getString("depart_time");
			 stops = result.getString("stops");
		}
		
		result2 = stmt.executeQuery(getDate);
		String purchase_date = "";
		
		if(result2.next()) {
			
			purchase_date = result2.getString("CURDATE()");
		}
		
		result3 = stmt.executeQuery(getTime);
		String purchase_time = "";
		
		if(result3.next()) {
			
			purchase_time = result3.getString("CURTIME()");
		}
		
		
		String insertRes = "INSERT INTO Reservations(user_id, flight_num)"
				+ "VALUES (?, ?)";
		String insertTicket = "INSERT INTO Tickets(ticket_num, user_id, flight_num, booking_fee, class, seat_num, special_meal, total_cost, depart_time, purchase_date, purchase_time, stops)"
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps1 = con.prepareStatement(insertRes);
		PreparedStatement ps2 = con.prepareStatement(insertTicket);
		
		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps2.setString(1, ticket_num);
		ps2.setString(2, customer_id);
		ps2.setString(3, flight_num);
		ps2.setString(4, booking_fee);
		ps2.setString(5, class_type);
		ps2.setString(6, seat_num);
		ps2.setString(7, special_meal);
		ps2.setString(8, total_cost);
		ps2.setString(9, depart_time);
		ps2.setString(10, purchase_date);
		ps2.setString(11, purchase_time);
		ps2.setString(12, stops);
		
		ps1.setString(1, customer_id);
		ps1.setString(2, flight_num);
		
		//out.print(ps2.executeUpdate());
		
		//Run the query against the DB
		
		if(ps2.executeUpdate() == 1) {
			
			ps1.executeUpdate();
		}

		//Get parameters from the HTML form at the HelloWorld.jsp
		//String username = request.getParameter("user_id");
		//String password = request.getParameter("password");

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		out.print("Reservation Added");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Error: Unable to add reservation. Please make sure all fields are filled in correctly.");
	}
%>
</body>
</html>
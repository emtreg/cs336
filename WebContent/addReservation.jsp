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
		//String ticket_num = request.getParameter("ticket_num");
		String class_type = request.getParameter("class");
		String seat_num = request.getParameter("seat_num");
		String special_meal = request.getParameter("special_meal");
		float booking_fee = 30;
		//String cost = request.getParameter("total_cost");
		String customer_id = (String)session.getAttribute("customer");
		
		String getFlightInfo = "SELECT * FROM Flights WHERE flight_num = '" + flight_num + "'";
		String getNumTickets = "SELECT count(*) as numTickets from Tickets WHERE flight_num = '" + flight_num + "'";
		String getLastPosition = "SELECT MAX(position) as maxPosition FROM Waitlist WHERE flight_num = '" + flight_num + "'";
		String getSeats = "SELECT * FROM Aircraft A JOIN Flights F using(aircraft_id) WHERE F.flight_num = '" + flight_num + "'";
		String checkSeatNum = "SELECT * FROM Tickets WHERE flight_num = '" + flight_num + "' and seat_num = '" + seat_num + "'";
		String getTicketNums = "SELECT * FROM Tickets";
		String getDate = "SELECT CURDATE()";
		String getTime = "SELECT CURTIME()";
		
		int ticket_num = 10000 + new Random().nextInt(90000);
		
		ResultSet result = null, result2 = null, result3 = null, result4 = null, result5 = null, result6 = null, result7 = null, result8 = null;
		
		result7 = stmt.executeQuery(getTicketNums);
		
		while(result7.next()) {
			
			if(ticket_num == Integer.parseInt(result7.getString("ticket_num"))) {
				
				ticket_num = 10000 + new Random().nextInt(90000);
				
			}
		}

		result6 = stmt.executeQuery(getLastPosition);
		
		int position = 0;

		if(result6.next()) {
			
			position = result6.getInt("maxPosition");
		}
		
		result8 = stmt.executeQuery(getNumTickets);
		
		int numTickets = 0;
		
		if(result8.next()) {
			
			numTickets = result8.getInt("numTickets");
			
		}
			
		result4 = stmt.executeQuery(getSeats);
		
		int totalSeats = 0;
		
		if(result4.next()) {
			
			totalSeats = Integer.parseInt(result4.getString("available_seat")); 
			
		}
			
		if((totalSeats - numTickets) == 0) {
				
			String addToWaitlist = "INSERT INTO Waitlist(flight_num, user_id, position)" + "VALUES (?, ?, ?)";
			
			PreparedStatement ps3 = con.prepareStatement(addToWaitlist);
			
			ps3.setString(1, flight_num);
			ps3.setString(2, customer_id);
			ps3.setInt(3, position + 1);
			
			ps3.executeUpdate();
			
			out.print("This flight is full. The customer has been added to the waiting list.");
			
		} else {
			
				result5 = stmt.executeQuery(checkSeatNum);
				
				if(result5.next()) {
					
					out.print("Seat number is unavailable");
					
				} 

					result = stmt.executeQuery(getFlightInfo);
					
					String depart_time = "";
					String stops = "";
					String price = "";
					
					float cost = 0;
					float total_cost = 0;
					
					if(result.next()) {
						
						 depart_time = result.getString("depart_time");
						 stops = result.getString("stops");
						 price = result.getString("Price");
						 
						cost = Integer.parseInt(price);	
						total_cost = booking_fee + cost;
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
					ps2.setString(1, String.valueOf(ticket_num));
					ps2.setString(2, customer_id);
					ps2.setString(3, flight_num);
					ps2.setFloat(4, booking_fee);
					ps2.setString(5, class_type);
					ps2.setString(6, seat_num);
					ps2.setString(7, special_meal);
					ps2.setFloat(8, total_cost);
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
	
					out.print("Reservation Added");
										
		}
			
			con.close();
	
	} catch (Exception ex) {
		out.print(ex);
		out.print("Error: Unable to add reservation. Please make sure all fields are filled in correctly.");
	}
%>
</body>
</html>
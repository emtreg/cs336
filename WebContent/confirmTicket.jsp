<!-- Code Done by Erika Cruz -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Confirm Ticket</title>
</head>
<body>
	<%
	try{
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();		
		Statement stmt = con.createStatement(); 
		
		//User_id and Flight_num Getter
		String userflight = request.getParameter("submit");
		int comma = userflight.indexOf(','); 
		String user = userflight.substring(0,comma);
		String flight= userflight.substring(comma+1);
		
		String meal= request.getParameter("meal");
		String classType= request.getParameter("class");
		String seat= request.getParameter("trip");
		
		Random r = new Random();
	    String ticket_num = String.format("%04d", r.nextInt(1001));
	    System.out.println(ticket_num);
		int booking= 30;
		
		String query= "SELECT * FROM Flights f WHERE flight_num='"+flight+"';";
		ResultSet rquery= stmt.executeQuery(query);
		rquery.next();
		String dtime= rquery.getString("depart_time");
		int tcost=  rquery.getInt("price")+30;
		int stops= rquery.getInt("depart_time");
		
		String insertTicket = "INSERT INTO Tickets(ticket_num, user_id, flight_num, booking_fee, class, seat_num, special_meal, total_cost, depart_time, purchase_date, purchase_time, stops)"
							+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(insertTicket);

		ps.setString(1, ticket_num);
		ps.setString(2, user);
		ps.setString(3, flight);
		ps.setFloat(4,booking);
		ps.setString(5,classType);
		ps.setString(6,seat);
		ps.setString(7,meal);
		ps.setInt(8,tcost);
		ps.setString(9,dtime );
		ps.setString(10, "DATE(NOW())");
		ps.setString(11, "CURRENT_TIMESTAMP()");
		ps.setInt(12, stops);
		ps.executeUpdate();

		String insertRes = "INSERT INTO Reservations(user_id, flight_num)"
				+ "VALUES (?, ?)";
		ps = con.prepareStatement(insertRes);
		ps.setString(1,user);
		ps.setString(2,flight);
		ps.executeUpdate();
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		
		out.print("Ticket Purchase Successful. Thank you for your purchase");	
		%>
		<form method="post" action="upcomingReservations.jsp">
			<button type="submit" name="command" value="<%=user%>">View Your Upcoming Flights</button> 
		</form>
		<%
		con.close();
	}catch(Exception e){
		out.print(e);
	}%>
</body>
</html>
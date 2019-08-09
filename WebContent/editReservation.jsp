<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Flight</title>
</head>
<body>
	<%
		List<String> list = new ArrayList<String>();

		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
		
			String flight_num = request.getParameter("flight_num");
			String field = request.getParameter("field");
			String new_value = request.getParameter("new_value");
			String customer_id = (String)session.getAttribute("customer");
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String getClass = "SELECT * FROM Tickets WHERE flight_num = '" + flight_num + "' and user_id = '" + customer_id + "'";
			String getSeats = "SELECT * FROM Tickets WHERE flight_num = '" + flight_num + "'";
			String update = "UPDATE Tickets SET " + field + " = '" + new_value + "' WHERE flight_num = '" + flight_num + "' and user_id = '" + customer_id + "'";

			ResultSet result2 = stmt.executeQuery(getSeats);
			
			int seatTaken = 0;
			
			while(result2.next()) {
				
				if(new_value.equals(result2.getString("seat_num"))) {
					
					seatTaken = 1;
				}
			}
			
			if(field.equals("seat_num") && seatTaken == 1) {
				
				out.print("Seat Number is unavailable.");
				
			} else {
			
				ResultSet result = stmt.executeQuery(getClass);
				
				if(result.next()) {
					
					String classType = result.getString("class");
					
					if(classType.equals("Economy") || classType.equals("economy")) {
						
						out.print("Unable to update reservation. Only business and first class reservations may be changed.");		
		
					} else {
						
						PreparedStatement ps = con.prepareStatement(update);
	
						ps.executeUpdate();
	
						out.print("Reservation Updated");	
					} 
				}	
			}
			
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			
			con.close();
			
		} catch (Exception e) {
			out.print(e);
			out.print("Error");
		}
	%>

</body>
</html>
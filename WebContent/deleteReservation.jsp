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
		String ticket_num = request.getParameter("ticket_num");
		String customer_id = (String)session.getAttribute("customer");
		
		String str = "SELECT * FROM Tickets WHERE ticket_num = '" + ticket_num + "' and user_id = '" + customer_id + "' GROUP BY class HAVING class = 'business' OR class = 'first'";
		
		//String str = "SELECT * FROM Reservations R JOIN Tickets T using(flight_num) WHERE R.flight_num = '" + flight_num + "' and R.user_id = '" + customer_id + "' and T.class = 'business' or T.class = 'first'";
		
		//Run the query against the database.
		//if user does not match any from db then do ERROR
		ResultSet result = stmt.executeQuery(str);
		
		String flight_num = "";
		
		if(result.next()) {
			
			flight_num = result.getString("flight_num");
		
			//Make a delete statement for the Sells table:
			String deleteRes = "DELETE FROM Reservations WHERE flight_num = '" + flight_num +  "'and user_id = '" + customer_id + "'";
			String deleteTicket = "DELETE FROM Tickets WHERE ticket_num = '" + ticket_num +  "'and user_id = '" + customer_id + "'";
			
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps1 = con.prepareStatement(deleteRes);
			PreparedStatement ps2 = con.prepareStatement(deleteTicket);
	
			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			/* ps.setString(1, id);
			ps.setString(2, name);
			ps.setString(3, city);
			ps.setString(4, country); */
			//Run the query against the DB
			ps1.executeUpdate();
			ps2.executeUpdate();
	
			//Get parameters from the HTML form at the HelloWorld.jsp
			//String username = request.getParameter("user_id");
			//String password = request.getParameter("password");
	
			out.print("Reservation Deleted");
		
		} else {
			
			%>
			Error:
			<br>
			<br>
			* Ticket number may be invalid
			<br>
			* Only business and first class reservations may be cancelled	
			<% 
			
			//out.print("Invalid flight number.");
		}
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		
	} catch (Exception ex) {
		out.print(ex);
		out.print("Error");
	}
%>
</body>
</html>
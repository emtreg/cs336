<!-- Code Done by Erika Cruz -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reserving Flight</title>
</head>
<body>
	<h1>Reserve Flight</h1>
	
	<%
	try{
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();		
		Statement stmt = con.createStatement(); 
		
		String userflight = request.getParameter("ticket");
		int comma = userflight.indexOf(','); 
		String user = userflight.substring(0,comma);
		String flight= userflight.substring(comma+1);
		
		//Check if there is space on the flight
		String sq1= "SELECT available_seat from Aircraft a";
		String jwq1= " JOIN Flights f using(aircraft_id) WHERE f.flight_num='"+flight+"';";
		ResultSet doesSpace= stmt.executeQuery(sq1+jwq1);
		doesSpace.next();
		int available= doesSpace.getInt("available_seat");
		
		//Check if there is space on the flight
		String sq2= "SELECT (COUNT(*)) c from Tickets";
		String wq2= " Where flight_num='"+flight+"'";

		ResultSet q2= stmt.executeQuery(sq2+wq2);
		q2.next();
		int numTix = q2.getInt("c");
		
		if(available!=numTix){
			//String insert= "INSERT INTO Tickets(flight)"
			%>
			<center>	
				<!--Input Ticket Info-->
				<form method="post" action="confirmTicket.jsp">
				<b>Special Meal Order (Choose One):</b><br>
					<input type="radio" name="meal" value="bread"/>Bread
					<input type="radio" name="meal" value="steak"/>Steak
					<input type="radio" name="meal" value="chicken"/>Chicken
					<input type="radio" name="meal" value="salad"/>Salad
				<br>
				
				<br><b>Class:</b><br>
					<input type="radio" name="class" value="economy"/>Economy
					<input type="radio" name="class" value="business"/>Business
					<input type="radio" name="class" value="first"/>First
				<br>
					
				<br><b>Seat (1-12)(A-F) (ex:7A): </b><br>
					<input type="text" name="seat"/>
				<br>
				<br><button type="submit" name="submit" value="<%=user%>">Buy Ticket</button>
				</form>
			</center>
			<%
		}
		else{
			out.print("This Flight is full. Would you like to be added onto the waiting list?");
			%>
			
			<%
		}
		
		//close the connection.
		con.close();
		db.closeConnection(con);
	}catch(Exception e){
		out.print(e);
	}%>
</body>
</html>
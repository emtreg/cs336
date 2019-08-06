<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Page</title>
</head>
<body>
	<%   
	try {
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		
		String name = request.getParameter("user_id");
		String pwd = request.getParameter("password");
		//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
		String str = "SELECT * FROM user WHERE user_id = '" + name +"' and password= '"+ pwd +"'";
		//String stradm = "SELECT * FROM user WHERE user_id = '" + name +"' and password= '"+ pwd +"' and type='admin'";
		//Run the query against the database.
		//if user does not match any from db then do ERROR
		ResultSet result=stmt.executeQuery(str);
		
		if (result.next()) {
	        session.setAttribute("user", name); // the username will be stored in the session        
	        %>
	        <h1> Welcome <%=name%>!</h1>
	        
			<center><% //view all past and upcoming reservations with their details%>
				<h2>Flight Reservations </h2>
				<form method="post" action="pastReservations.jsp">
					<button type="submit" name="command" value="<%=name%>">View Past Reservations</button> 
				</form>
				<form method="post" action="upcomingReservations.jsp">
					<button type="submit" name="command" value="<%=name%>">View Upcoming Reservations</button> 
				</form>
			</center>
		
			<center><% //Search for flights (oneway, round-trip, flexible date/time)%>
				<h2> Search for Flights </h2>
				<form method="post" action="browseFlights.jsp">
					<td>Departure Airport: <select>
						<% 
						try{
							String q1="SELECT name, airport_id FROM Airport";
							ResultSet portList= stmt.executeQuery(q1);
							
							//out.print("<select name=)");
							while(portList.next()){  
								%>
									<option name="depart" value="<%=portList.getString("airport_id")%>">
										<%=portList.getString("name")%> (<%=portList.getString("airport_id")%>)
									</option>						
								<%				
							}
							portList.close();
						} 
						catch(Exception e){
							out.print(e.getMessage());
						}
						%>
					</select></td>	
					-- Going To -->
					<td>Arrival Airport: <select>
						<%
						try{
							String q2="SELECT name, airport_id FROM Airport";
							ResultSet portList2= stmt.executeQuery(q2);
							
							while(portList2.next()){
								%>
								<option name="arrival" value= "<%=portList2.getString("airport_id")%>">
								<%=portList2.getString("name")%> (<%=portList2.getString("airport_id")%>)
								</option>
								<%				
							}
							portList2.close();
						}
						catch(Exception e){
							out.print(e.getMessage());
						}
						%>		
					</select></td>
					<td>
						<br><input type="radio" name="command" value="oneWay"/>One-Way
			 			<br><input type="radio" name="command" value="roundTrip"/>Round-Trip
			  			<br>
					</td>
					<td>
						<br>Flights within <input type=text name="flexibility"> days of <input type=text name="date">
					</td>
					<br><input type="submit" value="Search">
				</form>	
			</center>			
		
			<form method="post" action="logout.jsp">
				<br><br><input type="submit" value="Logout">
			</form>
	    <%
	    } else {
	        out.println("Invalid login");
	    }
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.'
		result.close();
		stmt.close();
		con.close();
		
	} catch (Exception ex) {
		out.print("ERROR: Username does not exist");
	}
	%>
</body>
</html>
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
	<div class= "header">
		<h1>Customer Home</h1>
	</div>
	<%   
	try {
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();

		String name = request.getParameter("user_id");
		String pwd = request.getParameter("password");
		String str = "SELECT * FROM user WHERE user_id = '" + name +"' and password= '"+ pwd +"'";
		
		ResultSet result=stmt.executeQuery(str);
	
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		result.close();
		stmt.close();
		con.close();
		
	} catch (Exception ex) {
		out.print("ERROR: Username does not exist");
	}
	%>
	<center>
		<% //Search for flights (oneway, round-trip, flexible date/time)%>
		<h2> Search for Flights </h2>
		<form method="post" action="browseFlights.jsp">
			<td>Departure Airport: <select>
				<%
				try{
					ApplicationDB db = new ApplicationDB();	
					Connection con = db.getConnection();
					Statement stmt = con.createStatement();
					
					String str="SELECT name FROM Airport";
					ResultSet result= stmt.executeQuery(str);
					
					while(result.next()){  
						%>
						<option value= "<%=result.getString("name")%>">
							<%=result.getString("name")%>
						</option>
						<%				
					}
					//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
					result.close();
					stmt.close();
					con.close();
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
					ApplicationDB db = new ApplicationDB();	
					Connection con = db.getConnection();
					Statement stmt = con.createStatement();
					
					String str="SELECT name FROM Airport";
					ResultSet result= stmt.executeQuery(str);
					
					while(result.next()){
						%>
						<option value= "<%=result.getString("name")%>">
						<%=result.getString("name")%>
						</option>
						<%				
					}
					//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
					result.close();
					stmt.close();
					con.close();
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
				
	<center><br><br>
		<h2> Flight Reservations </h2>
		<% //view all past resverations with their details
		   //view all the upcoming reservations with their details%>
		<form method="post" action="pastReservations.jsp">
			<input type="submit" name="viewChoice" value="View Past Reservations"/>
		</form>
		<form method="post" action="upcomingReservations.jsp">
			<input type="submit" name="viewChoice" value="View Upcoming Reservations"/>
		</form>	
	</center>
	
	<form method="post" action="logout.jsp">
		<br><br><input type="submit" value="Logout">
	</form>
</body>
</html>
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
	
	<center>
		<% //Search for flights (oneway, round-trip, flexible date/time)%>
		<h3> Search for Flights </h3>
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
		<h3> Flight Reservations </h3>
		<% //view all past resverations with their details
		   //view all the upcoming reservations with their details%>
		<form method="post" action="customerReservations.jsp">
			<input type="submit" value="View Past Reservations"/>
			<input type="submit" value="View Upcoming Reservations"/>
		</form>
	</center>
	
	<form method="post" action="logout.jsp">
		<br><br><input type="submit" value="Logout">
	</form>
</body>
</html>
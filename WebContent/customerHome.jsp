<!-- Customer Code Done by Erika Cruz, Admin Redirect done by Serrina Li -->
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
		
		String id = request.getParameter("user_id");
		String pwd = request.getParameter("password");
		//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
		String str = "SELECT * FROM user WHERE user_id = '" + id +"' and password= '"+ pwd +"'";
		//String stradm = "SELECT * FROM user WHERE user_id = '" + name +"' and password= '"+ pwd +"' and type='admin'";
		//Run the query against the database.
		//if user does not match any from db then do ERROR
		ResultSet result=stmt.executeQuery(str);
		
		if (result.next()&&result.getString("type").equals("customer")) {
	        session.setAttribute("user", id); // the username will be stored in the session        
	        %>
	        <h1> Welcome <%=id%>!</h1>
	        
			<center><% //view all past and upcoming reservations with their details%>
				<h2>Flight Reservations </h2>
				<form method="post" action="pastReservations.jsp">
					<button type="submit" name="command" value="<%=id%>">View Past Reservations</button> 
				</form>
				<form method="post" action="upcomingReservations.jsp">
					<button type="submit" name="command" value="<%=id%>">View Upcoming Reservations</button> 
				</form>
			</center>
		
			<br>
			<br>
			
			<center><% //Search for flights (oneway, round-trip, flexible date/time)%>
				<h2> Search for Flights </h2>
				
				<form method="post" action="browseFlights.jsp">
					<td>Departure Airport: <select name="depart">
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
					
					<td>Arrival Airport: <select name="arrival">
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
						<br><input type="radio" name="trip" value="OneWay"/>One-Way
			 			<br><input type="radio" name="trip" value="RoundTrip"/>Round-Trip
			  			<br><br>
					</td>
					<td>
						<td>Date you wish to fly: </td><td><input type="text" name="date"></td> (YYYY-MM-DD)
						<br>Find flights within +-3 Days?
						<br><input type="radio" name="flex" value="' and t.diff<=3"/>Yes
			 			<br><input type="radio" name="flex" value="' and t.diff<=0"/>No
			  			<br>

					</td>
					<!--sort flights by diff criteria (price, take-off time, landing time)-->
					<h3>(Optional) Sort by:</h3>
						<select name="sort" size=1>
							<option value=null></option>
							<option value="pricehighlow">Price: Highest to Lowest</option>
							<option value="pricelowhigh">Price: Lowest to Highest</option>
							<option value="DTsoonerlater">Departure Time: Sooner to Later</option>
							<option value="DTlatersooner">Departure Time: Later to Sooner</option>
							<option value="ATsoonerlater">Arrival Time: Sooner to Later</option>
							<option value="ATlatersooner">Arrival Time: Later to Sooner</option>
						</select>
			
				<h3>(Optional) Filter:</h3>
					Price:
					<select name="price" size=1>
						<option value=null > </option>
						<option value="300">Under $300</option>
						<option value="500">Under $500</option>
						<option value="1000">Under $1000</option>
					</select>
				
					<br>Number of Stops:
						<select name="stops" size=1>
						<option value=null > </option>
						<option value="0">0</option>
						<option value="1">1</option>
						<option value="2+">2+</option>
					</select>
				
					<br>Just this Airline:
						<select name="airline">
							<%
							try{
								String q2="SELECT name, airline_id FROM Airline";
								ResultSet portList2= stmt.executeQuery(q2);
								
								%>
								<option name="airline" value=null></option>
								<%	
								while(portList2.next()){
									%>
									<option name="airline" value= "<%=portList2.getString("airline_id")%>">
									<%=portList2.getString("name")%> (<%=portList2.getString("airline_id")%>)
									</option>
									<%				
								}
								portList2.close();
							}
							catch(Exception e){
								out.print(e.getMessage());
							}
							%>		
						</select>
					<br><button type="submit" name="submit" value="<%=id%>">Submit</button>
				</form>	
			</center>			
		
			<form method="post" action="logout.jsp">
				<br><br><input type="submit" value="Logout">
			</form>
	    <%
	    }else if(result.getString("type").equals("admin")){
			%>
			<h1>Welcome, Admin!</h1>
			<br>
			<br>
			<form method="post" action="AdminPage.jsp">
				<input type="submit" value="Head to Admin Homepage">
			</form>
			<%
		}
		else {
	        out.println("Invalid login");
	    }
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.'
		result.close();
		stmt.close();
		con.close();
		
	} catch (Exception ex) {
		out.print("ERROR: Username or Password is not correct");
	}
	%>
</body>
</html>
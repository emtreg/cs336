<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
     pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%out.print(request.getParameter("airport"));%> Flights</title>
</head>
<body>
<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the combobox from the index.jsp
			String air = request.getParameter("airport");
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str = "select * from Airport a join Flights f on(a.airport_id=f.depart_airport_id) where a.airport_id='"+air+"';";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			if(!result.next()){
				out.print("This airport has no flights :c");
			}else{
			out.print("<table border=\"1\">");
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			out.print("Flight No.");
			out.print("</td>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar name:
				out.print(result.getString("flight_num"));
				out.print("</td>");

			}}
			con.close();
	}catch(Exception e){
		
	}
%>
	<br>
	<form method="post" action="AdminPage.jsp">
	<input type="submit" value="Return to Homepage">
	</form>
</body>
</html>
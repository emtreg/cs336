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
			//Get the combobox from the index.jsp
			String flight_num = request.getParameter("flight_number");
			String field = request.getParameter("field");
			String new_value = request.getParameter("new_value");
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String update = "UPDATE Flights SET " + field + " = '" + new_value + "' WHERE flight_num = '" + flight_num + "'";

			PreparedStatement ps = con.prepareStatement(update);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			
			//Run the query against the DB
			
			if(ps.executeUpdate() == 1) {
				
				out.print("Flight Updated");
				
			} else {
				
				out.print("Invalid flight number.");
			}

			//Get parameters from the HTML form at the HelloWorld.jsp
			//String username = request.getParameter("user_id");
			//String password = request.getParameter("password");

			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();

			
			//Run the query against the database.

		} catch (Exception e) {
			//out.print(e);
			
%>
	
Error: Unable to update field.
<br>
<br>
* If updating flight number, make sure that it is not a duplicate
<br>
* If updating airline ID, ensure that it is a valid ID
<br>
* If updating departure or arrival date/time, ensure that you are using the correct format (YYYY-MM-DD HH:MM:SS)
<br>
* If updating aircraft ID, ensure that is is a valid ID
<br>
* If updating airline ID or aircraft ID, make sure that the airline is associated with the correct aircraft and vice versa
 	
<% 
		}
%>

</body>
</html>
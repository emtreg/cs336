<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Aircraft</title>
</head>
<body>
	<%
		List<String> list = new ArrayList<String>();
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();	
		
		//Create a SQL statement
		Statement stmt = con.createStatement();
		//Get the combobox from the index.jsp
		String aircraft_id = request.getParameter("aircraft_id");
		String field = request.getParameter("field");
		String new_value = request.getParameter("new_value");

		try {

			//Get the database connection
			
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str = "SELECT * from Aircraft WHERE aircraft_id = '" + aircraft_id + "'";
			String update = "UPDATE Aircraft SET " + field + " = '" + new_value + "' WHERE aircraft_id = '" + aircraft_id + "'";
			
			ResultSet result = stmt.executeQuery(str);
			
			if(result.next()) {

				PreparedStatement ps = con.prepareStatement(update);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			
			//Run the query against the DB
				if(ps.executeUpdate() == 1) {

			//Get parameters from the HTML form at the HelloWorld.jsp
			//String username = request.getParameter("user_id");
			//String password = request.getParameter("password");

			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.

					out.print("Aircraft Updated");
			//Run the query against the database.
			
				} 
			
			} else {
				
				out.print("Invalid aircraft ID.");
				
			}
			
			con.close();

		} catch (Exception e) {
			//out.print(e);
			//out.print("Error");
				
			if(field.equals("airline_id")) {
				
				out.print("Invalid airline ID.");	
				
			} else {
				
				out.print("Error: Unable to update aircraft information.");
			}
			
		}
	%>

</body>
</html>
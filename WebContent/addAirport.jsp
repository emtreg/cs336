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
		String id = request.getParameter("airport_id");
		String name = request.getParameter("airport_name");
		String city = request.getParameter("city");
		String country = request.getParameter("country");


		//Make an insert statement for the Sells table:
		String insert = "INSERT INTO Airport(airport_id, name, city, country)"
				+ "VALUES (?, ?, ?, ?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, id);
		ps.setString(2, name);
		ps.setString(3, city);
		ps.setString(4, country);
		//Run the query against the DB
		ps.executeUpdate();

		//Get parameters from the HTML form at the HelloWorld.jsp
		//String username = request.getParameter("user_id");
		//String password = request.getParameter("password");

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		out.print("Airport Added");
		
	} catch (Exception ex) {
		//out.print(ex);
		out.print("Airport ID already exists");
	}
%>
</body>
</html>
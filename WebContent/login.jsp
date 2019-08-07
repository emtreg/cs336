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
		//String username = request.getParameter("user_id");
		//String password = request.getParameter("password");
		
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
	        out.println("Welcome, " + name+"!");
	        
			if(result.getString("type").equals("admin")){
				%>
				<br>
				<br>
				 <form method="post" action="AdminPage.jsp">
				<input type="submit" value="Head to Admin Homepage">
			</form>
				<%
			}
			if(result.getString("type").equals("customer")){
				%>
				<br>
				<br>
				 <form method="post" action="customerHome.jsp">
				<input type="submit" value="Head to Homepage">
			</form>
				<%
			}
	        //Loggin out option
	        %>
	        <br>
	        <br>
	        <form method="post" action="logout.jsp">
				<input type="submit" value="Logout">
			</form>
	        <%
	    } else {
	        out.println("Invalid login");
	    }
	
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		result.close();
		stmt.close();
		con.close();
		
	} catch (Exception ex) {
		out.print("ERROR: Username does not exist");
	}
%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str = "select t.user_id id, max(t.total) total from (select user_id, sum(total_cost) total from Tickets group by user_id) t;";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			//parse out the results
			while(result.next()) {
			out.print("The customer who generated the most revenue was "+result.getString("id")+" with a total of $"+result.getString("total"));
			}
			con.close();
	}catch(Exception e){
		out.print(e);
	}
			//close the connection.
		%>
		<br>
	<form method="post" action="AdminPage.jsp">
	<input type="submit" value="Return to Homepage">
	</form>
</body>
</html>
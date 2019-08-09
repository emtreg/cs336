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
			String num = request.getParameter("flight_num");
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str = "select flight_num, count(*) as 'num', total from(select flight_num, total_cost total from Tickets where flight_num='"+num+"') t;";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			//Make an HTML table to show the results in:
			out.print("<table border=\"1\">");
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("Flight No.");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Total Tickets Sold");
			out.print("</td>");
			out.print("<td>");
			out.print("Total Revenue");
			out.print("</td>");

			//parse out the results
			while (result.next()&&result.getString("flight_num")!=null) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current bar name:
				out.print(result.getString("flight_num"));
				out.print("</td>");
				out.print("<td>");
				//Print out current beer name:
				out.print(result.getString("num"));
				out.print("</td>");
				out.print("<td>");
				//Print out current beer name:
				out.print("$"+result.getString("total"));
				out.print("</td>");

			}
			out.print("</table>");
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
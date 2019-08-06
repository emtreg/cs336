<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
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
			int month = request.getParameter("month");
			String year= request.getParameter("year");
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str = "select count(*) sales, sum(total_cost) total from (SELECT * total FROM Tickets WHERE  purchase_date>='"+year+":"+month+":00' and purchase_date<'"+year+":";
			if(month==12){
				str=str+"01:00');";
			}else{
				str=str+(month+1)+":00';";
			}
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			out.println("<b>A total of"+result.getString("sales")+"tickets were sold. The total revenue from this month was $"+result.getString("total")+".</b>");

		} catch (Exception e) {
		}
	%>
<br>
<br>
			<form method="post" action="AdminPage.jsp">
			<input type="submit" value="Return to the Admin Homepage">
			</form>
</body>
</html>
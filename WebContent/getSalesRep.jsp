<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
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
			//Get the combobox from the index.jsp
			int m = Integer.parseInt(request.getParameter("month"));
			int y= Integer.parseInt(request.getParameter("year"));
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String b;
			String e;
		if(m==12){
			b="'"+y+"-12-01'";
			e="'"+(y+1)+"-01-01'";
		}else if(m==10||m==11){
			b="'"+y+"-"+m+"-01'";
			e="'"+y+"-"+(m+1)+"-01'";
		}else if(m==9){
			b="'"+y+"-09-01'";
			e="'"+y+"-10-01'";
		}else{
			b="'"+y+"-0"+m+"-01'";
			e="'"+y+"-0"+(m+1)+"-01'";
		}
			String str="select count(*) sales, sum(total_cost) total from (select total_cost from Tickets where purchase_date between "+b+" and "+e+") t;";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			int s;
		while(result.next()){
			s=Integer.parseInt(result.getString("sales"));
			if(s>0){
			out.println("A total of "+s+" tickets were sold. The total revenue from this month was $"+result.getString("total")+".");
		}else{
			out.println("There were no sales in that month");
		}
		}
		con.close();
		stmt.close();
		result.close();
		%>
	<br>
	<br>
	<form method="post" action="AdminPage.jsp">
	<input type="submit" value="Return to Home">
	</form>
	
	<%
		} catch (Exception e) {
			out.print(e);
			%>
			<br>
			<br>
			<form method="post" action="AdminPage.jsp">
			<input type="submit" value="Return to Home">
			</form>
			
			<%
		}
	%>
</body>
</html>
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
			int year= request.getParameter("year");
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String monyear;
			String monyear2;
			if(month==12){
				monyear=year+"-"+month+"-01";
				monyear2=(year+1)+"-01-01";
			}else if(month==11||month==10){
				monyear=year+"-"+(month);
				monyear2=year+"-"+(month+1);
			}else if(month==9){
				monyear=year+"-0"+(month)+"-01";
				monyear2=year+"-10-01";
			}
			else{
				monyear=year+"-0"+(month)+"-01";
				monyear=year+"-0"+(month+1)+"-01";
			}
			String str="select count(*) sales, sum(total_cost) total from (select total_cost from Tickets where purchase_date between '"+year+"-"+month+"-01' and '"+monyear+"-01') t;";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
		if(result.getInt("sale")>0){
			out.println("<b>A total of"+result.getInt("sales")+"tickets were sold. The total revenue from this month was $"+result.getFloat("total")+".</b>");
		}else{
			out.println("There were no sales on this date");
		}
		%>
	<br>
	<br>
	<form method="post" action="AdminPage.jsp">
	<input type="submit" value="Return to Home">
	</form>
	<%
		} catch (Exception e) {
			out.print("Error");
		}
	%>
<br>
<br>
			<form method="post" action="AdminPage.jsp">
			<input type="submit" value="Return to the Admin Homepage">
			</form>
</body>
</html>
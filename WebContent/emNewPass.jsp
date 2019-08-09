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
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			String user=request.getParameter("user");
			String pass=request.getParameter("newPass");
			String str="update customer_rep set password='"+pass+"' where employee_id='"+user+"';";
			String test="select * from customer_rep where employee_id='"+user+"';";
			PreparedStatement ps = con.prepareStatement(str);
			ResultSet result=stmt.executeQuery(test);
			ps.executeUpdate();
			if(result.next()){
			out.println("Password change successful!");
			}else{
				out.println("Error, employee not found");
			}
			con.close();
			
	}catch(Exception e){
		out.print(e);
	}
%>	<br>
	<br>
	<form method="post" action="AdminPage.jsp">
	<input type="submit" value="Return to Homepage">
	</form>
</body>
</html>
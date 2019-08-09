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
			String email=request.getParameter("email");
			String str="update user set email='"+email+"' where user_id='"+user+"';";
			String test="select * from user where user_id='"+user+"';";
			PreparedStatement ps = con.prepareStatement(str);
			ResultSet result=stmt.executeQuery(test);
			ps.executeUpdate();
			if(result.next()){
			out.println("Email change successful!");
			}else{
				out.println("Error, user not found");
			}
			con.close();
			
	}catch(Exception e){
		out.println("Error, user not found");
		out.print(e);
	}
%>	<br>
	<br>
	<form method="post" action="AdminPage.jsp">
	<input type="submit" value="Return to Homepage">
	</form>
</body>
</html>
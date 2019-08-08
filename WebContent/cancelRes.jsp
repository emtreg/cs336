<!-- Code Done by Erika Cruz -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Canceling Reservation</title>
</head>
<body>
	<%
	try{
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();		
		Statement stmt = con.createStatement();
		
		//Get the selected radio button from the index.jsp
		String user = request.getParameter("command");
		//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
		String delete= "";
		//Run the query against the database.
		ResultSet result = stmt.executeQuery(delete);
		
		
		//close the connection.
		db.closeConnection(con);
	}catch(Exception e){
		out.print(e);
	}
	%>
</body>
</html>
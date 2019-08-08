<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome, Administrator!</title>
</head>
<body>
<h1>What would you like to do?</h1>
<br>
<br>
	<form method="post" action="editAccInfo.jsp"> <%//TBD %>
	<input type="submit" value="Create or edit a Customer or Customer Representative account">
	</form>
<br>
	<form method="post" action="salesRep.jsp"> <%//Done %>
	<input type="submit" value="Obtain a sales report">
	</form>
<br>
	<form method="post" action="reserv.jsp"> <%//Done %>
	<input type="submit" value="Obtain a list of reservations">
	</form>
<br>
	<form method="post" action="reservSum.jsp">
	<input type="submit" value="Obtain a summary of revenue">
	</form>
<br>
	<form method="post" action="flightInfo.jsp"><%//Testing out connection %>
	<input type="submit" value="Obtain information about flights">
	</form>
</body>
</html>
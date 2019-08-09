<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome, Administrator!</title>
</head>
<body>
<h2>What would you like to do?</h2>
<br>
	<form method="post" action="editAccInfo.jsp">
	<input type="submit" value="Create or edit a Customer or Customer Representative account">
	</form>
<br>
	<form method="post" action="salesRep.jsp">
	<input type="submit" value="Obtain a sales report">
	</form>
<br>
	<form method="post" action="reserv.jsp">
	<input type="submit" value="Obtain a list of reservations">
	</form>
<br>
	<form method="post" action="reservSum.jsp">
	<input type="submit" value="Obtain a summary of revenue">
	</form>
<br>
	<form method="post" action="flightInfo.jsp">
	<input type="submit" value="Obtain information about flights">
	</form>
<br>
	<form method="post" action="logout.jsp">
	<input type="submit" value="Logout">
	</form>
</body>
</html>
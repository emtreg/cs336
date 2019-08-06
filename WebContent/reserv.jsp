<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
Here you can get a list of reservations.
<br>
<br>
Enter flight number here:
<form method="post" action="flightNoReservs.jsp">
<input type="text" name="flightNo">
<input type="submit" value="Enter">
</form>
<br>
<br>
Or, enter the customer's user ID here:
<form method="post" action="customNameReservs.jsp">
<input type="text" name="user_id">
<input type="submit" value="Enter">
</form>
</body>
</html>
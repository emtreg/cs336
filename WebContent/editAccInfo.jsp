<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
<h2>Here you can edit information for a customer representative or a customer.</h2>
<br>
		To add a customer, please fill out the information below:
		<br>
	<form method="post" action="adAddUser.jsp">
	<table>
	<tr>    
	<td>Full name:</td><td><input type="text" name="name"></td>
	</tr>
	<tr>
	<td>Email:</td><td><input type="text" name="email"></td>
	</tr>
		<tr>    
	<td>User:</td><td><input type="text" name="user_id"></td>
	</tr>
	<tr>
	<td>Password:</td><td><input type="text" name="password"></td>
	</tr>
	</table>
	<input type="submit" value="Add User">
	</form>
	<br>
	<br>
		To change a customer's password, please fill out the information below:
		<br>
	<form method="post" action="newPass.jsp">
	<table>
	<tr>    
	<td>User:</td><td><input type="text" name="user"></td>
	</tr>
	<tr>
	<td>New Password:</td><td><input type="text" name="newPass"></td>
	</tr>
	</table>
	<input type="submit" value="Change Password">
	</form>
	<br>
	<br>
		To change a customer's name, please fill out the information below:
		<br>
	<form method="post" action="NewName.jsp">
	<table>
	<tr>    
	<td>User:</td><td><input type="text" name="user"></td>
	</tr>
	<tr>
	<td>New Name:</td><td><input type="text" name="name"></td>
	</tr>
	</table>
	<input type="submit" value="Change Name">
	</form>
	<br>
	<br>
			To change a customer's email, please fill out the information below:
		<br>
	<form method="post" action="newEmail.jsp">
	<table>
	<tr>    
	<td>User:</td><td><input type="text" name="user"></td>
	</tr>
	<tr>
	<td>New Email:</td><td><input type="text" name="email"></td>
	</tr>
	</table>
	<input type="submit" value="Change Email">
	</form>
	<br>
	<br>
			To delete a customer, please enter the customer's User ID:
		<br>
	<form method="post" action="deleteUser.jsp">
	<table>
	<tr>    
	<td>User:</td><td><input type="text" name="name"></td>
	</tr>
	<tr>
	<td>Are you sure?</td><td>	<select name="sure" size=1>
			<option value="no">No</option>
			<option value="yes">Yes</option>
		</select></td>
		</tr>
	</table>
	<input type="submit" value="Delete User">
	</form>
	<br>
	<br>
		<hr size="1">
	To add a customer representative, please fill out the information below:
		<form method="post" action="addCustRep.jsp">
	<table>
	<tr>    
	<td>Employee ID:</td><td><input type="text" name="id"></td>
	</tr>
	<tr>
	<td>Password:</td><td><input type="text" name="pass"></td>
	</tr>
		<tr>    
	<td>Name:</td><td><input type="text" name="name"></td>
	</tr>
	</table>
	<input type="submit" value="Add Employee">
	</form>
	<br>
	<br>
			To change an employee's name, please fill out the information below:
		<br>
	<form method="post" action="emNewName.jsp">
	<table>
	<tr>    
	<td>Employee ID:</td><td><input type="text" name="user"></td>
	</tr>
	<tr>
	<td>New Name:</td><td><input type="text" name="name"></td>
	</tr>
	</table>
	<input type="submit" value="Change Name">
	</form>
	<br>
	<br>
			To change an employee's password, please fill out the information below:
		<br>
	<form method="post" action="emNewPass.jsp">
	<table>
	<tr>    
	<td>Employee ID:</td><td><input type="text" name="user"></td>
	</tr>
	<tr>
	<td>New Password:</td><td><input type="text" name="newPass"></td>
	</tr>
	</table>
	<input type="submit" value="Change Password">
	</form>
	<br>
	<br>	
	To delete an employee, enter the employee's ID:
	<form method="post" action="deleteEmployee.jsp">
	<table>
	<tr>    
	<td>ID:</td><td><input type="text" name="name"></td>
	</tr>
	<tr>
	<td>Are you sure?</td><td>	<select name="sure" size=1>
			<option value="no">No</option>
			<option value="yes">Yes</option>
		</select></td>
		</tr>
	</table>
	<input type="submit" value="Delete Employee">
	</form>
	<br>
	<br>
	<form method="post" action="AdminPage.jsp">
		<input type="submit" value="Return to Homepage">
	</form>
	

</body>
</html>
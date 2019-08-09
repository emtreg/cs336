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
		
		String userflight = request.getParameter("cancel");
		int comma = userflight.indexOf(','); 
		String user = userflight.substring(0,comma);
		String flight= userflight.substring(comma+1);
		
		String checkClass= "SELECT class From Tickets WHERE user_id='"+user+"' and flight_num='"+flight+"';";
		ResultSet rst= stmt.executeQuery(checkClass);
		
		rst.next();
		String tickClass= rst.getString("class");
		//out.print(tickClass);
		
		if((tickClass.equals("First"))||(tickClass.equals("Business"))){
			//delete ticket form Tickets DB
			String deleteTix= "DELETE FROM Tickets WHERE user_id= '"+user+"' and flight_num = '"+flight+"';";
			PreparedStatement ps= con.prepareStatement(deleteTix);
			ps.executeUpdate();
			
			//delete reservation from Reservations DB
			String deleteRes= "DELETE FROM Reservations WHERE user_id= '"+user+"' and flight_num = '"+flight+"';";
			ps= con.prepareStatement(deleteRes);
			ps.executeUpdate();
			
			con.close();
    		out.print("Your Ticket and Reservation are Now Cancelled");
		}
		else{
			out.print("You cannot cancel an Economy class ticket");
		}        		
        		
		
		%><form method="post" action="upcomingReservations.jsp">
				<br><br><button type="submit" name="command" value="<%=user%>"> Go back to Upcoming Reservations </button>
		</form>
		<%
		//close the connection.
		con.close();
		db.closeConnection(con);
	}catch(Exception e){
		out.print(e);
	}
	%>
</body>
</html>
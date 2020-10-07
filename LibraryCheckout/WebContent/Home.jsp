<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="com.library.bo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Library Checkout System</title>
</head>
<body>
<BR><B>****Library Checkout System****</B>
<BR>
<BR>

<%
User user = (User)session.getAttribute("UserObj");

System.out.println("user"+user);

if (user !=null)
{
	if (user.getUserType().equals("A"))
	{
		%>
		<BR>
		Admin Library Options
		<BR>
		<a href="./CreateUser.jsp">Create New User</a>
		<BR><a href="./CreateInventory.jsp">Create New Inventory</a>
		<BR><a href="./UpdateUser.jsp">Update Profile</a>
		<BR><a href="./SearchInventory.jsp">Search Inventory</a>
		
		<% 
	}
	else
	{
		%>
		<BR>
		Library Options
		<BR>
		<a href="./UpdateUser.jsp">Update Profile</a>
		<BR><a href="./SearchInventory.jsp">Search Inventory</a>
		
		<% 
	}
	
}
else
{
	%>
	<jsp:forward page="index.jsp">
	<%
}
%>
</body>
</html>
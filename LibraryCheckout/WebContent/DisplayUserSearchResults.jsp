<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.library.bo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Library Checkout System</title>
</head>
<body>
<BR>
<BR>
<B>Search Results for User</B>
<%
User sessionUser = (User)session.getAttribute("UserObj");

String user = sessionUser.getLoginId();

String searchString = request.getParameter("searchstring");
UserProfile profile = new UserProfile();
User[] users = null;

users = profile.searchUser(searchString);

if (users != null)
{
	int len = users.length;
	
	if (len!=0)
	{
	%>
	<BR>
	<table border="1">
			<tr>
		<td><b>LOGINID</b></td>
		<td><b>FIRST NAME</b></td>
		<td><b>LAST NAME</b></td>
		<td><b>ADDRESS</b></td>
		<td><b>PHONE</b></td>
		<td><b>EMAIL</b></td>
		</tr>
	
	<% 
	
	for (int i=0; i<len; i++)
	{
		int userId = users[i].getUserId();
		String add = users[i].getAddress()+" "+users[i].getCity()+" "+users[i].getState()+" "+users[i].getPostalCode(); 
		%>
		<tr>
		<td><a href="./UpdateUserForm.jsp?userId=<%=userId%>"><%=users[i].getLoginId() %></a></td>
		<td><%=users[i].getFirstName() %></td>
		<td><%=users[i].getLastName() %></td>
		<td><%=add%></td>
		<td><%=users[i].getPhone() %></td>
		<td><%=users[i].getEMail() %></td>
		</tr>
		
		<% 
	}
	%>
	</table>
	<% 
	}
	else
	{
		%><BR>
		NO DATA FOUND
		<%
	}
	
	
}
else
{
%>
	<BR>
NO DATA FOUND

<%
}
%>

</body>
</html>
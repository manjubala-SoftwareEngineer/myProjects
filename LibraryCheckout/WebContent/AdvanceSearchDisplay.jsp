<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.library.bo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Library Checkout System</title>
</head>
<body>
<b>Advance Search Results</b>
<%
String advSTitle = request.getParameter("ast");
String advSAuthor = request.getParameter("asaut");
String advSSubject = request.getParameter("assub");

Inventory inv=new Inventory();
Item[] items = null;

items = inv.searchAdvance(advSTitle,advSAuthor,advSSubject);

if (items != null)
{
	int len = items.length;
	
	if (len!=0)
	{
	%>
	<BR>
	<form action="./CheckOut.jsp" method="post">
	<table border="1">
			<tr>
		<td></td>
		<td><b>TITLE</b></td>
		<td><b>AUTHOR</b></td>
		<td><b>SUBJECT</b></td>
		<td><b>PUBLISHED YEAR</b></td>
		<td><b>STATUS</b></td>
		</tr>
	
	<% 
	
	for (int i=0; i<len; i++)
	{
		%>
		<tr>
		<td><input type="checkbox" name="itemgroup" value="<%=items[i].getItemId()%>"></td>
		<td><%=items[i].getTitle() %></td>
		<td><%=items[i].getAuthor() %></td>
		<td><%=items[i].getSubject() %></td>
		<td><%=items[i].getYear() %></td>
		<td><%=items[i].getStatus() %></td>
		</tr>
		<% 
	}
	%>
	</table>
	<input type="Submit" name="CheckOut" value="CheckOut"> 
	</form>
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
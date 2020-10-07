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

<%
System.out.println("Create Inventory Page");
Item item= new Item();
System.out.println("Create Inventory Page 1");
if (request != null)
{
	

item.setCategory(request.getParameter("cat"));
System.out.println("Create Inventory Page");
System.out.println("request "+request);

item.setTitle(request.getParameter("tile"));
item.setAuthor(request.getParameter("author"));
item.setSubject(request.getParameter("subject"));
item.setYear(Integer.parseInt(request.getParameter("year")));
item.setCopies(Integer.parseInt(request.getParameter("copies")));

Inventory libInventory = new Inventory();

boolean isCreated = libInventory.createInventory(item);

if (isCreated)
{
%>
 Title - <%=item.getTitle() %> Created Successfully in System
<%
}
else
{
	%>
Error in adding  Title - <%=item.getTitle() %> in System. Please try again
<%
}
}
else
{
%>
Error in adding Book in System. Please try again

<%
}
%>

</body>
</html>
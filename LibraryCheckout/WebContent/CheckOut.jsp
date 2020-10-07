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
<b>
<%
User sessionUser = (User)session.getAttribute("UserObj");


int userId = sessionUser.getUserId();
String user = sessionUser.getLoginId();
Transaction trans = new Transaction();
boolean isCheckout = false;

System.out.println("User in session = "+user);


String[] values = request.getParameterValues("itemgroup");



for (int i=0;i<values.length;i++)
{
 
isCheckout = trans.checkoutItem(sessionUser, Integer.parseInt(values[i]));
}

if (isCheckout )
{
%>
Items successully Checked Out!!
<%
}
else
{
%>
Error in Check Out Operation. Please try again!

<%
}
%>
</b>
</body>
</html>
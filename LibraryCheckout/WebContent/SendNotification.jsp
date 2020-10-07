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
Transaction libTrans = new Transaction();

int checkoutUserId = Integer.parseInt(request.getParameter("userId"));
int checkoutItemId = Integer.parseInt(request.getParameter("itemId"));
String dueDate = request.getParameter("dueDate");
System.out.println("User in session = "+sessionUser.getLoginId());

boolean success = libTrans.sendNotification(checkoutUserId, checkoutItemId, dueDate);


if (success )
{
%>
Notification sent successfully!!
<%
}
else
{
%>
Error in sending Notification . Please try again!

<%
}
%>
</b>
</body>
</html>
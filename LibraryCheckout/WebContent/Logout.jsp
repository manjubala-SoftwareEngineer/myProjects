<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html>

<head>
<title>Library Checkout System</title>

</head>

<body >

<%
session.setAttribute("UserObj", null);
session.invalidate();
%>
<BR>
<BR>
User Logged out!
</body>

</html>
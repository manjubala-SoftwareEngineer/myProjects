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

User sessionUser = (User)session.getAttribute("UserObj");

String newPassword = request.getParameter("newpassword");

UserProfile profile = new UserProfile();

sessionUser.setPassword(newPassword);

boolean isPasswordChanged = profile.changePassword(sessionUser);

if (isPasswordChanged)
{
	%>
	Password Successfully changed for User <%=sessionUser.getLoginId()%> !!
	<%
	session.setAttribute("UserObj", sessionUser);
}
else
{
	%>
	Error in Password Change !! Please try again! 
	<%
}

%>
</body>
</html>
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
UserProfile profile = new UserProfile();
User user = new User();
user.setUserType(request.getParameter("type"));
String firstName = request.getParameter("firstname");
user.setFirstName(firstName);
user.setLastName(request.getParameter("lastname"));
user.setAddress(request.getParameter("add"));
user.setCity(request.getParameter("city"));
user.setState(request.getParameter("state"));
user.setPostalCode(request.getParameter("postalcode"));
System.out.println("phone number "+request.getParameter("number"));
user.setPhone(request.getParameter("number"));
user.setEMail(request.getParameter("email"));
user.setLoginId(firstName);
user.setPassword(firstName);

boolean isCreated = profile.createUser(user);
//boolean isCreated = true;

if (isCreated)
{
	%>
	User <%=user.getFirstName()%> Created Successfully !!
	<%
}
else
{
	%>
	Error in User Creation !! Please try again! 
	<%
}

%>
</body>
</html>
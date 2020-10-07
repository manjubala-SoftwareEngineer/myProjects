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
String requestFrom = request.getParameter("requestFrom");
System.out.println("UpdateUser - requestFrom="+requestFrom);
UserProfile profile = new UserProfile();
User user = new User();
int userId;

if (requestFrom.equals("userList"))
{
	System.out.println("UpdateUser : request from UserList");
	//request is coming from UserList page
	userId = Integer.parseInt(request.getParameter("userId"));
	user = profile.getUser(userId); 
	System.out.println("UpdateUser -User to update = "+user.getLoginId());

}
else
{
	System.out.println("UpdateUser : direct request from user");
	//individual request for update user
	user = (User)session.getAttribute("UserObj");
	userId = user.getUserId();
	System.out.println("UpdateUser -User in session = "+user.getLoginId());
}

String userType = user.getUserType();
String loginId = user.getLoginId();
String password = user.getPassword();



user.setUserId(userId);
user.setUserType(userType);
user.setLoginId(loginId);
user.setPassword(password);

user.setFirstName(request.getParameter("firstname"));
user.setLastName(request.getParameter("lastname"));
user.setAddress(request.getParameter("add"));
user.setCity(request.getParameter("city"));
user.setState(request.getParameter("state"));
user.setPostalCode(request.getParameter("postalcode"));
user.setPhone(request.getParameter("number"));
user.setEMail(request.getParameter("email"));

boolean isUpdated = profile.updateUser(user);

if (isUpdated)
{
	%>
	User <%=user.getFirstName()%> Profile Updated Successfully !!
	<%
	System.out.println("**requestFrom="+requestFrom);
	if (requestFrom.equals("directupdate") )
	{
		System.out.println("**UpdateUser -Direct Update. set the updated object in session");
		session.setAttribute("UserObj", user);
	}	
}
else
{
	%>
	Error in User Profile Updation !! Please try again! 
	<%
}

%>
</body>
</html>
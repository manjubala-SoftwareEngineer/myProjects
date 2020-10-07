<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="com.library.bo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Library Checkout System</title>
<script language='javascript'>
function refresh(){
var f = parent.document.getElementsByName('left')[0];
f.src = f.src;   
}
</script>
</head>
<body >

<BR>
<BR>

<%
String userId = request.getParameter("userid");
String password = request.getParameter("password");

UserProfile userProf = new UserProfile();
User user = null;


user = userProf.authenticateUser(userId, password);

if (user != null )
{
	//user.setUserType("U");
	session.setAttribute("UserObj", user);
	
	%>
	<BR>
	<B><center>Welcome User <%=user.getLoginId() %></center></B>
<script>
//call after page loaded
window.onload=refresh ; 
</script>	
<% 
}
else
{%>
	<BR>
	<B><center>Invalid Password. Please try again.</center></B>
	
	<%
}

%>

</body>
</html>
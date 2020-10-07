<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.library.bo.*"%>

<html>

<head>
<title>Library Checkout System</title>
<script>
function checkPassword()
{
	var newpass= document.getElementById('newpassword').value;
	var confirmpass= document.getElementById('confirmpassword').value;
	alert("newpass  "+newpass);
	alert("confirmpass   "+confirmpass);
	
	if (newpass==confirmpass)
		{
		alert("equalpwd");
		document.getElementById("changepass").submit();
		}
	else
		{
		alert("Please Enter Same Password!");
		}
}
</script>
</head>

<body >
<%
User sessionUser = (User)session.getAttribute("UserObj");


int userId = sessionUser.getUserId();
String user = sessionUser.getLoginId();

System.out.println("User in session = "+user);

%>
<b>Change Password</b>
<BR>
<BR>

       <form id="changepass" action="./ChangePasswordProcess.jsp" method="post">
       <table  border="1"><tr ><th colspan="2" align="center">Enter New Password</th></tr>
       <tr><td>Login Id</td><td><%=user%></td></tr>
        <tr><td>Enter New Password</td><td><input type="password"  id="newpassword" name="newpassword"  required></td></tr>
        <tr><td>Confirm New Password</td><td><input type="password"  id="confirmpassword" name="confirmpassword" required></td></tr>
       <tr><td align="center"></td><td align="center"><input type="button" onclick="checkPassword()" value="Submit"><input type="reset" value="Cancel"></td></tr>
       </table> 
</form>
</body>

</html>
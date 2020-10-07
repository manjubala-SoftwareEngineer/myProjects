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
String user = sessionUser.getLoginId();
Transaction trans = new Transaction();
boolean isCheckin = false;

System.out.println("User in session = "+user);


String[] values = request.getParameterValues("itemgroup");





for (int i=0;i<values.length;i++)
{
	String str = values[i];
	
	System.out.println("JSP Checkin value of selected item str="+str);
	String arrayStr[] = str.split(",");
	
	int itemId = Integer.parseInt(arrayStr[0]);
	int userId = Integer.parseInt(arrayStr[1]);

	System.out.println("JSP Checkin value of ItemID="+itemId);
	System.out.println("JSP Checkin value of UserID="+userId);

 
	isCheckin = trans.checkinItem(userId, itemId);
}

if (isCheckin )
{
%>
Items successfully Checked In!!
<%
}
else
{
%>
Error in Check In Operation. Please try again!

<%
}
%>
</b>
</body>
</html>
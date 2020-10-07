<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.library.bo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Library Checkout System</title>
</head>
<body>

<%
String userIdFromRequestStr = request.getParameter("userId");
User user = null;
UserProfile profile = new UserProfile();

int userId = 0;
String requestFrom="";


if (userIdFromRequestStr != null)
{
	System.out.println("UpdateUser form : request from UserList");
	//request is coming from UserList page
	userId = Integer.parseInt(userIdFromRequestStr);
	user = profile.getUser(userId); 
	System.out.println("User to update = "+user.getLoginId());
	requestFrom = "userList";
	
}
else
{
	System.out.println("UpdateUser form : direct request from user");
	//individual request for update user
	user = (User)session.getAttribute("UserObj");

	//take userID from Session
	userId = user.getUserId();
	String userLoginId = user.getLoginId();

	System.out.println("User in session = "+userLoginId);
	requestFrom = "directupdate";

}




%>
<b>Update Library System User</b>
<BR>
<BR>
<form action="./UpdateUser.jsp" method="post">
<input type="hidden" name="requestFrom" value="<%=requestFrom%>">
<input type="hidden" name="userId" value="<%=userId%>">

<table align="center" border = "1" cellspacing="5">
         <tr>
         <th colspan="2">User Details</th>   
         </tr>
         <tr>
            <td align="right">  First Name:</td>
            <td><input type="text" name="firstname" required pattern="[A-Za-z\s]+" title="Fill User FirstName using aplhabets A-Z or a-z" value="<%=user.getFirstName() %>"></td>
         </tr>
         <tr>
            <td align="right" >Last Name:</td>
            <td ><input type="text" name="lastname" required pattern="[A-Za-z\s]+" title="Fill User LastName using aplhabets A-Z or a-z"value="<%=user.getLastName() %>"></td>
            
         </tr>
         <tr>
            <td align="right" >Address:</td>
            <td ><input type="text" name="add" required value="<%=user.getAddress() %>"></td>   
         </tr>
         <tr>
            <td align="right" >City:</td>
            <td ><input type="text" name="city" required pattern="[A-Za-z\s]+" title="City Name using aplhabets A-Z or a-z" value="<%=user.getCity() %>"></td>
            
         </tr>
         <tr>
            <td align="right" >Province:</td>
            <td ><input type="text" name="state" required pattern="[A-Za-z\s]+" title="Province Name using aplhabets A-Z or a-z" value="<%=user.getState() %>"></td>
         </tr>
         <tr>
            <td align="right" >PostalCode:</td>
            <td ><input type="text" name="postalcode" required pattern="[A-Za-z][0-9][A-Za-z] [0-9][A-Za-z][0-9]" title="Format: A0A 0A0" value="<%=user.getPostalCode() %>"></td>
         </tr>
         <tr>
            <td align="right" >Phone Number:</td>
            <td ><input type="text" name="number" required pattern="[0-9]{10}"  title="Format for Phone Number: 9999999999" value="<%=user.getPhone() %>"></td>
         </tr>
         <tr>
            <td align="right" >Email Address:</td>
            <td ><input type="text" name="email" required pattern="\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$"  title="example@abc.com" value="<%=user.getEMail() %>"></td>
         </tr>
         <tr>
            <td colspan="2" align="center" ><input type="submit" value="Update"><input type="reset" value="Cancel"></td>   
         </tr>
      </table>
</form>
</body></html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="com.library.bo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Library Checkout System</title>
<script >
function refresh()
{
	//alert("refresh function");
	window.location.reload(true); 
	}
</script>
</head>
<body>

<BR>
<BR>

<%
//Left Side Menu dispaly according to User Login -Admin or User 

User user = (User)session.getAttribute("UserObj"); //Setting userobject in session  

if (user != null )//If User is not Null display Menu as per login User -Admin/User  
{
	System.out.println("LeftNav JSP Page Session is existing");
	
	if (user.getUserType().equals("A"))
	{
		%>
		<BR>
		<B>Admin Library Options</B>
		<BR>
		<BR>
		<BR><a href="./UserForm.jsp" target="main">Create New User</a>
		<BR><a href="./SearchUser.jsp" target="main">Search User</a>
		<BR><a href="./InventoryForm.jsp" target="main">Create New Inventory</a>
		<BR><a href="./SearchInventory.jsp" target="main">Search Inventory</a>
		<BR><a href="./InventoryForm.jsp?action=donate" target="main">Donate Item</a>
		<BR><a href="./CheckOutList.jsp" target="main">Checkout List</a>
		<BR><a href="./UpdateUserForm.jsp" target="main">Update Profile</a>
		<BR><a href="./ChangePassword.jsp" target="main">Change Password</a>
		<BR><a href="./Logout.jsp" target="main" onclick="refresh()">Logout</a>
		<% 
	}
	else
	{
		%>
		<BR>
		<B>Library Options</B>
		<BR>
		<BR>
		<BR><a href="./SearchInventory.jsp" target="main">Search Inventory</a>
		<BR><a href="./CheckOutList.jsp" target="main">Checkout List</a>
		<BR><a href="./UpdateUserForm.jsp" target="main">Update Profile</a>
		<BR><a href="./ChangePassword.jsp" target="main">Change Password</a>
		<BR><a href="./Logout.jsp" target="main" onclick="refresh()">Logout</a>
		<% 
	}
}
else
{
	System.out.println("LeftNav JSP Page Session is new");
	
	//show login link
	  %>
	<BR><a href="./Login.jsp" target="main">User Login</a>
    
	<% 
}

%>
</body>
</html>
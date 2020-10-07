<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.library.bo.*"%>

<%
String userId = request.getParameter("userid");
String password = request.getParameter("password");
String usrt=null;

UserProfile userProf = new UserProfile();
User user = null;
String userType = "";
boolean loginSuccess = false;


user = userProf.authenticateUser(userId, password);

System.out.println("user in JSP "+user);

if (user != null )
{
	usrt=user.getUserType();
	System.out.println("In JSP - "+usrt);

	session.setAttribute("UserObj", user);
	//user.setUserType("A");
	loginSuccess = true;
	if (usrt.equals("A"))
	{
		userType = "admin";
	}
	else
	{
		userType = "user";

	}
}
else{
	loginSuccess=false;
	%>
	Invalid Login or Password. Please try again.
	
	<a href="./index.jsp">LOGIN</a>
	<% 
	System.out.println("Not a Valid user");
}


%>

<!DOCTYPE html>

<html lang="en">
<head>
<title>Library CheckOut System</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
}

body {
  font-family: Arial, Helvetica, sans-serif;
  height: 100%;
  width: 100%;
}

/* Style the header */
header {
  background-color: #666;
  padding: 20px;
  text-align: center;
  font-size: 20px;
  color: white;
}

/* Create two columns/boxes that floats next to each other */
nav {
  float: left;
  width: 30%;
  height: 500px; /* only for demonstration, should be removed */
  background: #ccc;
  padding: 20px;
}

/* Style the list inside the menu */
nav ul {
  list-style-type: none;
  padding: 0;
}

article {
  float: left;
  padding: 20px;
  width: 70%;
  background-color: #f1f1f1;
  height: 500px; /* only for demonstration, should be removed */
}

/* Clear floats after the columns */
section:after {
  content: "";
  display: table;
  clear: both;
}

/* Style the footer */
footer {
  background-color: #777;
  padding: 10px;
  text-align: center;
  color: white;
}

/* Responsive layout - makes the two columns/boxes stack on top of each other instead of next to each other, on small screens */
@media (max-width: 600px) {
  nav, article {
    width: 100%;
    height: 100%;
  }
}
</style>
</head>
<body>
<header>
  <h2>Library CheckOut System</h2>
</header>

<section>
  <nav>
    <ul>
    <%
    if (loginSuccess)
    {
        if (userType.equals("admin"))
        {
        %>
    	<BR>
    	<BR>
    	<li><a href="./UserForm.jsp">Create New User</a></li>
    	<BR>
    	<li><a href="./UpdateUser.jsp">Update Profile</a></li>
    	<BR>
    	<li><a href="./InventoryForm.jsp">Create New Inventory</a></li>
    	<BR>
    	<li><a href="./SearchInventory.jsp">Search Inventory</a></li>
        <%}
        else
        {
            %>
        	<BR>
        	<BR>
        	<li><a href="./UpdateUser.jsp">Update Profile</a></li>
        	<BR>
        	<li><a href="./SearchInventory.jsp">Search Inventory</a></li>
            <%    	
        }
    }
    else
    {
    	%>
      <li><a href="./Login.jsp" target="main">User Login</a></li>
    	
    	<% 
    }
    %>
    </ul>
  </nav>
  
  <article>
  <iframe height="100%" width="100%" name="main" srcdoc="<BR><BR><p><b><center>Welcome to Library Checkout System !! <center></B></p>" src="./Welcome.jsp"></iframe>
  </article>
</section>

<footer>
  <p>ComIT-Automation Testing in Java</p>
</footer>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html>

<head>
<title>Library Checkout System</title>
</head>

<body >
<BR>
<BR>

       <form action="./LoginProcess.jsp" method="post">
       <table align="center" border="1"><tr ><th colspan="2" align="center">Login</th></tr>
       <tr><td>Login Id</td><td><input type="text" name="userid" required></td></tr>
        <tr><td>Password</td><td><input type="password" name="password" required></td></tr>
       <tr><td align="center"></td><td align="center"><input type="submit" value="Submit"><input type="reset" value="Cancel"></td></tr>
       </table> 
</form>
</body>

</html>
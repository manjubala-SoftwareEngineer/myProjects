<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.library.bo.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Library Checkout System</title>
</head>
<body>
<b>Search User</b>
<BR>
<BR>
<form action="./DisplayUserSearchResults.jsp" method="post">
<table align="center" border = "1" cellspacing="5">
         <tr>
         <th colspan="2">Enter Search String</th>   
         </tr>
         <tr>
         <tr>
            <td align="right">  Search:</td>
            <td><input type="text" name="searchstring"></td>
         </tr>
         <tr>
            <td colspan="2" align="center" ><input type="submit" value="Search"></td>   
         </tr>
</table>
</form>
</body>
</html>
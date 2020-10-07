<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.library.bo.*"%>
<!DOCTYPE html>
<html>
<head>
<script>
function showMore()
{
//alert("in showMore");
document.getElementById('hidden div').hidden = false;
}
</script>

<meta charset="ISO-8859-1">
<title>Library Checkout System</title>
</head>
<body>
<b>Search Inventory</b>
<BR>
<BR>
<form action="./DisplaySearchResults.jsp" method="post">
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

<a href='./AdvanceSearchInventory.jsp'><b>Advance Search</b></a>
</body>
</html>
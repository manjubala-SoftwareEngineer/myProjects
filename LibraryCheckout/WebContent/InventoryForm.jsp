<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Library Checkout System</title>
</head>
<body>

<%
String action = request.getParameter("action");

if (action!=null && action.equals("donate"))
{
%>
<b>Donate Item to Library</b>
<%
}
else
{
	%>
	<b>Create New Item in Library Inventory</b>
	<%
	
}
%>
<BR>
<BR>
<form action="./CreateInventory.jsp" method="post">
<table align="center" border = "1" cellspacing="5">
         <tr>
         <th colspan="2">Enter Item Details</th>   
         </tr>
         <tr>
            <td align="right">Category: </td>
            <td><select style="width: 180px; " id="cat" name="cat">
            <option value="hcb">HardCoverBook</option>
             <option value="scb">SoftCoverBook</option>
              <option value="cd">CD</option>
               <option value="mag">Magazine</option>
                <option value="toy">Toy</option>
            </select></td>
            
         </tr>
         <tr>
            <td align="right">  Title:</td>
            <td><input type="text" name="tile"></td>
         </tr>
         <tr>
            <td align="right" >Author:</td>
            <td ><input type="text" name="author"></td>
            
         </tr>
         <tr>
            <td align="right" >Subject:</td>
            <td ><input type="text" name="subject"></td>   
         </tr>
         <tr>
            <td align="right" >Year:</td>
            <td ><input type="text" name="year"></td>
            
         </tr>
         <tr>
            <td align="right" >Copies:</td>
            <td ><input type="text" name="copies"></td>
            
         </tr>
         <tr>
            <td colspan="2" align="center" ><input type="submit" value="Submit"><input type="reset" value="Cancel"></td>   
         </tr>
      </table>
  
</form>
</body>
</html>
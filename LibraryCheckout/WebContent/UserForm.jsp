<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>

 .req
{
    color: red;
    font-size: 7pt
}


</style>
<meta charset="ISO-8859-1">
<title>Library Checkout System</title>
</head>
<body>
<b>Create Library System User</b>
<BR>
<BR>
<form action="./CreateUser.jsp" method="post">
<table align="center" border = "1" cellspacing="5">
         <tr>
         <th colspan="2">Enter User Details</th>   
         </tr>
         <tr>
            <td align="right">User Type:</td>
            <td><select style="width: 180px; " id="type" name="type">
            <option value="A">Admin</option>
            <option value="U">User</option>
            </select></td>
         </tr>
         <tr>
            <td align="right">  First Name:<span class="req">*</span></td>
            <td><input type="text" name="firstname" required pattern="[A-Za-z\s]+" title="Fill User FirstName using aplhabets A-Z or a-z"></td>
         </tr>
         <tr>
            <td align="right" >Last Name:<span class="req">*</span></td>
            <td ><input type="text" name="lastname" required pattern="[A-Za-z\s]+" title="Fill User LastName using aplhabets A-Z or a-z"></td>
            
         </tr>
         <tr>
            <td align="right" >Address:<span class="req">*</span></td>
            <td ><input type="text" name="add" required></td>   
         </tr>
         <tr>
            <td align="right" >City:<span class="req">*</span></td>
            <td ><input type="text" name="city" required pattern="[A-Za-z\s]+" title="City Name using aplhabets A-Z or a-z"></td>
            
         </tr>
         <tr>
            <td align="right" >Province:<span class="req">*</span></td>
            <td ><input type="text" name="state" required pattern="[A-Za-z\s]+" title="Province Name using aplhabets A-Z or a-z"></td>
         </tr>
         <tr>
            <td align="right" >PostalCode:<span class="req">*</span></td>
            <td ><input type="text" name="postalcode" required pattern="[A-Za-z][0-9][A-Za-z] [0-9][A-Za-z][0-9]" placeholder="A0A 0A0" title="Format: A0A 0A0"></td>
         </tr>
         <tr>
            <td align="right" >Phone Number:<span class="req">*</span></td>
            <td ><input type="text" name="number" required pattern="[0-9]{10}"  title="Format for Phone Number: 9999999999" placeholder="9999999999"></td>
         </tr>
         <tr>
            <td align="right" >Email Address:<span class="req">*</span></td>
            <td ><input type="text" name="email" required pattern="\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$"  title="example@abc.com"></td>
         </tr>
         <tr>
            <td colspan="2" align="center" ><span class="req" >*required fields</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Submit">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="Cancel"></td>   
         </tr>
      </table>
</form>
</body></html>
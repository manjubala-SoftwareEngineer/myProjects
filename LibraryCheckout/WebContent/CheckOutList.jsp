<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.library.bo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Library Checkout System</title>
<script>
function formCheckInSubmit()
{
alert("Are you sure you want to Check-in selected item?");
document.getElementById("checkinrenew").action="./CheckIn.jsp";
document.getElementById("checkinrenew").submit();
/*var x = document.getElementById("myTable").rows.length;
var c = document.getElementById("myTable").rows[1].cells[5].innerHTML;
var s = document.getElementById("myTable").rows[1].cells[6].innerHTML;

var b=document.forms['Chkoutfrm'].chbx[i].checked;
alert(x+c+s+b);*/

}
function formRenewSubmit()
{
	alert("Are you sure you want to Renew selected item?");
document.getElementById("checkinrenew").action="./Renew.jsp";
document.getElementById("checkinrenew").submit();
/*var x = document.getElementById("myTable").rows.length;
var c = document.getElementById("myTable").rows[1].cells[5].innerHTML;
var s = document.getElementById("myTable").rows[1].cells[6].innerHTML;

var b=document.forms['Chkoutfrm'].chbx[i].checked;
alert(x+c+s+b);*/

}


</script>

</head>
<body>
<BR>
<BR>
<b>Checkout Items List</b>
<%
User sessionUser = (User)session.getAttribute("UserObj");
Transaction trans = new Transaction();
ItemTrans[] items = null;

items = trans.getCheckoutList(sessionUser);

if (items != null)
{
	int len = items.length;
	
	if (len!=0)
	{
	%>
	<BR>
	<form id="checkinrenew" action="" method="post">
	
	
	<table id="myTable" border="1">
			<tr>
		<td></td>
		<td><b>TITLE</b></td>
		<td><b>CATEGORY</b></td>
		<% if (sessionUser.getUserType().equals("A"))
		{%>
		<td><b>CHECKOUT BY USER</b></td>
		<%} %>
		<td><b>CHECKOUT DATE</b></td>
		<td><b>DUE DATE</b></td>
		<td><b>STATUS</b></td>
		<% if (sessionUser.getUserType().equals("A"))
		{%>
		<td></td>
		<%} %>
		</tr>
	
	<% 
	
	for (int i=0; i<len; i++)
	{
		int itemId = items[i].getItemId();
		int userId = items[i].getUserId();
		String itemIdUserId = itemId+","+userId;
		System.out.println("JSP Page Checkout List itemIdUserId = "+itemIdUserId);
		%>
		<tr>
		<td><input type="checkbox" name="itemgroup" value="<%=itemIdUserId%>"></td>
		<td><%=items[i].getItemTitle() %></td>
		<td><%=items[i].getItemCategory() %></td>
		<% if (sessionUser.getUserType().equals("A"))
		{%>
		<td><%=items[i].getUserName()%></td>
		<%} %>
		<td><%=items[i].getCheckoutDate()%></td>
		<td><%=items[i].getDueDate()%></td>
		<td><%=items[i].getStatus()%></td>
		<% if (sessionUser.getUserType().equals("A"))
		{%>
		<td><a href="./SendNotification.jsp?userId=<%=items[i].getUserId()%>&itemId=<%=items[i].getItemId()%>&dueDate=<%=items[i].getDueDate()%>">Send Notification</a></td>
		<%} %>
		
		</tr>
		<% 
	}
	%>
	</table>
	<input type="button" value="Checkin"  onclick="formCheckInSubmit()"><input type="button" value="Renew"  onclick="formRenewSubmit()"> 
	</form>
	<% 
	}
	else
	{
		%><BR>
		NO DATA FOUND
		<%
	}
	
	
}
else
{
%>
	<BR>
NO DATA FOUND

<%
}
%>

</body>
</html>
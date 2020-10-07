<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.library.bo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Library Checkout System</title>
<script>
function checkSelection()
{
alert("HIIIIIII");
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
<b>Search Results</b>
<%
String searchString = request.getParameter("searchstring");
//String searchString = "Fiction";
//String checkout = request.getParameter("CheckOut");

Inventory inv=new Inventory();
Item[] items = null;
int copies=0;
String status=null;

items = inv.searchItem(searchString);

if (items != null)
{
	int len = items.length;
	
	if (len!=0)
	{
	%>
	<BR>
	<form id="Chkoutfrm" action="CheckedOut.jsp" method="post">
	
	
	<table id="myTable" border="1">
			<tr>
		<td></td>
		<td><b>TITLE</b></td>
		<td><b>AUTHOR</b></td>
		<td><b>SUBJECT</b></td>
		<td><b>PUBLISHED YEAR</b></td>
		<td><b>COPIES</b></td>
		<td><b>STATUS</b></td>
		</tr>
	
	<% 
	
	for (int i=0; i<len; i++)
	{
		%>
		<tr>
		<td><input type="checkbox" name="chkbx"></td>
		<td><%=items[i].getTitle() %></td>
		<td><%=items[i].getAuthor() %></td>
		<td><%=items[i].getSubject() %></td>
		<td><%=items[i].getYear() %></td>
		<td id="copycount"><%=copies=items[i].getCopies() %></td>
		<td id="status"><%=status=items[i].getStatus() %></td>
		</tr>
		<% 
	}
	System.out.println("Availabe number of Copies"+copies);
	request.setAttribute("copies",copies);
	request.setAttribute("status",status);
	%>
	</table>
	<input type="button" value="CheckOut"  onclick="checkSelection()"> 
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
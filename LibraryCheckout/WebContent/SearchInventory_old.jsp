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
<BR><B>****Library Checkout System****</B>
<BR>
<BR>
Search 
<form action="" method="post">
<input type="text" name="searchstring">
<input type="submit" value="Search">
</form>
<b style="text-decoration: underline; height: 29px; width: 123px" onclick="showMore()">  Advance Search</b>
<BR> 
<div id="hidden div" hidden=true>
<form action="" id="advanS" method="post">
Title:
<input type="text" name="ast" value="" maxlength="100" style="width:120px;" placeholder="Enter Title" />
<br />
Author:
<input type="text" name="asaut" value="" maxlength="100" style="width:120px;" placeholder="Enter Author" />
<br/>
Subject:
<input type="text" name="assub" value="" maxlength="100" style="width:120px;" placeholder="Enter Subject" />
<br/>
<input type="submit" value="Submit" />
</form></div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Library Checkout System</title>
<script>
function chkfieldVal()
{
	var aSTitle=document.getElementById("ast_id").value;
	
	var aSAuthor=document.getElementById("asaut_id").value;
	
	var aSSubject=document.getElementById("assub_id").value;
	
	if(aSTitle=="" && aSAuthor=="" && aSSubject=="")
	{
		alert("Enter the atleast one field for Advance Query Search");
		return false;
	}
	else{
		
		
		document.getElementById("advSrchF").submit();
	}
	
}


</script>
</head>
<body>
<B>Advance Search</b>
<BR>
<BR>
<form id="advSrchF" action="./AdvanceSearchDisplay.jsp"  method="post">
<table align="center" border = "1" cellspacing="5">
         <tr>
         <th colspan="2">Enter Search Parameters</th>   
         </tr>
         <tr>
         <tr>
            <td align="right">  Title:</td>
            <td><input type="text" name="ast" id="ast_id" ></td>
         </tr>
         <tr>
            <td align="right">  Author:</td>
            <td><input type="text" name="asaut" id="asaut_id"></td>
         </tr>
         <tr>
            <td align="right">  Subject:</td>
            <td><input type="text" name="assub" id="assub_id"></td>
         </tr>
         <tr>
            <td colspan="2" align="center" ><input type="button" value="Search" onclick="chkfieldVal()"></td>   
         </tr>
</table>



</form>



</body>
</html>
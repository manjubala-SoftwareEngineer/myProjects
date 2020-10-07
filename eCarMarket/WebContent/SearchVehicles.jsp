<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.auto.bo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
         table {
         
            border: 1px solid black;
            width: 80%;
         }
      </style>
      
<title>AutoMart</title>
</head>
<body bgcolor=lightgrey>

<p align=right>
<a id="hpsearch" href="./index.html">Home Page</a>
</p>


<BR>

<%
Vehicle veh = new Vehicle();
Vehicle_Info[] vInfo_display;


vInfo_display = veh.getSavedVehicles();

if (vInfo_display !=null )
{
	
	int len = vInfo_display.length;

	if (len!=0)
	{
	%>
	<BR>
	<h2 id="myHeader" style="text-align:center;color:blue">List of All Saved Vehicles</h2>
	
	<table border="1" align=center>
			<tr>
		<td><b>Vehicle Make</b></td>
		<td><b>Vehicle Model</b></td>
		<td><b>Vehicle Year</b></td>
		<td><b>Vehicle KMs</b></td>
		<td><b>Vehicle Features</b></td>
		<td><b>Vehicle Ownership</b></td>
		<td><b>Seller Name</b></td>
		<td><b>Address</b></td>
		<td><b>PhoneNo</b></td>
		<td><b>Email Address</b></td>
		
		</tr>
	
	<% 
	
	for (int i=0; i<len; i++)
	{
		%>
		<tr>
	    <td><%=vInfo_display[i].getVMake() %></td>
		<td><%=vInfo_display[i].getV_model() %></td>
		<td><%=vInfo_display[i].getVYear()%></td>
		<td><%=vInfo_display[i].getVKM()%></td>
		<td><%=vInfo_display[i].getVFeatures()%></td>
		<td><%=vInfo_display[i].getVOwnership()%></td>
		<td><%=vInfo_display[i].getSellerName()%></td>
		<td><%=vInfo_display[i].getAddress()%> <%=vInfo_display[i].getCity() %> <%=vInfo_display[i].getProvince() %> <%=vInfo_display[i].getPostalCode() %></td>
		<td><%=vInfo_display[i].getPhone() %></td>
		<td><%=vInfo_display[i].getEMail()%></td>	
		
		</tr>
		<% 
	}
	
	%>
</table>


	<%
	}
	else
	{
	%>
	<h4 align=center><div style="color:brown">No Data Found.</div></h4>
	<%
	}
}
else
{
%>
<h4 align=center><div style="color:brown">No Data Found.</div></h4>
<%
}
	%>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.auto.bo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
         table {
         
            border: 1px solid black;
            
            
         }
      </style>
      
<title>AutoMart</title>
</head>
<body bgcolor=lightgrey>

<p align=right>
<a id="homepagesuccess" href="./index.html">Home Page</a>
</p>
<h2 id="succespgVIF"  align=center><div style="color:blue">
Vehicle Information Form</h2></Div>
<BR>

<%
Vehicle veh = new Vehicle();
Vehicle_Info vInfo = new Vehicle_Info();
boolean success = false;

String s_name=request.getParameter("sname");
String s_add =request.getParameter("add");
String s_city=request.getParameter("city");
String s_province=request.getParameter("state");
String s_pc=request.getParameter("postalcode");
String s_phone=request.getParameter("phone");
String s_email=request.getParameter("email");
String v_make=request.getParameter("make");
String v_model=request.getParameter("model");
String v_year=request.getParameter("year");
String v_km=request.getParameter("km");
String features[] = request.getParameterValues("features");
String v_features="";
for (int i=0;i<features.length;i++)
{
	if (i==0)
	{
		v_features = features[i];
		System.out.println(v_features);
	}
	else
	{
		v_features = v_features+","+features[i];
		System.out.println(v_features);
	}
}


String v_ownership=request.getParameter("ownership");

vInfo.setSellerName(s_name);
vInfo.setAddress(s_add);
vInfo.setCity(s_city);
vInfo.setProvince(s_province);
vInfo.setPostalCode(s_pc);
vInfo.setPhone(s_phone);
vInfo.setEMail(s_email);
vInfo.setVMake(v_make);
vInfo.setV_model(v_model);
vInfo.setVYear(v_year);
vInfo.setVKM(v_km);
vInfo.setVFeatures(v_features);
vInfo.setVOwnership(v_ownership);

success = veh.createVehicleInfo(vInfo);

if (success)
{
%>
<h4 align=center id="successmsg"><%=s_name %>, your Vehicle Information submitted successfully with following details:</h2>

<br>

<table align=center>
<tr><td colspan=2><b>Personal Information</b></td><td>&nbsp;&nbsp;</td><td colspan="2" ><b>Vehicle Information</b></td></tr>
<tr><td>Name:</td><td><%=s_name %></td><td>&nbsp;&nbsp;</td><td>Make:</td><td><%=v_make %></td></tr>
<tr><td>Address:</td><td><%=s_add %></td><td>&nbsp;&nbsp;</td><td>Model:</td><td><%=v_model %></td></tr>
<tr><td>City:</td><td><%= s_city%></td><td>&nbsp;&nbsp;</td><td>Year:</td><td><%=v_year %></td></tr>
<tr><td>Province:</td><td><%=s_province %></td><td>&nbsp;&nbsp;</td><td>KMs:</td><td><%= v_km%></td></tr>
<tr><td>Postal Code:</td><td><%=s_pc %></td><td>&nbsp;&nbsp;</td><td>Features:</td><td><%=v_features %></td></tr>
<tr><td>Phone No:</td><td><%=s_phone %></td><td>&nbsp;&nbsp;</td><td>Ownership:</td><td><%=v_ownership %></td></tr>
<tr><td>Email Id:</td><td><%=s_email %></td><td>&nbsp;&nbsp;</td><td colspan="2" align=right><a id="jdpower" href="https://www.jdpower.com/cars/<%=v_make%>/<%=v_model%>/<%=v_year%>">Click here for JDPower.com</a></td></tr>
</table>

<%
}
else
{
%>
<h4 align=center>Error in submitting Vehicle Info. Please <a id="vehicleinfo" href="./Vehicle_Info_Form.jsp">Enter Vehicle Info</a> again.</h4>


<%
}
%>

</body>
</html>
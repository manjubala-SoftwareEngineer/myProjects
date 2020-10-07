<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
  table {
         
  border: 1px solid black;
         }
         
         
         
         
 .req
{
    color: red;
}
      </style>
      
      
      
      
<title>AutoMart</title>


</head>

<body bgcolor=lightgrey>

<p align=right>
<a id="hpregfrm" href="./index.html">Home Page</a>
</p>

<h2 align=center><div style="color:blue">Vehicle Information Form</h2></div>
<form action="./Vehicle_Form_Success.jsp" method="post" id="form">
<table  align=center border=1>
<caption><h4>Please fill this Form to Submit the Vehicle Information</h4></caption>

         <tr>
            <td colspan=2 style="background-color:lightgrey;" align=center><b>Personal Information</b></td>
         </tr>
        
         <tr>
            <td >Seller Name:<span class="req">*</span></td>
            <td style="width: 246px; "><input type="text" name="sname" id="sname"  maxlength="50" required pattern="[A-Za-z\s]+" title="Fill Seller Name using aplhabets A-Z or a-z" style="width: 253px;background-color: ghostwhite; "></td>
         </tr>
         <tr>
            <td >Address:<span class="req">*</span></td>
            <td ><input type="text" name="add" id="add" maxlength="50" required style="width: 253px;background-color: ghostwhite; " "></td>   
         </tr>
         <tr>
            <td >City:<span class="req">*</span></td>
            <td ><input type="text" name="city" id="city" maxlength="30" required pattern="[A-Za-z\s]+" title="City Name using aplhabets A-Z or a-z" style="width: 253px;background-color: ghostwhite; "></td>
         </tr>
         <tr>
            <td >Province:<span class="req">*</span></td>
            <td><select style="width: 253px;background-color: ghostwhite; " " id="state" name="state">
				<option value="AB">Alberta</option>
				<option value="BC">British Columbia</option>
				<option value="MB">Manitoba</option>
				<option value="NB">New Brunswick</option>
				<option value="NL">Newfoundland and Labrador</option>
				<option value="NS">Nova Scotia</option>
				<option value="ON">Ontario</option>
				<option value="PE">Prince Edward Island</option>
				<option value="QC">Quebec</option>
				<option value="SK">Saskatchewan</option>
				<option value="NT">Northwest Territories</option>
				<option value="NU">Nunavut</option>
				<option value="YT">Yukon</option>            
				</select></td>
		</tr>
         <tr>
            <td >PostalCode:<span class="req">*</span></td>
            <td ><input type="text" name="postalcode" id="postalcode" required pattern="[A-Za-z][0-9][A-Za-z] [0-9][A-Za-z][0-9]" placeholder="A0A 0A0" title="Format: A0A 0A0" style="width: 253px;background-color: ghostwhite; " "></td>
         </tr>
         <tr>
            <td >Phone Number:<span class="req">*</span></td>
            <td ><input type="tel" id="phone" name="phone" required pattern="\d{3}[\-]\d{3}[\-]\d{4}"  title="Format for Phone Number: 123-456-7890" placeholder="000-000-0000" style="width: 253px;background-color: ghostwhite; ">


</td>
         </tr>
         <tr>
            <td >Email Address:<span class="req">*</span></td>
            <td > <input type="text" id="email" name="email"  required  pattern="\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$"  style="width: 253px;background-color: ghostwhite; "> </td>
         </tr>
         <tr>
            <td colspan=2 style="background-color:lightgrey;" align=center><b>Vehicle Information</b></td>
         </tr>
         <tr>
            <td >Vehicle Make:<span class="req">*</span></td>
            <td >  <input type="text" id="make" name="make"  required style="width: 253px; ">
             
            </td>
         </tr>
         <tr>
            <td >Vehicle Model:<span class="req">*</span></td>
            <td ><input type="text" id="model" name="model" required style="width: 253px;background-color: ghostwhite; "></td>
         </tr>
         <tr>
            <td >Vehicle Year:<span class="req">*</span></td>
            <td ><input type="text" name="year" id="year" required pattern="[0-9]{4}"  placeholder="9999" title="use digits in 9999 format  " style="width: 253px;background-color: ghostwhite; "></td>
         </tr>
         <tr>
            <td >Kilometers:<span class="req">*</span></td>
            <td ><input type="text" name="km" id="km" required pattern="[0-9]+"  title="Use digits only" style="width: 253px;background-color: ghostwhite; "></td>
         </tr>
         <tr>
            <td >Features:<span class="req">*</span></td>
            <td ><input type="checkbox" name="features" value="Air Conditioner" id="ac">Air Conditioner
            <input type="checkbox" name="features" value="Backup Camera" id="bc">Backup Camera
            <BR><input type="checkbox" name="features" value="Heated Seats" id="hs">Heated Seats
            &nbsp;&nbsp;&nbsp;<input type="checkbox" name="features" value="TPMS" id="tpms">TPMS
            </td>
         </tr>
         <tr>
            <td >Ownership:<span class="req">*</span></td>
            <td ><input type="radio" name="ownership" value="No Previous Owner (new)" id="one">No Previous Owner (new)
            <BR><input type="radio" name="ownership" value="One Previous Owner" id="two">One Previous Owner
            <BR><input type="radio" name="ownership" value="More than One Previous Owner" id="more">More than One Previous Owner
            </td>
         </tr>
         <tr>
        <td  align=center colspan=2 ><span class="req">*required fields</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="submitbtn" type="submit" value="Submit">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="Cancel">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>   
         </tr>
      </table>


</form>
</body>
</html>
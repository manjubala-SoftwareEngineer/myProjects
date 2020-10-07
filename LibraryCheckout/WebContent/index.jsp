<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.library.bo.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Library Checkout System</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
}

body {
  font-family: Arial, Helvetica, sans-serif;
  height: 100%;
  width: 100%;
}

/* Style the header */
header {
 // background-color: #666;
  background-color: #4b86b4   ; 
  padding: 20px;
  text-align: center;
  font-size: 20px;
  color: white;
}

/* Create two columns/boxes that floats next to each other */
nav {
  float: left;
  width: 30%;
  height: 430px; 
  background: #adcbe3    ;
 // background: #ccc;
  padding: 20px;
 
}

/* Style the list inside the menu */
nav ul {
  list-style-type: none;
  padding: 0;
  color:purple;
}

article {
  float: left;
  padding: 20px;
  width: 70%;
  //background-color: #f1f1f1;
  background-color: #e7eff6 ;
  height: 430px;
}

/* Clear floats after the columns */
section:after {
  content: "";
  display: table;
  clear: both;
}

/* Style the footer */
footer {
 // background-color: #777;
 background-color: #63ace5;
  padding: 7px;
  text-align: center;
  color: white;
}

/* Responsive layout - makes the two columns/boxes stack on top of each other instead of next to each other, on small screens */
@media (max-width: 600px) {
  nav, article {
    width: 100%;
    height: 100%;
  }
}
</style>
</head>
<body>
<header>
  <h2>Library Checkout System</h2>
</header>

<section>
  <nav>
  <iframe height="100%" width="100%" id="left" name="left" src="./LeftNavigation.jsp"></iframe>
  </nav>
  
  <article>
  <iframe height="100%" width="100%" name="main" srcdoc="<BR><BR><p><b><center>Welcome to Library System !! Please login to Continue!<center></B></p>" src="./Welcome.jsp"></iframe>
  </article>
</section>

<footer>
  <p>ComIT-Automation Testing in Java</p>
</footer>

</body>
</html>

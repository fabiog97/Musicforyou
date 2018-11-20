<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.music.model.ProductBean"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Musicforyou</title>
<link rel="shortcut icon" href="images/logo1.png" >
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="Fabio Grauso-Antonio Salzano">
<link rel="stylesheet" href="responsive.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">	
	
</head>
<body>


<header class="top">
	
		<a href="ProductView.jsp"><img class="logo" src="images/logo2.png"></a>
	
</header>

<script>
function myFunction() {
    var x = document.getElementById("myTopnav");
    if (x.className === "topnav") {
        x.className += " responsive";
    } else {
        x.className = "topnav";
    }
}
</script>

		<div class="topnav" id="myTopnav">
  			<a href="AboutUs.jsp"  class="active">About us</a>
  			<a href="ProductView.jsp">Home</a>
  			<a href="Contatti.jsp">Contact</a>
  			<a href="ProductControl?action=view_cart">Shopping Cart</a>
  			<a href="javascript:void(0);" class="icon" onclick="myFunction()">
    			<i class="fa fa-bars"></i>
  			</a>
			</div>
		
	




	<div class="top_aboutus"> 
	</div>

<h2 id="about-us"></h2>


<div align="center">
<div class="story">
<h2 id="about-us">Long story short</h2>
<p>Founded in 2012 the original Music Store owned by Fabio Grauso and Antonio Salzano,
located in Avellino City Italy,  was a hub of activity for the tri state area
musician’s community for many years.  Musicians of all ages and influence came
to the store to purchase equipment, browse inventory and to speak with others of
the same mind set. Bruce specialized in providing lessons, sales and repair of all
musical equipment, along with promoting and helping local bands to network amongst themselves.
The original Music Store successfully operated for 8 years until it finally closed in 1995.
Bruce has continued to play music actively in the community since then.
We are pleased to announce the opening of the second generation of “The Music Store”
located at 4345 Highway 95 in Fort Mohave. Owned and operated by Bruce and his wife Sharyn.
We hope to continue the traditions set in place with the original Music Store,
supporting the musical community of the tri state area for years to come.
For those of you who visited the original Music Store, stop by and see Bruce,
he will be there daily to help you with your musical needs.</p>

<p><b>We welcome you.</b></p>
</div>


<div class="whoweare">
<h2 id="about-us">Who we are</h2>
<p><b>Fabio Grauso</b> - Administrator</p>


<p><b>Antonio Salzano</b> - Security Manager</p>


</div>		
		
		
	

<footer class="bottom">
	
	&copy; All rights reserved 2018 - Musicforyou<br>
     
</footer>

</body>
</html>
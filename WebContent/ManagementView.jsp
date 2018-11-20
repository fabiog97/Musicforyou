<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.music.model.ProductBean, it.music.model.UtenteBean, it.music.model.Cart" %>
    
    
    

    
<!DOCTYPE html>
<html>
<style>


table,th,td {
   

   
  border : 1px solid black;
  border-collapse: collapse;
  margin: 20px;
}

tr:nth-child(even){background-color: #ddd;}

tr:hover {background-color: #1ea9e0;}
th,td {
  padding: 6px;
}
</style>
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
	
	<a href="ProductView.jsp"><img class="logo"  src="images/logo2.png"></a>
	
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
			<a href="ProductControl?action=view_cart" class="active">Shopping Cart</a>
			<a href="ProductView.jsp">Home</a>
			<a href="AboutUs.jsp">About us</a>
			<a href="Contatti.jsp">Contact</a>
  			<a href="javascript:void(0);" class="icon" onclick="myFunction()">
    			<i class="fa fa-bars"></i>
  			</a>
</div>

	
	
	<div align="center">
		
		
		<h2>Management Area</h2>
		
		
		<p>Insert Product</p>

		<form action="ProductControl" method="post" name="InsertProduct" id="registration_form" onsubmit="return validateForm()" enctype="multipart/form-data">

					<input type="hidden" name="action" value="insert">
					
					<div class="tableRow">
					<p>Title:</p><p><input type="text" name="titolo"></p>
					</div>
					
					<div class="tableRow">
					<p>Price:</p><p><input type="text" name="prezzo"></p>
					</div>
					
					<div class="tableRow">
					<p>Artist:</p><p><input type="text" name="artista"></p>
					</div>
					
					<div class="tableRow">
					<p>Cover:</p><p><input type="file" name="cover" accept="image/*" value=""></p>
					</div>
					
					<div class="tableRow">
					<p>Description:</p><p><input type="text" name="descrizione" value=""></p>
					</div>
					
					<div class="tableRow">
					<p>Musical genre:</p><p><input type="text" name="genere" value=""></p>
					</div>
					
					
	
		<script>
			function validateForm() {
			    var titolo = document.forms["InsertProduct"]["titolo"].value;
			    var prezzo = document.forms["InsertProduct"]["prezzo"].value;
			    var artista = document.forms["InsertProduct"]["artista"].value;
			    var cover = document.forms["InsertProduct"]["cover"].value;
			    var descrizione = document.forms["InsertProduct"]["descrizione"].value;
			    var genere = document.forms["InsertProduct"]["genere"].value;
			   
			   
			    if (titolo == "") {
			        alert("Title must be filled out");
			        return false;
			    }
			    
			    if (prezzo == "") {
			        alert("Price must be filled out");
			        return false;
			    }
			    
			    if (artista == "") {
			        alert("Artist  must be filled out");
			        return false;
			    }
			    
			    if (cover == "") {
			        alert("Cover Path must be filled out");
			        return false;
			    }
			    
			    if (descrizione == "") {
			        alert("Description must be filled out");
			        return false;
			    }
			    
			    if (genere == "") {
			        alert("Musical Genre must be filled out");
			        return false;
			    }
			}
			    
		</script>
			
			<div class="tableRow">
			<p></p>
			<p>
				<input type="submit" value="Insert">
				<input type="reset" value="Reset">
			</p>
		</div>
		</form>
		<h2>Catalog</h2>

		<button id="cart_button" type="button" onclick="loadDoc()">Get cd catalog</button>
		<br><br>
		<table id="demo"></table>
		
		</div>
			


<script>
function loadDoc() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      myFunction1(this);
    }
  };
  xhttp.open("GET", "cd_catalog.xml", true);
  xhttp.send();
}
function myFunction1(xml) {
  var i;
  var xmlDoc = xml.responseXML;
  var table="<tr><th>Artist</th><th>Title</th><th>Price</th><th>Description</th><th>Musical genre</th></tr>";
  var x = xmlDoc.getElementsByTagName("CD");
  for (i = 0; i <x.length; i++) { 
    table += "<tr><td>" +
    x[i].getElementsByTagName("ARTIST")[0].childNodes[0].nodeValue +
    "</td><td>" +
    x[i].getElementsByTagName("TITLE")[0].childNodes[0].nodeValue +
    "</td><td>"+
    x[i].getElementsByTagName("PRICE")[0].childNodes[0].nodeValue +
    " &euro;</td><td>"+
    x[i].getElementsByTagName("DESCRIPTION")[0].childNodes[0].nodeValue +
    "</td><td>"+
    x[i].getElementsByTagName("GENERE")[0].childNodes[0].nodeValue +
    "</td></tr>";
    
  }
  document.getElementById("demo").innerHTML = table;
}
</script>
			
			
<footer class="bottom">
	&copy; All rights reserved 2018 - Musicforyou<br> 
</footer>

</body>
</html>
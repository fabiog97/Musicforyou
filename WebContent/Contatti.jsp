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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>


<script>
	function validateForm() {
		 $( "#result" ).html( "" );
	    var name = document.forms["Registration"]["contact_name"].value;
	    var email = document.forms["Registration"]["contact_email"].value;
	    var comment = document.forms["Registration"]["contact_message"].value;
	    var mailformat = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
		
	    if(!email.match(mailformat)){
			alert("You have entered an invalid email address");
			uemail.focus();
			return false;
		}
	    
	    if (name == "") {
	        alert("Name must be filled out");
	        return false;
	    }
	    
	    if (email == "") {
	        alert("Email must be filled out");
	        return false;
	    }
	    
	    if (comment == "") {
	        alert("Comment Name must be filled out");
	        return false;
	    }
	   
	    $( "#result" ).html( "loading..." );
	    
	    var req = '/Musicforyou1/ServletResponse?name='+name+'&mail='+email+'&comment='+comment;
	    $.get(req, function( risposta ) {
	    	  $( "#result" ).html( risposta );
	    	});
	    
		return true;
	}
</script>

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
			<a href="Contatti.jsp"  class="active">Contact</a>
  			<a href="ProductView.jsp">Home</a>
 			<a href="AboutUs.jsp">About us</a>
  			
  			<a href="ProductControl?action=view_cart">Shopping Cart</a>
  				
  			<a href="javascript:void(0);" class="icon" onclick="myFunction()">
    			<i class="fa fa-bars"></i>
  			</a>
  		
			</div>
		
	






	<div class="top_contact"> 
	</div>
	
	<div align="center">
	
		<div class="left-column" id="google-maps">
		<h2 id="call-us"> Where we are <i class="fa fa-map-marker"></i></h2>
			<iframe class="iframe" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3021.6959441473136!2d14.789829215140944!3d40.76871177932589!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x133bc5c7456b88bd%3A0x80bab96149d2993d!2sUniversit%C3%A0+degli+Studi+di+Salerno!5e0!3m2!1sit!2sit!4v1528372305390" width="250" height="250" frameborder="0" style="border:0" allowfullscreen></iframe>
		</div>
		
		<div class="right-column">
		<hr>
		<h2 id="call-us"> Give us a call  <i class="fa fa-phone-square"></i></h2>
   		
   		
   		<p class="number">General information: <strong>(361) 594-3852  <i class="fa fa-phone"></i></strong> </p>
        <p class="number">Order's information: <strong>(361) 594-4294  <i class="fa fa-phone"></i></strong></p>
		<p class="number">Notifications: <strong>(361) 594-3852  <i class="fa fa-phone"></i></strong></p>

		
		<hr>	
		<h2 id="contact-us">Ask us a question  <i class="fa fa-question-circle"></i></h2>
			

      	
		
		
        <form id="contact_form"  name="Registration" accept-charset="UTF-8" method="post" >
            <input id="formname" type="text" class="column1" placeholder="Name" name="contact_name">
            <input id="formemail" type="email" class="column2" placeholder="Email Address" name="contact_email">
            <br>
            <textarea id="formcomment" placeholder="Comments" name="contact_message"></textarea> 
            <br>
          
			<br>
			<input id="timeout" name="timeout" type="hidden" value="5000" min=0>
			<input id="formbutton" type="button"  value="SEND" onclick="return validateForm()">
			<br>
			<div id="wait"></div>
		 
		  	<div id="result"></div>
	 
		 </form >    
		 
	 
	  </div>
	</div>

	
<footer class="bottom">
	
	&copy; All rights reserved 2018 - Musicforyou<br>
     
</footer>

</body>
</html>
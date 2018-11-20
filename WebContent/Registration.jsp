<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.music.model.ProductBean, it.music.model.UtenteBean"%>






<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Musicforyou</title>
<link rel="shortcut icon" href="images/musicforyou_logo.png">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="Fabio Grauso-Antonio Salzano">
<link rel="stylesheet" href="responsive.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">	
	
</head>
<body>


<header class="top">
	
	<img class="logo" src="images/logo2.png" >
	
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
			<a href="ProductControl?action=view_cart">Shopping Cart</a>
			<a href="Contatti.jsp"  class="active">Contact</a>
  			<a href="ProductView.jsp">Home</a>
 			<a href="AboutUs.jsp">About us</a>	
  			<a href="javascript:void(0);" class="icon" onclick="myFunction()">
    			<i class="fa fa-bars"></i>
  			</a>
  		
</div>

<div align="center">
<h2>Create your account</h2>


	<%
	
	UtenteBean account_doppione = (UtenteBean) request.getAttribute("account_doppione");

	if(account_doppione==null){
	%>
	<form name="Registration" id="registration_form" action="ProductControl?action=registrati" method="post" onsubmit="return validateForm()">
		
				<div class="tableRow">
				<p>Username:</p><p><input type="text" name="username" value=""></p>
				</div>
				
				<div class="tableRow">
				<p>Password:</p><p><input type="password" name="password" value=""></p>
				</div>
				
				<div class="tableRow">
				<p>First Name:</p><p><input type="text" name="nome" value=""></p>
				</div>
				
				<div class="tableRow">
				<p>Last Name:</p><p><input type="text" name="cognome" value=""></p>
				</div>
				
				<div class="tableRow">
				<p>Address:</p><p> <input type="text" name="indirizzo" value=""></p>
				</div>
				
				<div class="tableRow">
				<p>City:</p><p> <input type="text" name="city" value=""></p>
				</div>
				
				<div class="tableRow">
				<p>State:</p>
				<p>

				<select name ="nazione">
					<option value="Italia">Italy</option>
					<option value="Spagna">Spain</option>
					<option value="Germania">Germany</option>
					<option value="Regno Unito">UK</option>
					<option value="Svizzera">Switzerland</option>
					<option value="Olanda">Holland</option>
				</select>
				</p>
				</div>
				
				<div class="tableRow">
				<p>Zip:</p><p><input type="text" name="cap" value=""></p>
				</div>
				
				<div class="tableRow">
				<p>Phone:</p><p> <input type="tel" name="telefono" value=""></p>
				</div>
				
				<div class="tableRow">
				<p>CF:</p><p><input type="text" name="cf" value=""></p>
				</div>

		
		
		<div class="tableRow">
		<p></p>
		<p>
			<input type="submit" value="Register now">
			&nbsp;
			<input type="reset" value="Reset">
		</p>
		</div>	
		</form>
		<p id="condition_agree">By creating an account you agree to <b>Musicforyou's</b> Conditions of Use.<br>
	 Please see our Privacy Notice, our Cookies Notice and our Internet-Based Ads Notice.</p>

	
	
	
	<%
		}
		else
		{
			if(account_doppione.getUsername().equals("")) 
			{
			
	%>			
			<h2>Invalid username</h2>
			<p>We find an account with that username, please use another username</p>
	
	
			<form name="Registration" id="registration_form" action="ProductControl?action=registrati" method="post" onsubmit="return validateForm()">
		
				<div class="tableRow">
				<p>Username:</p><p><input type="text" name="username" value=""></p>
				</div>
				
				<div class="tableRow">
				<p>Password:</p><p><input type="password" name="password" value=""></p>
				</div>
				
				<div class="tableRow">
				<p>First Name:</p><p><input type="text" name="nome" value=""></p>
				</div>
				
				<div class="tableRow">
				<p>Last Name:</p><p><input type="text" name="cognome" value=""></p>
				</div>
				
				<div class="tableRow">
				<p>Address:</p><p> <input type="text" name="indirizzo" value=""></p>
				</div>
				
				<div class="tableRow">
				<p>City:</p><p> <input type="text" name="city" value=""></p>
				</div>
				
				<div class="tableRow">
				<p>State:</p>
				<p>

				<select name ="nazione">
					<option value="Italia">Italy</option>
					<option value="Spagna">Spain</option>
					<option value="Germania">Germany</option>
					<option value="Regno Unito">UK</option>
					<option value="Svizzera">Switzerland</option>
					<option value="Olanda">Holland</option>
				</select>
				</p>
				</div>
				
				<div class="tableRow">
				<p>Zip:</p><p><input type="text" name="cap" value=""></p>
				</div>
				
				<div class="tableRow">
				<p>Phone:</p><p> <input type="tel" name="telefono" value=""></p>
				</div>
				
				<div class="tableRow">
				<p>CF:</p><p><input type="text" name="cf" value=""></p>
				</div>

		
		
		<div class="tableRow">
		<p></p>
		<p>
			<input type="submit" value="Register now">
			&nbsp;
			<input type="reset" value="Reset">
		</p>
		</div>	
		
		</form>
		<p id="condition_agree">By creating an account you agree to <b>Musicforyou's</b> Conditions of Use.<br>
	 Please see our Privacy Notice, our Cookies Notice and our Internet-Based Ads Notice.</p>
		
	
	
	
	
	
	<% 
			}	
			else 
			{
				UtenteBean account = (UtenteBean) request.getSession().getAttribute("account");
				
				if (account==null){
					request.getSession().setAttribute("account", account_doppione);
				}
	%>			
	
				<h2>Succesfull registration</h2>
				<p>Welcome <b><%=account_doppione.getUsername()%></b></p>
				<p id="start_registration">Start immediately to fill your cart <a href="ProductView.jsp">here</a></p>
	<%	
			}
		}	
	%>
</div>

		
		<script>
			function validateForm() {
			    var username = document.forms["Registration"]["username"].value;
			    var password = document.forms["Registration"]["password"].value;
			    var nome = document.forms["Registration"]["nome"].value;
			    var cognome = document.forms["Registration"]["cognome"].value;
			    var indirizzo = document.forms["Registration"]["indirizzo"].value;
			    var city = document.forms["Registration"]["city"].value;
			    var cap = document.forms["Registration"]["cap"].value;
			    var telefono = document.forms["Registration"]["telefono"].value;
			    var cf = document.forms["Registration"]["cf"].value;
			    
			   
			   
			    if (username == "") {
			        alert("Username must be filled out");
			        return false;
			    }
			    
			    if (password == "") {
			        alert("Password must be filled out");
			        return false;
			    }
			    
			    if (nome == "") {
			        alert("First Name  must be filled out");
			        return false;
			    }
			    
			    if (cognome == "") {
			        alert("Last Name  must be filled out");
			        return false;
			    }
			    
			    if (indirizzo == "") {
			        alert("Address  must be filled out");
			        return false;
			    }
			    
			    if (city == "") {
			        alert("City Code  must be filled out");
			        return false;
			    }
			    
			    if ((isNaN(cap)) || cap == "") {
			        alert("ZIP must be filled out");
			        return false;
			    }
			    
			    if ((isNaN(telefono)) ||telefono == "") {
			        alert("Phone Code  must be filled out");
			        return false;
			    }
			    
			    if (cf == "") {
			        alert("CF must be filled out");
			        return false;
			    }
			}
			    
		</script>
	

<footer class="bottom">
	
	&copy; All rights reserved 2018 - Musicforyou<br>
     
</footer>

</body>
</html>
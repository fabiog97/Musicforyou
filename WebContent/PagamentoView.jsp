<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.music.model.ProductBean, it.music.model.UtenteBean, it.music.model.Cart" %>
    
<%
	
	UtenteBean account = (UtenteBean) request.getSession().getAttribute("account");
	
	
%>
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
	
	<a href="ProductView.jsp"><img  class="logo" src="images/logo2.png" ></a>
	
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
			<a href="ProductControl?action=view_cart"   class="active">Shopping Cart</a>
			
  			<a href="ProductView.jsp">Home</a>
 			<a href="AboutUs.jsp">About us</a>
  			<a href="Contatti.jsp">Contact</a>
  			<a href="javascript:void(0);" class="icon" onclick="myFunction()">
    			<i class="fa fa-bars"></i>
  			</a>
  		
			</div>
	
	
	
	
	
	<%
		Cart<ProductBean> cart = (Cart<ProductBean>) request.getSession().getAttribute("cart");
		if(cart==null){
			System.out.println("Carrello vuoto");
		
		
		
	%>	
		<div align="center">
		
			<h2>Successful Payment</h2>
			<img src="images/payment-successful.png" width="10%">
			<p>Thank you</p>
			
			<a href="ProductView.jsp"><p id="start_registration">Back Home</a></p>
		
		</div>
		
		
	<%
		}
		else{
			
	%>
	<h2>Payment Details</h2>
	<table class="cart">
				<tr>
					<th></th>
					<th>Title</th>
					<th>Artist</th>
					<th>Quantity</th>
					<th>Price</th>
				</tr>
		<%	
			List<ProductBean> prodcart =  cart.getList();
			for(ProductBean beancart: prodcart)
			{
				
		%>
		
				<tr>
					<td><img src="<%= beancart.getCover()%>" width="100px"></td>
					<td><%= beancart.getTitle() %></td>
					<td><%= beancart.getArtist() %></td>
					<td><%= beancart.getQuantity() %></td>
					<td  id="cart_price"><%= beancart.getPrice() %>&euro;</td>
					
				</tr>
		
		<%
			}
		
		%>
		</table>	
		
		
		
		<h2 id="total_price">Total: 
			<% 
				if (request.getSession().getAttribute("total")==null)
				{
			%>
				0 &euro;
			<% 
				}
				else
				{
			%>
			
			<%=request.getSession().getAttribute("total")%>&euro;
			
			 <%
			 	}
			%>
			</h2>
		
		
		
		
		
	<br>
		
		
	
	<div align="center">
		<br>
		<br>
		<br>
		<img src="images/card/visa.png" width="60">
		<img src="images/card/master-card.png" width="60">
		<img src="images/card/discover.png" width="60">
		<img src="images/card/american_express.png" width="60">

		<form action="ProductControl?action=pagamento&username=<%=account.getUsername()%>&price=<%=request.getSession().getAttribute("total")%>"method="post" name="Payment" id="registration_form" onsubmit="return validateForm()">

					<div class="tableRow">
					<p>Card Number:</p><p><input type="text" name="card_number"></p>
					</div>
					
					<div class="tableRow">
					<p>Expiration Date:</p><p><input type="text" name="expiration_date"></p>
					</div>
					
					<div class="tableRow">
					<p>CV code:</p><p><input type="text" name="cv_code"></p>
					</div>
					
					<div class="tableRow">
					<p>Card:</p>
					<p>
	
					<select name ="card">
						<option value="Visa">Visa</option>
						<option value="MasterCard">MasterCard</option>
						<option value="Discover">Discover</option>
						<option value="AmericanExpress">AmericanExpress</option>
					</select>
					</p>
					</div>
					
					
	
		<script>
			function validateForm() {
			    var card_number = document.forms["Payment"]["card_number"].value;
			    var expiration_date = document.forms["Payment"]["expiration_date"].value;
			    var cv_code = document.forms["Payment"]["cv_code"].value;
			   
			   
			    if ((isNaN(card_number))||card_number == "") {
			        alert("Card Number must be filled out");
			        return false;
			    }
			    
			    if ((isNaN(expiration_date))||expiration_date == "") {
			        alert("Expiration Date must be filled out");
			        return false;
			    }
			    
			    if ((isNaN(cv_code))||cv_code == "") {
			        alert("CV Code  must be filled out");
			        return false;
			    }
			}
			    
		</script>
			
			<div class="tableRow">
			<p></p>
			<p>
				<input type="submit" value="Pay">
				&nbsp;
				<input type="reset" value="Reset">
			</p>
		</div>
		</form>
		
		
		</div>
			
		<%
			}
		%>
			
			
<footer class="bottom">
	
	&copy; All rights reserved 2018 - Musicforyou<br>
     
</footer>

</body>
</html>
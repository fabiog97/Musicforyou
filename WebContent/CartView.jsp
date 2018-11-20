<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.music.model.ProductBean, it.music.model.UtenteBean, it.music.model.Cart" %>
    
    
    
<%

	Cart<ProductBean> cart = (Cart<ProductBean>) request.getAttribute("cart");
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
	
		<a href="ProductView.jsp"><img  class="logo" src="images/logo2.png"></a>
	
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
		
	



	<div class="cart">
		<table>
			<tr>
				<td>
					<h2>Cart	</h2>
				</td>
				<td>
					<img src="images/cart.png" width="50px">
				</td>
			</tr>
		</table>
		
		
	
		<%
			List<ProductBean> prodcart =  cart.getList();
	
			if(prodcart.isEmpty())
			{
		%>
				<h3>Sorry, but your Cart is empty !	</h3>
				<p id="cart">
					Your Shopping  Cart lives to serve. Give it purpose--fill it with your favourite CDs. If you already have an account, Sign In to see your Cart. 
					<br>
					Continue shopping on the <b>Musicforyou</b> homepage, learn about the hit's of the moment.
					<br>
					The price of items at Musicforyou are subject to change. The shopping basket is a temporary place to store a list of your items and reflects each item's most recent price.
					<br>
					Do you have a promotional code? We'll ask you to enter your claim code when it's time to pay.
				</p>
				
		<%	
			}
			else
			{
		%>
			<table class="cart">
				<tr>
					<th></th>
					<th>Title</th>
					<th>Artist</th>
					<th>Quantity</th>
					<th>Price</th>
					<th>Action</th>
				</tr>
		<%	
			for(ProductBean beancart: prodcart)
			{
				
		%>
		
				<tr>
					<td><img src="<%= beancart.getCover()%>" width="100px"></td>
					<td><%= beancart.getTitle() %></td>
					<td><%= beancart.getArtist() %></td>
					<td><%= beancart.getQuantity() %></td>
					<td  id="cart_price"><%= beancart.getPrice() %>&euro;</td>
					<td id="cart_action"><a href="ProductControl?action=delCart&id=<%=beancart.getCode()%>&price=<%=beancart.getPrice()%>&quantity=<%=beancart.getQuantity()%>">Delete from Cart</a>
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
		
		<%	
			}
		%>
		
		
		
		
		
	</div>
	<br>
	<div align="center">
	
		<%
			if(account==null)
			{
		%>
	
			<h2>Sign in</h2>
			<script>
				function validateForm() {
				    var username = document.forms["Login"]["username"].value;
				    var password = document.forms["Login"]["password"].value;
				    
				    if (username == "") {
				        alert("Username must be filled out");
				        return false;
				    }
				    
				    if (password == "") {
				        alert("Password must be filled out");
				        return false;
				    }
				}
			</script>
	
			
			<form name="Login" id="login_form" action="Login" method="post" onsubmit="return validateForm()">
			
					<div class="tableRow">
					<p>Username:</p><p><input type="text" name="username" value=""></p>
					</div>
					
					<div class="tableRow">
					<p>Password:</p><p><input type="password" name="password" value=""></p>
					</div>
					
					<div class="tableRow">
						<p></p>
						<p>
							<input type="submit" value="Sign in">
							&nbsp;
							<input type="reset" value="Reset">
						</p>
					</div>	
			</form>
			
			<p  id="start_registration">New Customer? <a href="Registration.jsp">Start here</a></p>
	<%
		}
		else{
	%>
			<h2 id="call-us" ><i class="fa fa-user"></i><br> Welcome <%=account.getUsername()%></h2>
			
			
			
			<% 
				if(account.getUsername().equals("admin"))
				{
			%>
				<form method="get" action="ManagementView.jsp">
		    			<button id="cart_button" type="submit">Management Area</button>
				</form>
			
			
			
			
			<%
				}
			%>
			
			<%
				if(!prodcart.isEmpty() && (!account.getUsername().equals("admin")))
				{
			%>
			
				<form method="get" action="PagamentoView.jsp">
			    		<button id="cart_button" type="submit">Pay</button>
				</form>
				<form action="ProductControl" method="get">
					<input type="hidden" name="action" value="view_orders">
			    		<button id="cart_button" type="submit">Your orders</button>
				</form>
			
			
			<%
				}
			
				if(prodcart.isEmpty() && (!account.getUsername().equals("admin")))
				{
			%>
				<form action="ProductControl" method="get">
					<input type="hidden" name="action" value="view_orders">
			    		<button id="cart_button" type="submit">Your orders</button>
				</form>
			
			<%
				}
			%>
			
			<form action="Logout" method="get" > 
		    	 	<input id="cart_button" type="submit" value="Logout"/>
			</form> 
			
			
			
			
			<%
				}
			%>
	
	</div>
	<footer class="bottom">
		
		&copy; All rights reserved 2018 - Musicforyou<br>
	     
	</footer>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.music.model.ProductBean, it.music.model.UtenteBean" %>
    
    
<%

	
	UtenteBean account = (UtenteBean) request.getSession().getAttribute("account");
	
	Collection<?> orders = (Collection<?>) request.getAttribute("orders");
	

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
			<a href="Contatti.jsp">Contact</a>
  			<a href="ProductView.jsp">Home</a>
 			<a href="AboutUs.jsp">About us</a>
  			
  			
  				
  			<a href="javascript:void(0);" class="icon" onclick="myFunction()">
    			<i class="fa fa-bars"></i>
  			</a>
  		
			</div>

	
	
	<div align="center">
		
		
		<h2>Your orders</h2>
		
		
		
		<%
			if(account!=null)
			{
				if(orders == null){
					
					
				
		%>
				<h2>Your order list is empty</h2>
				
				
		
		<%
				}
				else
				{
		%>
			<div class="box">
					<table>
							
							<tr>
							<%		
									Iterator<?> it = orders.iterator();
									while(it.hasNext())
									{
										System.out.println("TEST");
										ProductBean bean = (ProductBean) it.next();
							
							%>
								<td>
									<table>
										<tr>
											<td><img src="<%= bean.getCover()%>" width="200px"></td>
										</tr>
										
										<tr>
											<td class="title"><b><%= bean.getTitle() %></b></td>
										</tr>
										
										<tr>
											<td class="artist"><%= bean.getArtist()%></td>
										</tr>
										
										<tr>
											<td class="price"><%= bean.getPrice()%> &euro;</td>
										</tr>
										
										<tr>
											<td class="price">Quantity: <%= bean.getQuantity()%></td>
										</tr>
										
									</table>
								</td>
							<%
									}
								}
							%>
							</table>
							<a href="ProductView.jsp"><p id="start_registration">Back Home</a></p>
							</div>
			
			
			
			
					
		<%
			}
		%>
		
		
	</div>
			
			
			
<footer class="bottom">
	
	&copy; All rights reserved 2018 - Musicforyou<br>
     
</footer>

</body>
</html>
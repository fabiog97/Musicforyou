<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,it.music.model.ProductBean,it.music.model.UtenteBean, it.music.model.Cart" %>
    
    
    
<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");
	if(products == null){
		response.sendRedirect("./ProductControl");
		return;
	}
	
	ProductBean product = (ProductBean) request.getAttribute("product");
	
	UtenteBean account = (UtenteBean) request.getSession().getAttribute("account");
	
%>  

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Musicforyou</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<link rel="SHORTCUT ICON" href="images/logo1.png"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="Fabio Grauso-Antonio Salzano">
<link rel="stylesheet" href="responsive.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
    $("button").click(function(){
        $("#tr1").fadeOut();
        $("#tr2").fadeOut("slow");
        $("#title").fadeOut(2000);
        $("#cart_button").fadeOut(3000);
       
    });
});
</script>

</head>
<body>




<header class="top">
	
	<a  href="ProductView.jsp"><img class="logo"  src="images/logo2.png" ></a>
	
	
	
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
  			<a href="ProductView.jsp" class="active">Home</a>
 			<a href="AboutUs.jsp">About us</a>
  			<a href="Contatti.jsp">Contact</a>
  			<a href="ProductControl?action=view_cart">Shopping Cart</a>
  			
  			<a href="javascript:void(0);" class="icon" onclick="myFunction()">
    			<i class="fa fa-bars"></i>
    			</a>
    			<div class="search-container">
			<form action="ProductControl">
				<input type="text" placeholder="Search.." name="search">
				<button type="submit"><i class="fa fa-search"></i></button>
			</form>
  			</div>	
			</div>
		
	




	<div class="top">
	
	
	
	</div>
	
	<div align="center">
		<%
			if(account!=null)
			{
		%>
			<h2 id="call-us" ><i class="fa fa-user"></i>  <%=account.getUsername()%></h2>
			
			<form action="Logout" method="get" > 
				<input id="cart_button" type="submit" value="Logout"/>
			</form>
		<%
			}
		%>
	</div>

	
		
			
			<%
			if(account!=null && account.getUsername().equals("admin"))
			{
			%>
			<h1>Hit</h1>
				<div class="box">
					<table>
							
							<tr>
							<%
								if(products.size() > 0){
										
									Iterator<?> it = products.iterator();
									while(it.hasNext())
									{
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
											<td>
												<a href="ProductControl?action=delProduct&id=<%=bean.getCode()%>">Delete Product</a>
											</td>
										</tr>
									</table>
								</td>
							<%
									}
								}
								else{
								%>
								
								</tr>
								<tr>
									<td colspan = "4">No products available</td>	
								</tr>
							
								<%
									}
								%>
							</table>
							
							</div>
			
			
			
			
			<%
			}
			else
			{
			%>
				
				<% 
				if(!product.getTitle().equals(""))
				{
				%>
					<div class="box_search" align="center">
					<p>Results for <b><%=product.getTitle()%></b><p>
						<table style="text-align:center;">
							<tr>
								<td><a href="ProductControl?action=detail&id=<%=product.getCode()%>"><img src="<%= product.getCover()%>" width="200px"></a></td>
							</tr>
							<tr>
								<td class="title"><b><%= product.getTitle() %></b></td>
							</tr>
							<tr>
								<td class="artist"><%= product.getArtist()%></td>
							</tr>
							<tr>
								<td class="price"><%= product.getPrice()%> &euro;</td>
							</tr>
							<tr>
								<td>
									<a href="ProductControl?action=addCart&id=<%=product.getCode()%>&price=<%=product.getPrice()%>"><img src="images/cart.png" width="30px"></a>
								</td>
							</tr>
						</table>
						<p  id="start_registration"><a href="ProductView.jsp">Back Home</a></p>
					</div>
				<%
				}
				else
				{
				
					if((product.getTitle().equals("")) && (request.getParameter("search")!=null))
						{
					%>
					<div class="box_search" align="center">
						<p>Your search "<b><%=request.getParameter("search")%></b>" did not match any products.<p>
						<p>Try something like using more general terms</p>
						<p>Searches must be performed by <b>name of the musical album</b></p>
						<p  id="start_registration"><a href="ProductView.jsp">Back Home</a></p>
					</div>
					
					
					<% 
					}
						else
						{
					%>		
						<h1>Hit</h1>
						<div class="box">
				
							<table>
							
							<tr>
							<%
								if(products.size() > 0){
										
									Iterator<?> it = products.iterator();
									while(it.hasNext())
									{
										ProductBean bean = (ProductBean) it.next();
							
							%>
								<td>
									
									<table>
										<tr>
											<td><a href="ProductControl?action=detail&id=<%=bean.getCode()%>">
											
											<img src="<%= bean.getCover()%>" width="200px"></a></td>
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
											<td>
											<a href="ProductControl?action=addCart&id=<%=bean.getCode()%>&price=<%=bean.getPrice()%>"><img src="images/cart.png" width="30px"></a>
											</td>
										</tr>
									
									</table>
									
								</td>
							<%
									}
								}
								else{
								%>
								
								</tr>
								<tr>
									<td colspan = "4">No products available</td>	
								</tr>
							
								<%
									}
								%>
							</table>
							
							</div>
					
					
			<%
						}
					} 
			}
			%>
						
			<div align="center">
				<%
					ProductBean product_detail = (ProductBean) request.getAttribute("product_detail");
					if(product_detail!=null)
					{
				%>
					<h2 id="title">Details</h2>
					<table class="details">
						<tr id="tr1">
							<th>Title</th>
							<th>Artist</th>
							<th>Price</th>
							<th>Description</th>
							<th>Musical Genre</th>
						</tr>
						
						<tr id="tr2">
							<td ><%= product_detail.getTitle() %></td>
							<td><%= product_detail.getArtist()%></td>
							<td><%= product_detail.getPrice()%>&euro;</td>
							<td><%= product_detail.getDescription()%></td>
							<td><%= product_detail.getType() %></td>
						</tr>
					</table>
					
					<button id="cart_button">Close details</button>
					
					<br>
			
				<%
					}
				%>
	
	<div class="main">
		<img src="images/logo3.png">
	</div>
	<p id="dis"></p>
	
	
	<script type="text/javascript">
	$("div.main").mouseenter(function(){
		$(this).addClass("change").delay(5000).queue(function(){
			$(this).removeClass("change").dequeue();
		});
		
	});
	</script>
     
			
		
	
	
	
			
<footer class="bottom">
	
	&copy; All rights reserved 2018 - Musicforyou<br>
	
</footer>

</body>
</html>
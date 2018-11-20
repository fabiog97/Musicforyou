package it.music.control;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.ArrayDeque;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import it.music.model.Cart;
import it.music.model.OrdineBean;
import it.music.model.OrdineModel;
import it.music.model.OrdineModelDM;
import it.music.model.ProductBean;
import it.music.model.ProductModel;
import it.music.model.ProductModelDM;
import it.music.model.UtenteBean;
import it.music.model.UtenteModel;
import it.music.model.UtenteModelDM;

@WebServlet("/ProductControl")
@MultipartConfig
public class ProductControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static ProductModel<ProductBean> model = new ProductModelDM();
	
	static UtenteModel<UtenteBean> utente = new UtenteModelDM();
	
	static OrdineModel<OrdineBean> ordine = new OrdineModelDM();
	
	public ProductControl() {
		super();

	}
	
	

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		Cart<ProductBean> cart = (Cart<ProductBean>) request.getSession().getAttribute("cart");
	
		
		UtenteBean account = (UtenteBean) request.getAttribute("account_doppione");
		
		if(account==null) {
			account = new UtenteBean();
			request.setAttribute("account_doppione", account);
		}
		
		
		
		String search = request.getParameter("search");
		
		try {
			request.removeAttribute("product");
			request.setAttribute("product",model.doRetrieveByName(search));
		}catch(SQLException e) 
		{
			System.out.println("ERROR: " + e.getMessage());
			request.setAttribute("error", e.getMessage());
		}
		
		if(cart == null) {
			
			cart = new Cart<ProductBean>();
			request.getSession().setAttribute("cart",cart);
		}
		
		String action = request.getParameter("action");
		
		
	
		
		
		int price = 0;
		
		try {
			if(action != null) 
				{	
					if(action.equalsIgnoreCase("registrati"))//Quando un utente si registra 
					{
						
						
						String username = request.getParameter("username");		
						String password = request.getParameter("password");
						String nome = request.getParameter("nome");
						String cognome = request.getParameter("cognome");
						String indirizzo = request.getParameter("indirizzo");
						String città = request.getParameter("city");
						String nazione = request.getParameter("nazione");
						String cap = request.getParameter("cap");
						String cf = request.getParameter("cf");
						String telefono = request.getParameter("telefono");
				
						
						UtenteBean bean = new UtenteBean();
						bean.setUsername(username);
						bean.setPassword(password);
						bean.setNome(nome);
						bean.setCognome(cognome);
						bean.setIndirizzo(indirizzo);
						bean.setCittà(città);
						bean.setNazione(nazione);
						bean.setCf(cf);
						bean.setCap(cap);
						bean.setTelefono(telefono);
						
						account = utente.doRegistrazione(bean);
						
						
						request.setAttribute("account_doppione", account);
						
						
						
						
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Registration.jsp");
						dispatcher.forward(request, response);
						
						
					}
					if(action.equalsIgnoreCase("delProduct"))
					{
						int id= Integer.parseInt(request.getParameter("id"));
						model.doDelete(id);
					}
					
					if(action.equalsIgnoreCase("detail"))
					{
						int id = Integer.parseInt(request.getParameter("id"));
						request.removeAttribute("product_detail");
						
						request.setAttribute("product_detail",model.doRetrieveByKey(id));
					}
					if (action.equalsIgnoreCase("addCart"))
					{
						
						int id = Integer.parseInt(request.getParameter("id"));
						
						
						if((request.getSession().getAttribute("total"))==null) {
							int total = 0;
							
							price = Integer.parseInt(request.getParameter("price"));
							
							total = total + price;
							
							request.getSession().setAttribute("total", total);
						}
						else {
						
							int total = (int) request.getSession().getAttribute("total");
						
							price = Integer.parseInt(request.getParameter("price"));
						
							total = total + price;
							request.getSession().setAttribute("total", total);
							
						}
						
					
						
						
						int c = 0;
						List<ProductBean> prodcart =  cart.getList();
						System.out.println(prodcart.isEmpty());
						boolean found = false;
						if(!prodcart.isEmpty()) 
						{
							System.out.println(prodcart);
							System.out.println(prodcart.size());
							
							for(ProductBean beancart: prodcart)
							{
								if(beancart.getCode()==id) {
									c = beancart.getQuantity();
									c = c+1;
									
									beancart.setQuantity(c);
									found = true;
									
								}
							}
								
						}
						
						if(!found) {
							cart.addElement(model.doRetrieveByKey(id));
						}
						request.getSession().setAttribute("cart", cart);
						request.setAttribute("cart",cart);

						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartView.jsp");
						dispatcher.forward(request, response);
							
					}
					
					if (action.equalsIgnoreCase("delCart"))
					{	
			
						int id = Integer.parseInt(request.getParameter("id"));
						int c = Integer.parseInt(request.getParameter("quantity"));
						
						
						
						int total = (int) request.getSession().getAttribute("total");
						
							price = Integer.parseInt(request.getParameter("price"));
						
							
							total = total - (price*c);
							request.getSession().setAttribute("total", total);
						
						cart.deleteElement(model.doRetrieveByKey(id));
						
						request.getSession().setAttribute("cart", cart);
						request.setAttribute("cart",cart);

						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartView.jsp");
						dispatcher.forward(request, response);
						
						
					}
					if (action.equalsIgnoreCase("view_cart")) {
					
					request.getSession().setAttribute("cart", cart);
					request.setAttribute("cart",cart);
					
					
					
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartView.jsp");
					dispatcher.forward(request, response);
					}
					if (action.equalsIgnoreCase("view_orders"))
					{
						
						UtenteBean user = (UtenteBean) request.getSession().getAttribute("account");
						
						
						Collection<?> products = ordine.doRetrieveAllOrder(user.getUsername());
						
						Collection<ProductBean> orders = new ArrayDeque<ProductBean>();
						
						
						
						if(products.size() > 0){
							
							Iterator<?> it = products.iterator();
							
							while(it.hasNext())
							{
								
								ProductBean bean = (ProductBean) it.next();
								ProductBean p = model.doRetrieveByKey(bean.getCode());
								p.setQuantity(bean.getQuantity());
								orders.add(p);
								
							}
							
							request.setAttribute("orders", orders);
						}
						else {
							request.setAttribute("orders", null);
						}
						
						
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/OrdersView.jsp");
						dispatcher.forward(request, response);
						
					}
					if (action.equalsIgnoreCase("pagamento"))
					{
						
						String card_number= request.getParameter("card_number");
						String expiration_date= request.getParameter("expiration_date");
						String cv_code= request.getParameter("cv_code");
						String coupon= request.getParameter("coupon");
						String card= request.getParameter("card");
						String username= request.getParameter("username");
						int prezzo= Integer.parseInt(request.getParameter("price"));
						
						OrdineBean bean= new OrdineBean();
						
						bean.setNum_carta(card_number);
						bean.setData_scadenza(expiration_date);
						bean.setCv_codice(cv_code);
						bean.setCodice_coupon(coupon);
						bean.setTipo_carta(card);
						bean.setPrice(prezzo);
						bean.setUtente(username);
						
						
						
						ordine.doBuy(bean, cart);
						
						
						
						request.getSession().removeAttribute("cart");
						request.getSession().removeAttribute("total");
						
		
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/PagamentoView.jsp");
						dispatcher.forward(request, response);
					}
				
			}
			
		}catch(SQLException e) 
		{
			System.out.println("ERROR: " + e.getMessage());
			request.setAttribute("error", e.getMessage());
		}
		
		
		
		
		
		String sort = request.getParameter("sort");
		
		try {
			request.removeAttribute("products");
			request.setAttribute("products",model.doRetrieveAll(sort));
		}catch(SQLException e) 
		{
			System.out.println("ERROR: " + e.getMessage());
			request.setAttribute("error", e.getMessage());
		}
		
	
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductView.jsp");
		dispatcher.forward(request, response);
	
	}


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		if(action.equalsIgnoreCase("insert"))
		{
			
			String titolo= request.getParameter("titolo");
			int prezzo = Integer.parseInt(request.getParameter("prezzo"));
			String artista= request.getParameter("artista");
			//String cover= request.getParameter("cover");
			String descrizione= request.getParameter("descrizione");
			String genere= request.getParameter("genere");
			
			
			Part filePart = request.getPart("cover");
			String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
			
			
			ServletContext sc = request.getSession().getServletContext();
			final String coverpath = sc.getRealPath("images/cover/");
		    System.out.println("Current relative path is: " + coverpath);
		    
		    OutputStream out = null;
		    InputStream filecontent = null;

		    
		    try {
		        out = new FileOutputStream(new File(coverpath + File.separator
		                + fileName));
		        filecontent = filePart.getInputStream();

		        int read = 0;
		        final byte[] bytes = new byte[1024];

		        while ((read = filecontent.read(bytes)) != -1) {
		            out.write(bytes, 0, read);
		        }
		        System.out.println("New file " + fileName + " created at " + coverpath);

		    } catch (FileNotFoundException fne) {
		    	System.out.println("You either did not specify a file to upload or are "
		                + "trying to upload a file to a protected or nonexistent "
		                + "location.");
		    	System.out.println("<br/> ERROR: " + fne.getMessage());

		    } finally {
		        if (out != null) {
		            out.close();
		        }
		        if (filecontent != null) {
		            filecontent.close();
		        }
		    }
		    
		    
		    
			
			System.out.println("name");
			System.out.println(fileName);
			ProductBean bean= new ProductBean();
			bean.setTitle(titolo);
			bean.setPrice(prezzo);
			bean.setArtist(artista);
			bean.setCover("images" + File.separator +"cover"+File.separator+ fileName);
			bean.setDescription(descrizione);
			bean.setType(genere);
			bean.setQuantity(1);
			try {
				model.doSave(bean);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("ERROR: " + e.getMessage());
				request.setAttribute("error", e.getMessage());
			}
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductView.jsp");
			dispatcher.forward(request, response);
			
			
			
		} else {
			doGet(request, response);
		}
		
		
		
		
	}

}

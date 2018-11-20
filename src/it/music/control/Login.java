package it.music.control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.music.model.Cart;
import it.music.model.ProductBean;
import it.music.model.UtenteBean;
import it.music.model.UtenteModel;
import it.music.model.UtenteModelDM;

@WebServlet("/Login")
public class Login extends HttpServlet {
	
	static UtenteModel<UtenteBean> utente = new UtenteModelDM();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			Cart<ProductBean> cart = (Cart<ProductBean>)request.getSession().getAttribute("cart");
		
		
			UtenteBean account = (UtenteBean) request.getSession().getAttribute("account");
			
			if(cart == null) {
				System.out.println("Carrello null");
				cart = new Cart<ProductBean>();
				request.getSession().setAttribute("cart",cart);
			}else {
				System.out.println("Carrello non null");
			}
			
			if(account == null)
			{
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				
				
				account = new UtenteBean();
				
				try {
					account = utente.doLogin(username, password);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	
				
				if (account.getUsername()!=null && account.getPassword()!=null) 
				{
					
					
					account.setUsername(username);
					account.setPassword(password);
					
					request.getSession().setAttribute("account", account);
					
					request.getSession().setAttribute("cart", cart);
					request.setAttribute("cart",cart);
					System.out.println("PASSWORD CORRETTA");
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartView.jsp");
					dispatcher.forward(request, response);
					
					
					
				} 
				else {
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/LoginError.html");
					dispatcher.forward(request, response);
				}
					
			}
			
			
		
	}

	
	
	
	
	
	private static final long serialVersionUID = 1L;

	public Login() {
		super();
	}	

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	

}

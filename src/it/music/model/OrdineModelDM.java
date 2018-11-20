package it.music.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

public class OrdineModelDM implements OrdineModel<OrdineBean>{
	

	int c = 0;
	public void doBuy(OrdineBean ordine, Cart<ProductBean> cart) throws SQLException {
		
		Connection connection = null;
		PreparedStatement preparedStatement1 = null;
		PreparedStatement preparedStatement2 = null;

		
		String insertSQL = "INSERT INTO ordine"
				+ " (prezzo, user_utente, num_carta, data_scadenza,cv_codice, codice_coupon,tipo_carta) VALUES (?, ?, ?, ?, ?, ?, ?)";

		String insertSQL1 = "INSERT INTO ordinazione"
				+ " (id_album,num_ordine,quantity) VALUES (?, ?, ?)";
		
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			
			preparedStatement1 = connection.prepareStatement(insertSQL);
			
			preparedStatement2 = connection.prepareStatement(insertSQL1);
			
			
			
			preparedStatement1.setInt(1, ordine.getPrice());
			preparedStatement1.setString(2, ordine.getUtente());
			preparedStatement1.setString(3, ordine.getNum_carta());
			preparedStatement1.setString(4, ordine.getData_scadenza());
			preparedStatement1.setString(5, ordine.getCv_codice());
			preparedStatement1.setString(6, ordine.getCodice_coupon());
			preparedStatement1.setString(7, ordine.getTipo_carta());
			c = c +1;
			
			
			System.out.println("doBuy: "+ preparedStatement1.toString());
			preparedStatement1.executeUpdate();
			
			List<ProductBean> prodcart =  cart.getList();
		
			for(ProductBean beancart: prodcart)
			{
				
				preparedStatement2.setInt(1, beancart.getCode());
				preparedStatement2.setInt(2,c);
				preparedStatement2.setInt(3,beancart.getQuantity());
				preparedStatement2.executeUpdate();
				System.out.println("doOrdina: "+ preparedStatement2.toString());
				connection.commit();
			}
			
		} finally {
			try {
				if (preparedStatement1 != null)
					preparedStatement1.close();
				if (preparedStatement2 != null)
					preparedStatement2.close();
			
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}	
	}
	
	public Collection<ProductBean> doRetrieveAllOrder(String username) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatament = null;
		
		
		Collection<ProductBean> products = new LinkedList<ProductBean>();
		
		String selectSQL = "SELECT id_album, quantity FROM ordinazione WHERE num_ordine IN ( SELECT num_ordine FROM ordine WHERE user_utente=(?))";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatament = connection.prepareStatement(selectSQL);
			
			preparedStatament.setString(1, username);
			
			System.out.println("doRetrieveAllOrder:" + preparedStatament.toString());
			
			ResultSet rs = preparedStatament.executeQuery();
			
			while(rs.next()) {
				ProductBean bean = new ProductBean();
				
				bean.setCode(rs.getInt("id_album"));
				bean.setQuantity(rs.getInt("quantity"));
				
				products.add(bean);
			}
		} finally {
			try {
				if(preparedStatament != null)
					preparedStatament.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return products;
	}	


	
	

}

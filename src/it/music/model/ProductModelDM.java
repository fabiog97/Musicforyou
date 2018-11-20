package it.music.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

public class ProductModelDM implements ProductModel<ProductBean> {

	private static final String TABLE_NAME = "album_musicale";
	
	@Override
	public Collection<ProductBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatament = null;
		
		Collection<ProductBean> products = new LinkedList<ProductBean>();
		
		String selectSQL = "SELECT * FROM " + ProductModelDM.TABLE_NAME;
		
		if(order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatament = connection.prepareStatement(selectSQL);
			
			System.out.println("doRetrieveAll:" + preparedStatament.toString());
			
			ResultSet rs = preparedStatament.executeQuery();
			
			while(rs.next()) {
				ProductBean bean = new ProductBean();
				
				bean.setCode(rs.getInt("id"));
				bean.setTitle(rs.getString("titolo"));
				bean.setPrice(rs.getInt("prezzo"));
				bean.setArtist(rs.getString("artista"));
				bean.setCover(rs.getString("cover"));
				bean.setDescription(rs.getString("descrizione"));
				bean.setType(rs.getString("genere"));
				
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

	@Override
	public ProductBean doRetrieveByKey(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatament = null;
		
		ProductBean bean = new ProductBean();
		
		String selectSQL = "SELECT * FROM " + ProductModelDM.TABLE_NAME + " WHERE id = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatament = connection.prepareStatement(selectSQL);
			
			preparedStatament.setInt(1, code);
			
			System.out.println("doRetrieveByKey:" + preparedStatament.toString());
			
			ResultSet rs = preparedStatament.executeQuery();
			
			
			while(rs.next()) {	
			
				bean.setCode(rs.getInt("id"));
				bean.setTitle(rs.getString("titolo"));
				bean.setPrice(rs.getInt("prezzo"));
				bean.setArtist(rs.getString("artista"));
				bean.setCover(rs.getString("cover"));
				bean.setDescription(rs.getString("descrizione"));
				bean.setType(rs.getString("genere"));			
				

			}
		} finally {
			try {
				if(preparedStatament != null)
					preparedStatament.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}	
		
		return bean;
	}
	
	
	public ProductBean doRetrieveByName(String titolo) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatament = null;
		
		ProductBean bean = new ProductBean();
		
		String selectSQL = "SELECT * FROM " + ProductModelDM.TABLE_NAME + " WHERE titolo = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatament = connection.prepareStatement(selectSQL);
			
			preparedStatament.setString(1, titolo);
			
			System.out.println("doRetrieveByName:" + preparedStatament.toString());
			
			ResultSet rs = preparedStatament.executeQuery();
			
			while(rs.next()) {	
			
				bean.setCode(rs.getInt("id"));
				bean.setTitle(rs.getString("titolo"));
				bean.setPrice(rs.getInt("prezzo"));
				bean.setArtist(rs.getString("artista"));
				bean.setCover(rs.getString("cover"));
				bean.setDescription(rs.getString("descrizione"));
				bean.setType(rs.getString("genere"));			
				

			}
		} finally {
			try {
				if(preparedStatament != null)
					preparedStatament.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}	
		
		return bean;
	}


	@Override
	public void doSave(ProductBean product) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + ProductModelDM.TABLE_NAME
				+ " (titolo, prezzo, artista, cover, descrizione,genere) VALUES (?, ?, ?, ?, ?, ?)";

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, product.getTitle());
			preparedStatement.setInt(2, product.getPrice());
			preparedStatement.setString(3, product.getArtist());
			preparedStatement.setString(4, product.getCover());
			preparedStatement.setString(5, product.getDescription());
			preparedStatement.setString(6, product.getType());

			System.out.println("doSave: "+ preparedStatement.toString());
			preparedStatement.executeUpdate();

			connection.commit();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}

	}

	@Override
	public void doUpdate(ProductBean product) throws SQLException {
		
	}

	@Override
	public boolean doDelete(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + ProductModelDM.TABLE_NAME + " WHERE id = ?";

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, code);

			System.out.println("doDelete: "+ preparedStatement.toString());
			result = preparedStatement.executeUpdate();

			connection.commit();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return (result != 0);
	}
		
	

	

}

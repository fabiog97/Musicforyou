package it.music.model;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class UtenteModelDM implements UtenteModel<UtenteBean> {

	public UtenteBean doRegistrazione(UtenteBean account) throws SQLException //Questo metodo serve per quando un utente si registra al sito,i suoi dati vengono inseriti nel DB
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		//Parte il controllo che guarda se esiste gi� un altro club con stesso nome_club o email
		String controlloSQL = "SELECT * FROM utente WHERE username = ?";// Viene eseguita una query con la quale si va a controllora se esiste gi� un altro utente con un email o nome del club uguale
		try
		{
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(controlloSQL);
			
			preparedStatement.setString(1, account.getUsername());
		
			UtenteBean account_doppione = new UtenteBean();
			
			System.out.println("doControlDoppione:" + preparedStatement.toString());
			
			ResultSet rs = preparedStatement.executeQuery(); //In RS finisce il risultato della query che � stata appena eseguita

			if(rs.next() == false) //Se rs.next(che � il frutto dei risultati della query controlloSQL) � false vuol dire che non esiste un altro utente con la stessa email o nome club e quindi si passa all inserimento dell'utente nel DB  
			{
				String insertSQL = "INSERT INTO utente (username, password, nome, cognome,telefono, indirizzo, città, cap, nazione, cf) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"; // Viene eseguita una query con la quale si va ad inserire nel DB il nuovo utente
				Connection connection2 = null;
				PreparedStatement preparedStatement2 = null;
				try 
				{
					connection2 = DriverManagerConnectionPool.getConnection();
					preparedStatement2 = connection2.prepareStatement(insertSQL);
					preparedStatement2.setString(1, account.getUsername());
					preparedStatement2.setString(2, account.getPassword());
					preparedStatement2.setString(3, account.getNome());
					preparedStatement2.setString(4, account.getCognome());
					preparedStatement2.setString(5, account.getTelefono());
					preparedStatement2.setString(6, account.getIndirizzo());
					preparedStatement2.setString(7, account.getCittà());
					preparedStatement2.setString(8, account.getCap());
					preparedStatement2.setString(9, account.getNazione());
					preparedStatement2.setString(10, account.getCf());
					
					
					System.out.println("doRegistrazione: "+ preparedStatement2.toString());
					preparedStatement2.executeUpdate();
					connection2.commit();
				}
				finally 
				{
					try 
					{
						if (preparedStatement2 != null)
						preparedStatement2.close();
					} 
					finally 
					{
						DriverManagerConnectionPool.releaseConnection(connection2);
					}
				}
			}
			else 
			{
				account.setUsername("");
			}
		}
		finally 
		{
			try 
			{
				if (preparedStatement != null)
				preparedStatement.close();
			} 
			finally 
			{
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return account;
	}

	
	

	public UtenteBean doLogin(String username, String password) throws SQLException //Questo metodo serve per controllare se i dati che l'utente inserisce al login corrispondono ai dati presenti nel DB
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		UtenteBean bean = new UtenteBean();
	
		String selectSQL = "SELECT * FROM utente WHERE username = ? AND password = ?"; 
		boolean find = false;
		
		try 
		{
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, password);
			
			System.out.println("doControlSELECTLogin:" + preparedStatement.toString());
			
			ResultSet rs = preparedStatement.executeQuery(); //In RS finisce il risultato della query che � stata appena eseguita
			
			
			while(rs.next()) 
			{
				
				bean.setUsername(rs.getString("username"));
				bean.setPassword(rs.getString("password"));
			
				System.out.println("doLogin: "+ preparedStatement.toString());
				connection.commit();
			}
			
		} 
		finally 
		{
			try 
			{
				if(preparedStatement != null)
					preparedStatement.close();
			} 
			finally 
			{
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}	
		
		return bean;
		
		
	}
	
	

}


	

package it.music.model;

import java.sql.SQLException;
import java.util.ArrayList;

public interface UtenteModel<T>
{
	public UtenteBean doRegistrazione(T account) throws SQLException;//Metodo per la registrazione dell'utente al sito
	
	public UtenteBean doLogin(String email, String password) throws SQLException;//Metodo per il login dell'utente al sito
	
	
	
	
	
}

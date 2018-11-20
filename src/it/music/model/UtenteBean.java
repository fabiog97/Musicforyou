package it.music.model;

import java.io.Serializable;

public class UtenteBean implements Serializable{
	
	@Override
	public String toString() {
		return "UtenteBean [username=" + username + ", password=" + password + ", nome=" + nome + ", cognome=" + cognome
				+ ", telefono=" + telefono + ", indirizzo=" + indirizzo + ", città=" + città + ", cap=" + cap
				+ ", nazione=" + nazione + ", cf=" + cf + "]";
	}


	private String username;
	private String password;
	private String nome;
	private String cognome;
	private String telefono;
	private String indirizzo;
	private String città;
	private String cap;
	private String nazione;
	private String cf;
	
	
	public UtenteBean() 
	{
		username = null;
		password = null;
		cognome = null;
		telefono = null;
		indirizzo = null;
		città = null;
		cap = null;
		nazione = null;
		cf = null;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getNome() {
		return nome;
	}


	public void setNome(String nome) {
		this.nome = nome;
	}


	public String getCognome() {
		return cognome;
	}


	public void setCognome(String cognome) {
		this.cognome = cognome;
	}


	public String getTelefono() {
		return telefono;
	}


	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}


	public String getIndirizzo() {
		return indirizzo;
	}


	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}


	public String getCittà() {
		return città;
	}


	public void setCittà(String città) {
		this.città = città;
	}


	public String getCap() {
		return cap;
	}


	public void setCap(String cap) {
		this.cap = cap;
	}


	public String getNazione() {
		return nazione;
	}


	public void setNazione(String nazione) {
		this.nazione = nazione;
	}


	public String getCf() {
		return cf;
	}


	public void setCf(String cf) {
		this.cf = cf;
	}
	

}

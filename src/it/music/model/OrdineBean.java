package it.music.model;

import java.io.Serializable;

public class OrdineBean implements Serializable {

	int num_ordine;
	int quantità;
	int price;
	String utente;
	String num_carta;
	String data_scadenza;
	String cv_codice;
	String codice_coupon;
	String tipo_carta;
	
	public OrdineBean() {
		num_ordine = -1;
		quantità = 0;
		price = 0;
		utente = null;
		num_carta = null;
		data_scadenza = null;
		cv_codice = null;
		codice_coupon = null;
		tipo_carta = null;
	}

	
	public String toString() {
		return "OrdineBean [num_ordine=" + num_ordine + ", quantità=" + quantità + ", price=" + price + ", utente="
				+ utente + ", num_carta=" + num_carta + ", data_scadenza=" + data_scadenza + ", cv_codice=" + cv_codice
				+ ", codice_coupon=" + codice_coupon + ", tipo_carta=" + tipo_carta + "]";
	}

	public int getNum_ordine() {
		return num_ordine;
	}

	public void setNum_ordine(int num_ordine) {
		this.num_ordine = num_ordine;
	}

	public int getQuantità() {
		return quantità;
	}

	public void setQuantità(int quantità) {
		this.quantità = quantità;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getUtente() {
		return utente;
	}

	public void setUtente(String utente) {
		this.utente = utente;
	}

	public String getNum_carta() {
		return num_carta;
	}

	public void setNum_carta(String num_carta) {
		this.num_carta = num_carta;
	}

	public String getData_scadenza() {
		return data_scadenza;
	}

	public void setData_scadenza(String data_scadenza) {
		this.data_scadenza = data_scadenza;
	}

	public String getCv_codice() {
		return cv_codice;
	}

	public void setCv_codice(String cv_codice) {
		this.cv_codice = cv_codice;
	}

	public String getCodice_coupon() {
		return codice_coupon;
	}

	public void setCodice_coupon(String codice_coupon) {
		this.codice_coupon = codice_coupon;
	}

	public String getTipo_carta() {
		return tipo_carta;
	}

	public void setTipo_carta(String tipo_carta) {
		this.tipo_carta = tipo_carta;
	}
	
	
}

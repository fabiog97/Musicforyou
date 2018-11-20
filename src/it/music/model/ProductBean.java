package it.music.model;

import java.io.Serializable;



public class ProductBean implements Serializable{
	
	int code;
	String title;
	int price;
	String artist;
	String cover;
	String description;
	String type;
	int quantity;
	
	public ProductBean() 
	{
		code = -1;
		title  = "";
		artist = "";
		cover = "";
		description = "";
		type = "";
		price = 0;
		quantity = 1;
		
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}
	
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getArtist() {
		return artist;
	}

	public void setArtist(String artist) {
		this.artist = artist;
	}

	public String getCover() {
		return cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}


	

	public String toString() {
		return "ProductBean [code=" + code + ", title=" + title + ", price=" + price + "]";
	}

	public boolean equals(Object other) 
	{
		if(this.getCode() == ((ProductBean)other).getCode())
			return true;
		else 
			return false;
	}
	
}

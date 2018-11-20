package it.music.model;

import java.sql.SQLException;
import java.util.Collection;

public interface OrdineModel<T> {
	
	public void doBuy(T ordine, Cart<ProductBean> cart) throws SQLException;

	public Collection<ProductBean> doRetrieveAllOrder(String username) throws SQLException;
}

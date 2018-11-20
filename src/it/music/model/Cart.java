package it.music.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Cart<T> implements Serializable {

	
	List<T> list;
	
	public Cart() {
		list = new ArrayList<T>();
	}
	
	public void addElement(T element) 
	{
		list.add(element);
	}
	
	public void deleteElement(T element) 
	{
		System.out.println("DELETE: "+element.toString());
		for( T elem: list) 
		{
			System.out.println("EL: "+elem.toString());
			if(elem.equals(element)) {
				System.out.println("FOUND: "+element.toString());
				list.remove(elem);
				break;
			}
		}
		
	}
	
	
	public void deleteAllElement() 
	{
		
		for( T elem: list) 
		{
			list.remove(elem);	
		}
		
	}
	
	public List<T> getList()
	{
		return list;
	}
}

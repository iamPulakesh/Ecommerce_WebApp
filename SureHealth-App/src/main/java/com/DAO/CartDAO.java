package com.DAO;

import java.util.List;

import com.entity.Cart;

public interface CartDAO {
	public boolean addCart(Cart c);
	
	public List<Cart> getMedsByUser(int userId);//add products by particular user
	
	public boolean deleteMeds(int mid,int uid);
}

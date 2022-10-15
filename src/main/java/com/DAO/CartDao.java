package com.DAO;


import java.util.List;

import com.entity.Cart;

public interface CartDao {
	
	public boolean addCart(Cart c,int bid,int uid);
	
	public List<Cart> getBookByUser(int userid);
	
	public boolean removeBook(int bid,int uid,int cid);
	
	public boolean updateQuantity(int quan,int uid,int bid);
}


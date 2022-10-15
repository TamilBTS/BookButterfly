package com.DAO;

import java.util.List;

import com.entity.BookOrders;

public interface BookOrdersDao {
	
	//public int getOrderNo();
	
	public boolean saveOrder(List<BookOrders> list);
	
	public boolean deleteCart(int id);
	
	public List<BookOrders> getBooks(String email);
	
	public List<BookOrders> getAllBooks();
	
	public boolean updateStatus(int id);
	
	public boolean cancelOrder(int id);
	
	public List<BookOrders> allBooks();
	
	public List<BookOrders> cancelOrders();
}

package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookOrders;

public class BookOrdersDaoImp implements BookOrdersDao {

	private Connection con;
	
	public BookOrdersDaoImp(Connection con) {
		super();
		this.con=con;
	}

	/*public int getOrderNo() {
		int i=1;
		try{
			String sql="select * from orderbooks";
			PreparedStatement pt=con.prepareStatement(sql);
			ResultSet rs=pt.executeQuery();
			
			while(rs.next()){
				i++;
			}
			
			
			
		}catch(Exception e){e.printStackTrace();}
		return i;
	}*/

	public boolean saveOrder(List<BookOrders> list) {
		boolean f=false;
		
		try{
			String sql="insert into orderbooks(order_id,user_name,email,address,phone,bookName,author,price,payment,orderdate,ordertime,quantity) values(?,?,?,?,?,?,?,?,?,?,?,?)";
			
			con.setAutoCommit(false);
			PreparedStatement pt=con.prepareStatement(sql);
			
			for(BookOrders b:list){
				pt.setString(1, b.getOrderId());
				pt.setString(2, b.getUsername());
				pt.setString(3, b.getEmail());
				pt.setString(4, b.getFullAddress());
				pt.setString(5, b.getPhno());
				pt.setString(6, b.getBookName());
				pt.setString(7, b.getAuthor());
				pt.setDouble(8, b.getPrice());
				pt.setString(9, b.getPaymentType());
				pt.setString(10, b.getDate());
				pt.setString(11, b.getTime());
				pt.setInt(12, b.getQuantity());
				//pt.setString(12, "Ordered");
				pt.addBatch();
				
			}
			int[] count=pt.executeBatch();
			con.commit();
			f=true;
			con.setAutoCommit(true);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return f;
	}
	
	public boolean deleteCart(int id){
		
		boolean f=false;
		
		try{
			
			String sql="delete from cart where uid=?";
			PreparedStatement pt=con.prepareStatement(sql);
			pt.setInt(1, id);
			int i=pt.executeUpdate();
			
			if(i>0){
				f=true;
			}
			
		}catch(Exception e){
			e.printStackTrace();}
		return f;
	}

	public List<BookOrders> getBooks(String email) {
		List<BookOrders> list=new ArrayList<BookOrders>();
		BookOrders b=null;
		
		try{
			
			String sql="select * from orderbooks where email=? order by id desc";
			PreparedStatement pt=con.prepareStatement(sql);
			pt.setString(1, email);
			ResultSet rs=pt.executeQuery();
			
			while(rs.next()){
				b=new BookOrders();
				b.setId(rs.getInt(1));
				b.setOrderId(rs.getString(2));
				b.setUsername(rs.getString(3));
				b.setEmail(rs.getString(4));
				b.setFullAddress(rs.getString(5));
				b.setPhno(rs.getString(6));
				b.setBookName(rs.getString(7));
				b.setAuthor(rs.getString(8));
				b.setPrice(rs.getDouble(9));
				b.setPaymentType(rs.getString(10));
				b.setDate(rs.getString(11));
				b.setTime(rs.getString(12));
				b.setStatus(rs.getString(13));
				b.setQuantity(rs.getInt(14));
				list.add(b);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		return list;
	}

	public List<BookOrders> getAllBooks() {
		List<BookOrders> list=new ArrayList<BookOrders>();
		BookOrders b=null;
		
		try{
			
			String sql="select * from orderbooks where orderstatus is null order by id desc";
			PreparedStatement pt=con.prepareStatement(sql);
			
			ResultSet rs=pt.executeQuery();
			
			while(rs.next()){
				b=new BookOrders();
				b.setId(rs.getInt(1));
				b.setOrderId(rs.getString(2));
				b.setUsername(rs.getString(3));
				b.setEmail(rs.getString(4));
				b.setFullAddress(rs.getString(5));
				b.setPhno(rs.getString(6));
				b.setBookName(rs.getString(7));
				b.setAuthor(rs.getString(8));
				b.setPrice(rs.getDouble(9));
				b.setPaymentType(rs.getString(10));
				b.setDate(rs.getString(11));
				b.setTime(rs.getString(12));
				b.setStatus(rs.getString(13));
				b.setQuantity(rs.getInt(14));
				
				list.add(b);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	public boolean updateStatus(int id){
		boolean f=false;
		
		String q="update orderbooks set orderstatus=? where id=?";
		try {
			PreparedStatement pt=con.prepareStatement(q);
			pt.setString(1, "Accepted");
			pt.setInt(2, id);
			int i=pt.executeUpdate();
			System.out.print(i);
			if(i>0){
				f=true;
				
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean cancelOrder(int id){
		boolean f=false;
		
		String q="update orderbooks set orderstatus=? where id=?";
		try {
			PreparedStatement pt=con.prepareStatement(q);
			pt.setString(1, "Cancelled");
			pt.setInt(2, id);
			int i=pt.executeUpdate();
			System.out.print(i);
			if(i>0){
				f=true;
				
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return f;
		
	}

	public List<BookOrders> allBooks() {
		List<BookOrders> list=new ArrayList<BookOrders>();
		BookOrders b=null;
		
		try{
			
			String sql="select * from orderbooks where orderstatus is not null order by id desc";
			PreparedStatement pt=con.prepareStatement(sql);
			
			ResultSet rs=pt.executeQuery();
			
			while(rs.next()){
				b=new BookOrders();
				b.setId(rs.getInt(1));
				b.setOrderId(rs.getString(2));
				b.setUsername(rs.getString(3));
				b.setEmail(rs.getString(4));
				b.setFullAddress(rs.getString(5));
				b.setPhno(rs.getString(6));
				b.setBookName(rs.getString(7));
				b.setAuthor(rs.getString(8));
				b.setPrice(rs.getDouble(9));
				b.setPaymentType(rs.getString(10));
				b.setDate(rs.getString(11));
				b.setTime(rs.getString(12));
				b.setStatus(rs.getString(13));
				b.setQuantity(rs.getInt(14));
				
				list.add(b);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		return list;
	}

	public List<BookOrders> cancelOrders() {
		List<BookOrders> list=new ArrayList<BookOrders>();
		BookOrders b=null;
		
		try{
			
			String sql="select * from orderbooks where orderstatus='Cancelled' order by id desc";
			PreparedStatement pt=con.prepareStatement(sql);
			
			ResultSet rs=pt.executeQuery();
			
			while(rs.next()){
				b=new BookOrders();
				b.setId(rs.getInt(1));
				b.setOrderId(rs.getString(2));
				b.setUsername(rs.getString(3));
				b.setEmail(rs.getString(4));
				b.setFullAddress(rs.getString(5));
				b.setPhno(rs.getString(6));
				b.setBookName(rs.getString(7));
				b.setAuthor(rs.getString(8));
				b.setPrice(rs.getDouble(9));
				b.setPaymentType(rs.getString(10));
				b.setDate(rs.getString(11));
				b.setTime(rs.getString(12));
				b.setStatus(rs.getString(13));
				b.setQuantity(rs.getInt(14));
				
				list.add(b);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	
	}

	



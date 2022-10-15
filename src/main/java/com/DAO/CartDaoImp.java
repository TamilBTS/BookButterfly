package com.DAO;

import java.util.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.entity.BookDetails;
import com.entity.Cart;

public class CartDaoImp implements CartDao {

	private Connection con;

	public CartDaoImp(Connection con) {

		this.con = con;
	}

	public boolean addCart(Cart c,int bid,int uid) {
		boolean f = false;

		try {
			int quantity;
			String sql1="select * from cart where `bid`="+bid +" and `uid`="+uid;
			PreparedStatement st=con.prepareStatement(sql1);
			//st.setInt(1, bid);
			//st.setInt(2, uid);
			ResultSet rs=st.executeQuery(sql1);
			
			if(rs.next()){
				quantity=rs.getInt(9);
				quantity++;
				System.out.println(quantity);
				String sql="update cart set quantity=? where uid=? and bid=?";
				PreparedStatement pt=con.prepareStatement(sql);
				pt.setInt(1, quantity);
				pt.setInt(2, uid);
				pt.setInt(3, bid);
				int i=pt.executeUpdate();
				if(i>0){
					f=true;
					System.out.println("success");
					
				}
				return f;
				
			}
			else{

			String sql = "insert into cart(bid,uid,bookName,author,price,total_price,photo,quantity) values(?,?,?,?,?,?,?,?)";
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setInt(1, c.getBid());
			pt.setInt(2, c.getUserId());
			pt.setString(3, c.getBookName());
			pt.setString(4, c.getAuthor());
			pt.setDouble(5, c.getPrice());
			pt.setDouble(6, c.getTotalPrice());
			pt.setString(7, c.getPhoto());
			pt.setInt(8, c.getQuantity());
			
			int i = pt.executeUpdate();
			if (i == 1) {
				f = true;
			}}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

	public boolean updateQuantity(int quan,int uid,int bid) {
		boolean f=false;
		try {
		String sql="update cart set quantity=? where uid=? and bid=?";
		PreparedStatement pt=con.prepareStatement(sql);
		pt.setInt(1, quan);
		pt.setInt(2, uid);
		pt.setInt(3, bid);
		int i=pt.executeUpdate();
		if(i>0){
			f=true;
		}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return f;
	}

	public List<Cart> getBookByUser(int userid) {
		List<Cart> l = new ArrayList<Cart>();
		Cart c = null;
		double total = 0;
		
		double price=0;
		try {

			String sql = "select * from cart where uid=?";
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setInt(1, userid);
			ResultSet rs = pt.executeQuery();
			while (rs.next()) {
				c = new Cart();
				c.setCid(rs.getInt(1));
				c.setBid(rs.getInt(2));
				c.setUserId(rs.getInt(3));
				c.setBookName(rs.getString(4));
				c.setAuthor(rs.getString(5));
				int q=rs.getInt(9);
				c.setQuantity(rs.getInt(9));
				price=q*rs.getDouble(6);
				c.setPrice(price);
				//c.setPrice(rs.getDouble(6));
				total = total + price;
				c.setPhoto(rs.getString(8));
				c.setTotalPrice(total);

				l.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return l;
	}

	public boolean removeBook(int bid,int uid,int cid) {
		boolean f = false;

		try {

			String sql = "delete from cart where bid=? and uid=? and cid=?";
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setInt(1, bid);
			pt.setInt(2, uid);
			pt.setInt(3, cid);
			int i = pt.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

}

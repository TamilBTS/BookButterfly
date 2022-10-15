package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.entity.User;

public class UserDaoImp implements UserDao {

	private Connection con;

	public UserDaoImp(Connection con) {
		super();
		this.con = con;
		System.out.print(con);
	}
	
	public boolean emailVerify(String email){
		boolean f=true;
		
		try{

			String sql2="select * from user where email like(?)";
			PreparedStatement pt1 = con.prepareStatement(sql2);
			pt1.setString(1, email);
			ResultSet rs=pt1.executeQuery();
			if(rs.next()){
				
				f=false;
				return f;
				
			}else{
				f=true;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return f;
	}

	public boolean userRegister1(User us) {

		boolean f = false;

		try {
			

			String sql = "insert into user(name,email,phno,password,securityques,answer) values(?,?,?,?,?,?)";
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setString(1, us.getName());
			pt.setString(2, us.getEmail());
			pt.setString(3, us.getPhno());
			pt.setString(4, us.getPassword());
			pt.setString(5, us.getSecurityQues());
			pt.setString(6, us.getAnswer());

			int i = pt.executeUpdate();
			System.out.print(i);

			if (i > 0) {
				f = true;

			}
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return f;
	}

	public User login(String email, String pass) {

		User us = null;
		try {
			String sql = "select * from user where email=? and password=?";
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setString(1, email);
			pt.setString(2, pass);
			ResultSet rs = pt.executeQuery();

			while (rs.next()) {
				us = new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhno(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setAddress(rs.getString(6));
				us.setLandmark(rs.getString(7));
				us.setCity(rs.getString(8));
				us.setState(rs.getString(9));
				us.setPincode(rs.getString(10));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return us;

	}

	public boolean checkPass(int id,String pass) {
		boolean f = false;
		try {
			
			String sql="select * from user where id=? and password=?";
			PreparedStatement pt=con.prepareStatement(sql);
			pt.setInt(1,id);
			pt.setString(2, pass);
			ResultSet rs=pt.executeQuery();
			
			while(rs.next()){
				f=true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean updateProfile(User us,String oldEmail) {
	
		boolean f = false;

		try {
			
			String sql1="update book_details set userEmail=? where userEmail=?";
			PreparedStatement pt1=con.prepareStatement(sql1);
			pt1.setString(1, us.getEmail());
			pt1.setString(2, oldEmail);
			int j=pt1.executeUpdate();
			
			String sql2="update orderbooks set email=? where email=?";
			PreparedStatement pt2=con.prepareStatement(sql2);
			pt2.setString(1, us.getEmail());
			pt2.setString(2, oldEmail);
			int k=pt2.executeUpdate();
			System.out.print(k);
			String sql = "update user set name=?,email=?,phno=? where id=?";
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setString(1, us.getName());
			pt.setString(2, us.getEmail());
			pt.setString(3, us.getPhno());
			//pt.setString(4, us.getPassword());
			pt.setInt(4, us.getId());
			
			
			
			int i = pt.executeUpdate();
			System.out.print(i);

			if (i > 0 || j>0 || k>0) {
				f = true;

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return f;
		
	}
	
	public boolean updateAddress(User us){
		boolean f=false;
		try{
			
			String sql="UPDATE user SET address = ?, landmark = ?, city = ?, state = ?, pincode = ? WHERE id = ?";
			PreparedStatement pt=con.prepareStatement(sql);
			pt.setString(1, us.getAddress());
			pt.setString(2, us.getLandmark());
			pt.setString(3, us.getCity());
			pt.setString(4, us.getState());
			pt.setString(5, us.getPincode());
			pt.setInt(6, us.getId());
			
			
			int i=pt.executeUpdate();
			
			if(i>0){
				f=true;
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return f;

}

	public int forgotPass(String email,String ques,String ans,String pass) {
		boolean f=false;
		int id=0;
		
		try {
			
			String sql="select id from user where email=? and securityques=? and answer=?";
			PreparedStatement pt=con.prepareStatement(sql);
			pt.setString(1, email);
			pt.setString(2, ques);
			pt.setString(3, ans);
			
			ResultSet rs=pt.executeQuery();
			
			if(rs.next()){
				f=true;
				 id=rs.getInt(1);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		
		return id;
	}

	public boolean updatePass(int id,String email, String pass) {
		boolean f=false;
		
		try{
			
			String sql="UPDATE user SET password=? WHERE id = ?";
			PreparedStatement pt=con.prepareStatement(sql);
			pt.setString(1, pass);
			pt.setInt(2, id);
			int i=pt.executeUpdate();
			
			if(i>0){
				f=true;
			}
			
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return f;
	}

	public boolean changepass(int id, String opass, String npass) {
		boolean f=false;
		
try{
			
			String sql="UPDATE user SET password=? WHERE id = ? and password=?";
			PreparedStatement pt=con.prepareStatement(sql);
			pt.setString(1, npass);
			pt.setInt(2, id);
			pt.setString(3, opass);
			int i=pt.executeUpdate();
			
			if(i>0){
				f=true;
			}
			
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return f;
	}
}

package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.entity.User;

public class DBConnect {
	
	private static Connection con;
	
	public static Connection getConnection(){
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3307/tamil","root","1234");
			//System.out.print(con);
			//System.out.print("connected");
			return con;
			
		}
		catch(SQLException e){
			e.printStackTrace();
			
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		}
		return null;
	}
	
	
		
	/*public boolean userRegister() {
		boolean f=false;
				
			try{
				Class.forName("com.mysql.cj.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/e-book","root","");
				User us=new User();
				String sql="insert into user(name,email,phno,password) values(?,?,?,?)";
				PreparedStatement pt=con.prepareStatement(sql);
				pt.setString(1,us.getName());
				pt.setString(2, us.getEmail());
				pt.setString(3, us.getPhno());
				pt.setString(4, us.getPassword());
					
					int i=pt.executeUpdate();
					System.out.print(i);
					
					if(i>0){
						f=true;
						
					}
										
					
				
					} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} 
			
					
				
				
				return f;
			}

	/*public static void main(String args[]){
		DBConnect.getConnection();
		System.out.print(con);
		DBConnect db=new DBConnect();
		
		boolean b=db.userRegister();
		System.out.print(b);
		
	}*/
	
}
	


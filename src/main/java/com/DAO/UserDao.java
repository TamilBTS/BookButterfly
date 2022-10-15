package com.DAO;

import com.entity.*;

public interface UserDao {
	
	public boolean emailVerify(String email);
	
	public boolean userRegister1(User us);
	
	public User login(String email,String pass);
		
	public boolean checkPass(int id,String pass);	
	
	public boolean updateProfile(User us,String oldEmail);
	
	public boolean updateAddress(User us);
	
	public int forgotPass(String email,String ques,String ans,String pass);
	
	public boolean updatePass(int id,String email,String pass);
	
	public boolean changepass(int id,String opass,String npass);
	
	
}

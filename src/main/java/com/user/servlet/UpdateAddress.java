package com.user.servlet;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookOrdersDao;
import com.DAO.BookOrdersDaoImp;
import com.DAO.UserDaoImp;
import com.DB.DBConnect;
import com.entity.User;


public class UpdateAddress extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		User us=(User) session.getAttribute("userobj");
		
		try{
		int id=Integer.parseInt(request.getParameter("uid"));
		String address=request.getParameter("Address");
		String landmark=request.getParameter("Landmark");
		String city=request.getParameter("City");
		String state=request.getParameter("State");
		String pincode=request.getParameter("Pincode");
		
		String regex = "^[1-9]{1}[0-9]{2}\\s{0,1}[0-9]{3}$";
		
		Pattern p = Pattern.compile(regex);
		
		Matcher m = p.matcher(pincode);
		if(m.matches()!=true){
			session.setAttribute("failure", "Please Enter A Valid Pincode");
			response.sendRedirect("UserAddress.jsp");
		}
		else{
		us.setId(id);
		us.setAddress(address);
		us.setLandmark(landmark);
		us.setCity(city);
		us.setState(state);
		us.setPincode(pincode);
		
		
		//session.setAttribute("useraddress",us);
	
		
		
		UserDaoImp dao=new UserDaoImp(DBConnect.getConnection());
		
		boolean f=dao.updateAddress(us);
		
		if(f){
			session.setAttribute("success", "Address updated Successfully");
			response.sendRedirect("UpdatedAddress.jsp");
		}
		else{
			session.setAttribute("failure", "Something wrong on server");
			response.sendRedirect("UserAddress.jsp");
			
		}
		}
		}catch(Exception e){
			e.printStackTrace();
		}
	
	}

}

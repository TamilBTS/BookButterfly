package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDaoImp;
import com.DB.DBConnect;

public class UpdatePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid = Integer.parseInt(request.getParameter("uid"));
		String opass=request.getParameter("opass");
		String npass=request.getParameter("npass");
		String cpass=request.getParameter("cpass");
		HttpSession session=request.getSession(); 
		
		if(npass.equals(cpass)){
		
		UserDaoImp dao=new UserDaoImp(DBConnect.getConnection());
		boolean f=dao.changepass(uid, opass, npass);
		if(f){
			
			session.setAttribute("success", "Password Changed Successfully");
			session.removeAttribute("userobj");
			response.sendRedirect("login.jsp");
			
		}
		else{
			
			session.setAttribute("failure", "Password Incorrect");
			
			response.sendRedirect("ChangePassword.jsp");
		}
		
		}
		else{
			
			session.setAttribute("failure", "New Password and Confirm Password didn't match..");
			response.sendRedirect("ChangePassword.jsp");
		}
	}

}

package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDaoImp;
import com.DB.DBConnect;


public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email=request.getParameter("email");
		String ques=request.getParameter("securityQues");
		String answer=request.getParameter("Answer");
		String npass=request.getParameter("npass");
		String cpass=request.getParameter("cpass");
		
		HttpSession session=request.getSession();
		
		UserDaoImp dao=new UserDaoImp(DBConnect.getConnection());
		
		int id=dao.forgotPass(email, ques, answer, npass);
		System.out.println(id);
		System.out.println(npass);
		System.out.println(cpass);
		
		if(id!=0){
			if(npass.equals(cpass)){
				boolean f=dao.updatePass(id, email, npass);
				
				if(f){
					session.setAttribute("success", "Password Changed successfully");
					response.sendRedirect("login.jsp");
				}
				
				
			}else{
				session.setAttribute("failure", "Please check your password correctly");
				response.sendRedirect("ForgotPassword.jsp");
			}
			
		}
		else{
			session.setAttribute("failure", "Please enter a valid email");
			response.sendRedirect("ForgotPassword.jsp");

		}
	}

}

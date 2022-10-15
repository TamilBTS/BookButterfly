package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDaoImp;
import com.DB.DBConnect;
import com.entity.User;

//@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String name=request.getParameter("Uname");
			String email=request.getParameter("Uemail");
			String phno=request.getParameter("Uphno");
			String pass=request.getParameter("Upass");
			String check=request.getParameter("Ucheck");
			String securityques=request.getParameter("securityQues");
			String answer=request.getParameter("Answer");
			
			//System.out.print(name + " "+email +" "+phno+" "+pass+" "+check);
			HttpSession session=request.getSession();
			
			UserDaoImp dao1=new UserDaoImp(DBConnect.getConnection());
			
			boolean f1=dao1.emailVerify(email);
			System.out.println(f1);
			
			if(phno.length()!=10){
				session.setAttribute("failure", "Please Enter a valid phone number...");
				response.sendRedirect("register.jsp");
			}
			
			else if(f1==false){
				session.setAttribute("failure", "Oops...Your Email Id Already Exists...");
				response.sendRedirect("register.jsp");
			}
			
			else{
			
			
			User us=new User();
			
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(pass);
			us.setSecurityQues(securityques);
			us.setAnswer(answer);
			
			
			
				
				if(check!=null){
				
				UserDaoImp dao=new UserDaoImp(DBConnect.getConnection());
				boolean value=dao.userRegister1(us);
				//System.out.println(value);
				
					if(value){
						//System.out.print("Registered Successfully..");
						
						session.setAttribute("success", "Registered Successfully..");
						response.sendRedirect("register.jsp");
					}
					else{
						//System.out.print("Not Registered ..");
						
						session.setAttribute("failure", "Not Registered ..");
						response.sendRedirect("register.jsp");
						
						
					}
				
			  }
				else{
					session.setAttribute("failure", "Please Agree the Terms and Conditions...");
					response.sendRedirect("register.jsp");
				}
		
			}	
		}catch(Exception e){
			e.printStackTrace();
			
		}
		
	}
	

}

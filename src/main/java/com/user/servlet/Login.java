package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDaoImp;
import com.DB.DBConnect;
import com.entity.User;


public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try{
			UserDaoImp dao=new UserDaoImp(DBConnect.getConnection());
			
			
			HttpSession session=request.getSession();
			
			String email=request.getParameter("email");
			String pass=request.getParameter("pass");
			
			//System.out.print(email+" "+pass);
			
			if("admin@gmail.com".equals(email)&& "admin".equals(pass)){
				User us=new User();
				us.setName("admin");
				session.setAttribute("userobj", us);
				response.sendRedirect("admin/home.jsp");
			}
			else if("seller@gmail.com".equals(email)&&"1234".equals(pass)){
				User us=new User();
				us.setName("seller");
				session.setAttribute("userobj", us);
				response.sendRedirect("admin/seller.jsp");
			}
			else{
				
				User us=dao.login(email, pass);
				
				if(us!=null){
					
					session.setAttribute("userobj", us);
					response.sendRedirect("index.jsp");
				}
				else{
					session.setAttribute("failure", "Oops..! Email And Password Invalid...");
					response.sendRedirect("login.jsp");
					
				}
				
				
				
			}
			
			
		}catch(Exception e){e.printStackTrace();}
		
	}

}

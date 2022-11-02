package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDaoImp;
import com.DB.DBConnect;
import com.google.gson.Gson;

/**
 * Servlet implementation class EmailForgot
 */
public class EmailForgot extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession s=request.getSession();
		String email=request.getParameter("email");
		System.out.println(email);
		System.out.println("Hello");
		Random r=new Random();
		Integer value=r.nextInt(600000-100000)+100000;
		s.setAttribute("SK", value);
		Connection con=DBConnect.getConnection();
		UserDaoImp u=new UserDaoImp(con);
		boolean a=u.emailVerify(email);
		boolean isValid;
		System.out.println(a);
		if(a==false){
			 isValid=true;
		boolean f=SendEmail.send(email, value.toString());
		if(f)
			System.out.println("success ");
		else {
			System.out.println("fail");
		}
		}
		else{
			//response.addHeader("error", "Please enter a Registered Email");
			s.setAttribute("error", "Yes");
			
			isValid=false;
			
		}
		HashMap<String, Object> h=new HashMap<String, Object>();
		h.put("isValid", isValid);
		write(response,h);
	}
	

	
	private void write(HttpServletResponse response, HashMap<String, Object> h) throws IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(new Gson().toJson(h));
		
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

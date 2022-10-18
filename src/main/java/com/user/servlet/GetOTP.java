package com.user.servlet;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.User;

/**
 * Servlet implementation class GetOTP
 */
public class GetOTP extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public GetOTP() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession s=request.getSession();
		String email=s.getAttribute("email").toString();
		String name=request.getParameter("username");
		String cno=request.getParameter("cno");
		String cvv=request.getParameter("cvv");
		
		
		//s.setAttribute("userobj", u);
		//String email=request.getParameter("email");
		System.out.println(email);
		System.out.println("Hello");
		Random r=new Random();
		Integer value=r.nextInt(600000-100000)+100000;
		s.setAttribute("OTP", value);
		
		//SendEmail se=new SendEmail();
		boolean f=SendEmail.send(email, value.toString());
		if(f){
			response.sendRedirect("onlinePayment.jsp");
		}
		else{
			response.sendRedirect("onlinePayment.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}

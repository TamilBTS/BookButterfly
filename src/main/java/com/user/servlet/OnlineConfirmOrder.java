package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookOrdersDaoImp;
import com.DB.DBConnect;
import com.entity.BookOrders;

/**
 * Servlet implementation class OnlineConfirmOrder
 */
public class OnlineConfirmOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession s=request.getSession();
		Integer otp=(Integer) s.getAttribute("OTP");
		int userOtp=Integer.parseInt(request.getParameter("otp"));
		if(otp==userOtp){
			System.out.println("success");
			ArrayList<BookOrders> orderList=(ArrayList<BookOrders>) s.getAttribute("orderList");
			BookOrdersDaoImp dao1 = new BookOrdersDaoImp(DBConnect.getConnection());
			boolean f = dao1.saveOrder(orderList);
			int id=(Integer)s.getAttribute("uid");
			if (f) {
				boolean f1 = dao1.deleteCart(id);
				if (f1) {
					s.setAttribute("sucmsg", "Order Placed Successfully...");
					response.sendRedirect("cart.jsp");
				}
			} else {
				s.setAttribute("failmsg", "Something went wrong..");
				response.sendRedirect("cart.jsp");
			}
			
		}
		else{
		    s.setAttribute("otpmsg", "Invalid OTP...Please Enter a valid OTP");
		    response.sendRedirect("onlinePayment.jsp");
		}
	}

}

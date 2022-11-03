package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.BookOrdersDaoImp;
import com.DB.DBConnect;

/**
 * Servlet implementation class UserOrderCancel
 */
public class UserOrderCancel extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int id=Integer.parseInt(request.getParameter("oid"));
		int bid=Integer.parseInt(request.getParameter("bid"));
		int q=Integer.parseInt(request.getParameter("q"));
		String status=request.getParameter("status");
		System.out.println("Status - "+status);
		System.out.println("OrderID "+id+"BookID "+bid+"Quantity "+q);
		BookOrdersDaoImp dao=new BookOrdersDaoImp(DBConnect.getConnection());
		boolean f;
		if("Accepted".equals(status)){
			 
			 f=dao.cancelOrder(id,bid,q);
		}
		else{
			f=dao.admincancelOrder(id);
		
		}
		if(f){
			System.out.println("success");
			response.sendRedirect("MyOrders.jsp");
		}
		else{
			System.out.println("failure");
			response.sendRedirect("MyOrders.jsp");
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

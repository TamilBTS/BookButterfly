package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.BookOrdersDaoImp;
import com.DB.DBConnect;
import com.entity.BookOrders;

/**
 * Servlet implementation class OrderStatus
 */
public class OrderStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("oid"));
		System.out.println(id);
		BookOrdersDaoImp dao=new BookOrdersDaoImp(DBConnect.getConnection());
		
		boolean f=dao.updateStatus(id);
		if(f){
			System.out.println("success");
			response.sendRedirect("admin/orders.jsp");
		}
		else{
			System.out.println("failure");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}

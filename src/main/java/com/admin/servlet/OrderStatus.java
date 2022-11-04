package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		int bid=Integer.parseInt(request.getParameter("bid"));
		int q=Integer.parseInt(request.getParameter("q"));
		System.out.println(id);
		BookOrdersDaoImp dao=new BookOrdersDaoImp(DBConnect.getConnection());
		HttpSession s=request.getSession();
		boolean f=dao.updateStatus(id,bid,q);
		if(f){
			System.out.println("success");
			response.sendRedirect("admin/orders.jsp");
		}
		else{
			s.setAttribute("emptystock", "nostock");
			System.out.println("failure");
			response.sendRedirect("admin/orders.jsp");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}

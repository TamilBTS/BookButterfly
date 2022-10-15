package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDaoImp;
import com.DB.DBConnect;

/**
 * Servlet implementation class RemoveBook
 */
public class RemoveBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int bid=Integer.parseInt(request.getParameter("bid"));
		int uid=Integer.parseInt(request.getParameter("uid"));
		int cid=Integer.parseInt(request.getParameter("cid"));
		
		CartDaoImp dao=new CartDaoImp(DBConnect.getConnection());
		boolean f=dao.removeBook(bid,uid,cid);
		
		HttpSession session=request.getSession();
		
		if(f){
			session.setAttribute("successmsg", "Removed from cart successfully");
			response.sendRedirect("cart.jsp");
		}
		else{
			session.setAttribute("failed", "Oops");
			response.sendRedirect("cart.jsp");
		}
		
	}

	
}

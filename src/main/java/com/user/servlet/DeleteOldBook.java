package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDaoImp;
import com.DB.DBConnect;


public class DeleteOldBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		try{
			
			String email=request.getParameter("email");
			int bid=Integer.parseInt(request.getParameter("bid"));
			BookDaoImp dao=new BookDaoImp(DBConnect.getConnection());
			
			boolean f=dao.OldBookDelete("Old Book", email,bid);
			
			if(f){
				session.setAttribute("sucmsg", "Book Deleted Successfully");
				response.sendRedirect("UserOldBooks.jsp");
			}
			else{
				session.setAttribute("failmsg", "Something went wrong");
				response.sendRedirect("UserOldBooks.jsp");
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	

}

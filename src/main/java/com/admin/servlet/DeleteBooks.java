package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDaoImp;
import com.DB.DBConnect;

/**
 * Servlet implementation class DeleteBooks
 */
public class DeleteBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			
			int id=Integer.parseInt(request.getParameter("id"));
			
			BookDaoImp dao=new BookDaoImp(DBConnect.getConnection());
			boolean f=dao.deleteBooks(id);

			HttpSession session=request.getSession();
			
			if(f){
				
				session.setAttribute("success", "Book Deleted Successfully");
				response.sendRedirect("admin/all_books.jsp");
				
			}
			else{
				session.setAttribute("failure", "Book does not deleted successfully");
				response.sendRedirect("admin/all_books.jsp");
			}
			
		}catch(Exception e){e.printStackTrace();}
		
		
		
	}

}

package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDaoImp;
import com.DB.DBConnect;
import com.entity.BookDetails;


public class EditBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Integer id=Integer.parseInt(request.getParameter("id"));
		String bookName=request.getParameter("bname");
		String author=request.getParameter("author");
		String price=request.getParameter("price");
		String status=request.getParameter("bstatus");
		
		BookDetails b=new BookDetails();
		
		b.setBookId(id);
		b.setBookName(bookName);
		b.setAuthor(author);
		b.setPrice(price);
		b.setStatus(status);
		
		BookDaoImp dao=new BookDaoImp(DBConnect.getConnection());
		boolean f=dao.updateBooks(b);
		
		
		HttpSession session=request.getSession();
		
		if(f){
			
			session.setAttribute("success", "Book Details Updated Successfully");
			response.sendRedirect("admin/all_books.jsp");
			
		}
		else{
			session.setAttribute("success", "Oops..Something went wrong");
			response.sendRedirect("admin/all_books.jsp");
		}
	}

}

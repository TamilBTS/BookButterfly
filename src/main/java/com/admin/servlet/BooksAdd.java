package com.admin.servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDaoImp;
import com.DB.DBConnect;
import com.entity.BookDetails;

@MultipartConfig
public class BooksAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public BooksAdd() {
        super();
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			String bookName=request.getParameter("bname");
			String author=request.getParameter("author");
			String price=request.getParameter("price");
			String bookCatagory=request.getParameter("btype");
			String status=request.getParameter("bstatus");
			Part part=request.getPart("bimg");
			String fileName= part.getSubmittedFileName();
			int stock=Integer.parseInt(request.getParameter("stock"));
			
			BookDetails b=new BookDetails(bookName,author,price,bookCatagory,status,fileName,stock,"admin");
			
			//System.out.print(b);
			
			BookDaoImp dao=new BookDaoImp(DBConnect.getConnection());
			
			
			
			
			
			boolean f=dao.addBooks(b);
			
			HttpSession session=request.getSession();
			
			if(f){
				
				String path=getServletContext().getRealPath("")+"books";
				
				File file=new File(path);
				
				part.write(path + File.separator + fileName);
																	
				session.setAttribute("success", "Book Added Successfully");
				response.sendRedirect("admin/add_books.jsp");
			}
			else{
				session.setAttribute("failure", "Oops..Something went wrong");
				response.sendRedirect("admin/add_books.jsp");
			}
			
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
			
		}
		
		
	}

}

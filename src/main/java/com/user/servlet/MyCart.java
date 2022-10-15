package com.user.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDaoImp;
import com.DAO.CartDaoImp;
import com.DB.DBConnect;
import com.entity.BookDetails;
import com.entity.Cart;

public class MyCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/plain");

		try {

			int bid = Integer.parseInt(request.getParameter("bid"));
			int uid = Integer.parseInt(request.getParameter("uid"));
			System.out.println(bid + " "+uid);

			BookDaoImp dao = new BookDaoImp(DBConnect.getConnection());

			BookDetails b = dao.getBooksById(bid);

			Cart c = new Cart();
			
			c.setBid(bid);
			c.setUserId(uid);
			c.setBookName(b.getBookName());
			c.setAuthor(b.getAuthor());
			c.setQuantity(1);
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalPrice(Double.parseDouble(b.getPrice()));
			c.setPhoto(b.getPhotoName());
			c.setQuantity(1);
			CartDaoImp c1 = new CartDaoImp(DBConnect.getConnection());
			boolean f = c1.addCart(c,bid,uid);
			
			HttpSession session=request.getSession();

			if (f) {
				session.setAttribute("addcart", "Book Added to cart successfully");
				
				response.sendRedirect("index.jsp");
				//RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
				//rd.forward(request, response);
				System.out.print("Added to cart");
			} else {
				session.setAttribute("failure", "Something Went Wrong");
				response.sendRedirect("index.jsp");
				System.out.print("Not Added to cart");
			}
			session.removeAttribute("BookID");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}


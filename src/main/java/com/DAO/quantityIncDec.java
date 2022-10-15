package com.DAO;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DB.DBConnect;
import com.entity.Cart;

/**
 * Servlet implementation class quantityIncDec
 */
public class quantityIncDec extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public quantityIncDec() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		int id = Integer.parseInt(request.getParameter("id"));
		int uid = Integer.parseInt(request.getParameter("uid"));
		int bid = Integer.parseInt(request.getParameter("bid"));
		CartDaoImp dao = new CartDaoImp(DBConnect.getConnection());
		List<Cart> list=dao.getBookByUser(uid);
		//ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");

		if (action != null && bid >= 1) {
			if (action.equals("inc")) {
				for (Cart c : list) {
					if (c.getBid() == bid) {
						int quantity = c.getQuantity();
						System.out.println(quantity);
						quantity++;
						c.setQuantity(quantity);
						System.out.println(quantity);
						dao.updateQuantity(quantity,uid,bid);
						response.sendRedirect("cart.jsp");
					}
				}
			}

			if (action.equals("dec")) {
				for (Cart c : list) {
					if (c.getBid() == bid && c.getQuantity() > 1) {
						int quantity = c.getQuantity();
						quantity--;
						c.setQuantity(quantity);
						dao.updateQuantity(quantity,uid,bid);
						break;
					}
				}
				response.sendRedirect("cart.jsp");
			}
		} else {
			response.sendRedirect("cart.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

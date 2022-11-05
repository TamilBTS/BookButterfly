package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookOrdersDaoImp;
import com.DB.DBConnect;

/**
 * Servlet implementation class DeliveryStatus
 */
public class DeliveryStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeliveryStatus() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("oid"));
		int bid=Integer.parseInt(request.getParameter("bid"));
		int q=Integer.parseInt(request.getParameter("q"));
		System.out.println(id);
		BookOrdersDaoImp dao=new BookOrdersDaoImp(DBConnect.getConnection());
		
		boolean f=dao.deliveryStatus(id);
		if(f){
			System.out.println("success");
			response.sendRedirect("admin/seller.jsp");
		}
		else{
			
			System.out.println("failure");
			response.sendRedirect("admin/seller.jsp");
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

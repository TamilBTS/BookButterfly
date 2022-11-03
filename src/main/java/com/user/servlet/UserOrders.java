package com.user.servlet;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookOrdersDaoImp;
import com.DAO.CartDaoImp;
import com.DB.DBConnect;
import com.entity.BookOrders;
import com.entity.Cart;

public class UserOrders extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			HttpSession session = request.getSession();
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("username");
			String email = request.getParameter("email");
			String phno = request.getParameter("phno");
			String address = request.getParameter("address");
			String landmark = request.getParameter("landmark");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String pincode = request.getParameter("pincode");
			String paymentType = request.getParameter("payment");
			String Total = request.getParameter("Total");
			
			

			/*String regex = "^[1-9]{1}[0-9]{2}\\s{0,1}[0-9]{3}$";

			Pattern p = Pattern.compile(regex);

			Matcher m = p.matcher(pincode);
			if (m.matches() != true) {
				session.setAttribute("failure", "Please Enter A Valid Pincode");
				response.sendRedirect("checkout.jsp");
			} else {*/

				String fullAddress = address + ", " + landmark + ", " + city + ", " + state + ", " + pincode;

				// System.out.println(name+" "+email+" "+phno+" "+fullAddress+"
				// "+Total+" "+paymentType+" "+id);

				CartDaoImp dao = new CartDaoImp(DBConnect.getConnection());
				List<Cart> list = dao.getBookByUser(id);
				BookOrdersDaoImp dao1 = new BookOrdersDaoImp(DBConnect.getConnection());

				BookOrders b = null;
				Random r = new Random();
				int i=r.nextInt(1000);

				ArrayList<BookOrders> orderList = new ArrayList<BookOrders>();
				
				DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		        DateTimeFormatter dtf2 = DateTimeFormatter.ofPattern("HH:mm:ss");
		        
		        LocalDate date=LocalDate.now();
		        LocalTime time=LocalTime.now();
				
				for (Cart c : list) {
					b = new BookOrders();
					b.setOrderId("BBF-ORD-0" + i);
					b.setUsername(name);
					b.setEmail(email);
					b.setPhno(phno);
					b.setFullAddress(fullAddress);
					b.setPaymentType(paymentType);
					b.setBookName(c.getBookName());
					b.setAuthor(c.getAuthor());
					b.setPrice(c.getPrice());
					b.setDate(dtf1.format(date));
					b.setTime(dtf2.format(time));
					b.setQuantity(c.getQuantity());
					b.setBid(c.getBid());
					orderList.add(b);

				}
				if(paymentType.equals("Online")){
					HttpSession s=request.getSession();
					s.setAttribute("tp", Total);
					s.setAttribute("uid", id);
					s.setAttribute("orderList", orderList);
					response.sendRedirect("onlinePayment.jsp");
				}
				else{
				boolean f = dao1.saveOrder(orderList);

				if (f) {
					boolean f1 = dao1.deleteCart(id);
					if (f1) {
						session.setAttribute("sucmsg", "Order Placed Successfully...");
						response.sendRedirect("cart.jsp");
					}
				} else {
					session.setAttribute("failmsg", "Something went wrong..");
					response.sendRedirect("cart.jsp");
				}
			}
			//}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}

package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDaoImp;
import com.DB.DBConnect;
import com.entity.User;

public class UpdateUserProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		HttpSession session = request.getSession();
		User us = (User) session.getAttribute("userobj");
		
		try {
			int uid = Integer.parseInt(request.getParameter("uid"));
			String oldemail = request.getParameter("email");
			String name = request.getParameter("Uname");
			String email = request.getParameter("Uemail");
			String phno = request.getParameter("Uphno");
			String pass = request.getParameter("Upass");

			if (phno.length() != 10) {
				session.setAttribute("failure", "Please Enter a valid phone number...");
				response.sendRedirect("EditProfile.jsp");
			}

			else {

				us.setId(uid);
				us.setEmail(email);
				us.setPhno(phno);
				us.setName(name);

				UserDaoImp dao = new UserDaoImp(DBConnect.getConnection());

				boolean f = dao.checkPass(uid, pass);

				if (f) {

					boolean f1 = dao.updateProfile(us, oldemail);
					if (f1) {
						HttpSession session1=request.getSession();
						session1.setAttribute("userobj",us);
						session.setAttribute("success", "Updated Successfully..");
						response.sendRedirect("EditProfile.jsp");
					} else {
						session.setAttribute("failure", "Something wrong on server");
						response.sendRedirect("EditProfile.jsp");
					}

				} else {

					session.setAttribute("failure", "Your Password is incorrect");
					response.sendRedirect("EditProfile.jsp");

				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

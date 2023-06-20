package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.userDAOimpl;
import com.DB.Dbconnect;
import com.entity.User;

@WebServlet("/register")
public class registerservlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phoneno = req.getParameter("phoneno");
			String password = req.getParameter("password");

			// this setname method will throw to get name(getters and setters)
			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhoneno(phoneno);
			us.setPassword(password);

			HttpSession session = req.getSession();

			userDAOimpl dao = new userDAOimpl(Dbconnect.getConn());
			

			boolean f2 = dao.checkUser(email);
			if (f2) {
				
				boolean f = dao.userRegister(us);
				if (f) {

					session.setAttribute("succMsg", "Registered Successfully");
					resp.sendRedirect("register.jsp");
				} else {
					session.setAttribute("failedMsg", "Something Went Wrong!");
					resp.sendRedirect("register.jsp");
				}
				
			}else {
				session.setAttribute("failedMsg", "Email is already registered");
				resp.sendRedirect("register.jsp");
				}
					

			

		}catch(

	Exception e)
	{
		e.printStackTrace();
	}
}

}

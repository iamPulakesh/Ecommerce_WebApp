package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAO;
import com.DAO.CartDAOImpl;
import com.DB.Dbconnect;
@WebServlet("/removeBook")
public class removeBookServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int mid=Integer.parseInt(req.getParameter("mid"));
		int uid=Integer.parseInt(req.getParameter("uid"));
		
		CartDAOImpl dao=new CartDAOImpl(Dbconnect.getConn());
		boolean f=dao.deleteMeds(mid,uid);
		
		HttpSession session=req.getSession();
		
		if(f) {
			
			session.setAttribute("succMsg", "Medicine Removed successfully");
			resp.sendRedirect("cart.jsp");
		}else {
			
			session.setAttribute("failedMsg", "Something Went Wrong");
			resp.sendRedirect("cart.jsp");
		}
		
	}
	
	

}

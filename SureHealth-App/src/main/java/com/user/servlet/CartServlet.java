package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DAO.MedicineDAOImpl;
import com.DB.Dbconnect;
import com.entity.Cart;
import com.entity.MedsDtls;
@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int mid=Integer.parseInt(req.getParameter("mid"));
			int uid=Integer.parseInt(req.getParameter("uid"));
			
			MedicineDAOImpl dao=new MedicineDAOImpl(Dbconnect.getConn());
			MedsDtls m=dao.getMedsById(mid);
			
			Cart c=new Cart();
			c.setMid(mid);
			c.setUid(uid);
			c.setMedsname(m.getMedsname());
			c.setExpdate(m.getDate());
			c.setPrice(m.getPrice());
			
			
			CartDAOImpl dao2=new CartDAOImpl(Dbconnect.getConn());
			boolean f=dao2.addCart(c);
			
			HttpSession session=req.getSession();
			
			if(f) {
				
				session.setAttribute("succMsg", "Succesfully Added to Cart");
				resp.sendRedirect("index.jsp");
			}else {
				
				session.setAttribute("failedMsg", "Something Went Wrong");
				resp.sendRedirect("index.jsp");
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}

	
}

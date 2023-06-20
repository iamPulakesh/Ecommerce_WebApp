package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DAO.medsOrderImpl;
import com.DB.Dbconnect;
import com.entity.Cart;
import com.entity.medsOrder;

@WebServlet("/order")
public class orderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			HttpSession session=req.getSession();
			int id=Integer.parseInt(req.getParameter("id"));
			
			String name=req.getParameter("username");
			String email=req.getParameter("mail");
			String phone=req.getParameter("phone");
			String address=req.getParameter("addr");
			String city=req.getParameter("city");
			String pin=req.getParameter("zip");
			String state=req.getParameter("state");
			String pay=req.getParameter("payment");
			
			String fullAddr=address+","+city+","+pin+","+state;
			
			//System.out.println(name+""+email+" "+phone+""+fullAddr+""+pay);
			
			CartDAOImpl dao=new CartDAOImpl(Dbconnect.getConn());
			List<Cart> mlist=dao.getMedsByUser(id);
			
			medsOrderImpl dao2=new medsOrderImpl(Dbconnect.getConn());
			
			
			medsOrder o=null;
			ArrayList<medsOrder> orderList=new ArrayList<>();
			
			Random r=new Random();
			for(Cart c:mlist) {
			o=new medsOrder();
			o.setOrder_id("MEDICINE_ID"+r.nextInt(500));
			o.setName(name);
			o.setEmail(email);
			o.setFulladdress(fullAddr);
			o.setMedsname(c.getMedsname());
			o.setPrice(c.getPrice()+"");
			o.setPay(pay);
			
			orderList.add(o);
			
			
			
			}
			
			if ("noselect".equals(pay)) {
				session.setAttribute("failedMsg", "Please Enter Payment Method");
				resp.sendRedirect("cart.jsp");
				
			}else {
				
				boolean f=dao2.saveOrder(orderList);
				if(f) {
					resp.sendRedirect("order_success.jsp");
				}
				
			}
			
		} catch (Exception e) {
		e.printStackTrace();
		}
	}
	
	

}

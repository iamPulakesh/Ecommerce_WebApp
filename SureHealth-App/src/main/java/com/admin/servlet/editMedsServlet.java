package com.admin.servlet;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.MedicineDAOImpl;
import com.DB.Dbconnect;
import com.entity.MedsDtls;

@WebServlet("/editMeds")

public class editMedsServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			int id=Integer.parseInt(req.getParameter("id"));
			
			String medicinesname = req.getParameter("mname");
			String manufacturer = req.getParameter("mby");
			String date = req.getParameter("date");
			String Category = req.getParameter("mtype");
			String price = req.getParameter("price");
			String units = req.getParameter("units");
			
			
			MedsDtls m=new MedsDtls();
			m.setMedsid(id);
			m.setMedsname(medicinesname);
			m.setCategory(Category);
			m.setDate(date);
			m.setUnits(units);
			m.setManufacturedby(manufacturer);
			m.setPrice(price);
			
			
			MedicineDAOImpl dao= new MedicineDAOImpl(Dbconnect.getConn());
			boolean f=dao.updateEditMeds(m);
			
			HttpSession session =req.getSession();
			
			if (f) {
				session.setAttribute("succMsg", "Updated Successfully");
				resp.sendRedirect("admin/all_products.jsp");
			} else {
				session.setAttribute("failedMsg", "Something Went Wrong");
				resp.sendRedirect("admin/all_products.jsp");
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}

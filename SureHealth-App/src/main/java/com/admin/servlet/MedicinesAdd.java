package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.MedicineDAOImpl;
import com.DB.Dbconnect;
import com.entity.MedsDtls;

@WebServlet("/add_medicines")

public class MedicinesAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			String medicinesname = req.getParameter("mname");
			String manufacturer = req.getParameter("mby");
			String date = req.getParameter("date");
			String Category = req.getParameter("mtype");
			String units = req.getParameter("units");
			String email=req.getParameter("email");
			String price=req.getParameter("price");

			MedsDtls m = new MedsDtls(medicinesname, manufacturer, date, Category, units, email, price);//create object with extracted values
			
			HttpSession session=req.getSession();
			MedicineDAOImpl dao=new MedicineDAOImpl(Dbconnect.getConn());//add the medicine to the database.
			
			boolean f=dao.addMedicines(m);
			
		
		
		if(f) {
		session.setAttribute("succMsg", "Medicine Added Successfully");
		resp.sendRedirect("admin/add_medicines.jsp");
		
		}else {
			session.setAttribute("failedMsg","Something Went Wrong");
			resp.sendRedirect("admin/add_medicines.jsp");
		}
		
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

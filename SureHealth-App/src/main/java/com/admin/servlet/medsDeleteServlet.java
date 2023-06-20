package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.MedicineDAOImpl;
import com.DB.Dbconnect;

@WebServlet("/delete")
public class medsDeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			MedicineDAOImpl dao = new MedicineDAOImpl(Dbconnect.getConn());
			boolean f = dao.deleteMeds(id);

			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("succMsg", "Deleted Successfully");
				resp.sendRedirect("admin/all_products.jsp");
			} else {
				session.setAttribute("failedMsg", "Something Went Wrong");
				resp.sendRedirect("admin/all_products.jsp");

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}

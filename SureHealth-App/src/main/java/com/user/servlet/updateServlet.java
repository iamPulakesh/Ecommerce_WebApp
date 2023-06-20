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
import com.mysql.cj.Session;
@WebServlet("/updateProfile")
public class updateServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phoneno = req.getParameter("phoneno");
			String password = req.getParameter("password");
			
			User us=new User();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhoneno(phoneno);
			
			HttpSession session = req.getSession();
			userDAOimpl dao= new userDAOimpl(Dbconnect.getConn());
			
			boolean f=dao.checkPass(id, password);
			if(f) {
				boolean f2=dao.updateProfile(us);
				if(f2) {
					session.setAttribute("succMsg", "Profile Updated Successfully");
					resp.sendRedirect("editProfile.jsp");
				}else {
					session.setAttribute("failedMsg", "Something went wrong");
					resp.sendRedirect("editProfile.jsp");
				}
				
			}else {
				session.setAttribute("failedMsg", "Wrong Password,Try Again");
				resp.sendRedirect("editProfile.jsp");
				
			}
			
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}
	

}

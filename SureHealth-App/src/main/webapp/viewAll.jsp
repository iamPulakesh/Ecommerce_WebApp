<%@page import="com.entity.MedsDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.Dbconnect"%>
<%@page import="com.DAO.MedicineDAOImpl"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Medicines</title>
<%@include file="all_component/allCss.jsp"%>

</head>
<body>
	<%
	User u = (User) session.getAttribute("userobj");
	%>
	
		
	<%@include file="all_component/navBar.jsp"%>
	<div class="container">
		<div class="row mt-2">


			<%
			MedicineDAOImpl dao = new MedicineDAOImpl(Dbconnect.getConn());
			List<MedsDtls> list = dao.viewAllMeds();//show all medicines
			for (MedsDtls m : list) {
			%>
			<div class="col-md-3.5 ml-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<h5 class="text-center b"><%=m.getMedsname()%></h5>
						<p>
							Category:<%=m.getCategory()%></p>
						<p>
							Best Before:<%=m.getDate()%></p>
						<p>
							Available Units:<%=m.getUnits()%></p>
						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-success btn-sm ml-3"><i
								class="fa-solid fa-cart-plus"></i>Add to Cart</a>
							<%
							} else {
							%>
							<a href="cart?mid=<%=m.getMedsid()%>&&uid=<%=u.getId()%>"
								class="btn btn-success btn-sm ml-3"><i
								class="fa-solid fa-cart-plus"></i>Add to Cart</a>
							<%
							}
							%>

							<a href="" class="btn btn-danger btn-sm ml-1 "><%=m.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>

						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
	</div>

</body>
</html>
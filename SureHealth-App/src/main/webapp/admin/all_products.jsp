<%@page import="com.entity.MedsDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.Dbconnect"%>
<%@page import="com.DAO.MedicineDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Medicines</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navBar.jsp"%>

	<h3 class="text-center">List of all products</h3>

	<c:if test="${not empty succMsg }">
		<h4 class="text-center text-success">${succMsg }</h4>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg }">
		<h4 class="text-center text-danger">${failedMsg}</h4>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<table class="table table-striped">
		<thead class=" bg-success">
			<tr class="text-white">
				<th scope="col">No.</th>
				<th scope="col">Medicine Name</th>
				<th scope="col">Manufacturer's Name</th>
				<th scope="col">Best Before</th>
				<th scope="col">Price</th>
				<th scope="col">Category</th>
				<th scope="col">Units</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>

			<%
			MedicineDAOImpl dao = new MedicineDAOImpl(Dbconnect.getConn());
			List<MedsDtls> list = dao.getAllMeds();
			for (MedsDtls m : list) {
			%>

			<tr>
				<td><%=m.getMedsid()%></td>
				<td><%=m.getMedsname()%></td>
				<td><%=m.getManufacturedby()%></td>
				<td><%=m.getDate()%></td>
				<td><%=m.getPrice()%></td>
				<td><%=m.getCategory()%></td>
				<td><%=m.getUnits()%></td>
				<td><a href="editMeds.jsp?id=<%=m.getMedsid()%>"
					class="btn btn-sm btn-warning">Edit</a> 
					<a href="../delete?id=<%= m.getMedsid() %>"
					class="btn btn-sm btn-danger">Delete</a></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	
	<div style="margin-top: 256px;"><%@include file="footer.jsp"%></div>
</body>
</html>
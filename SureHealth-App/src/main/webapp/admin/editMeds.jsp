<%@page import="com.entity.MedsDtls"%>
<%@page import="com.DB.Dbconnect"%>
<%@page import="com.DAO.MedicineDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>	


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Medicines</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navBar.jsp"%>

	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Medicines</h4>

				

						<%
						int id = Integer.parseInt(request.getParameter("id"));
					MedicineDAOImpl dao=new MedicineDAOImpl(Dbconnect.getConn());
						MedsDtls m=dao.getMedsById(id);
						%>

						<form action="../editMeds" method="post">
						<input type="hidden" name="id" value="<%=m.getMedsid()%>">

							<div class="form-group">
								<label>Medicine Name</label><input name="mname" type="text"
									class="form-control" id="exampleName" value="<%=m.getMedsname()%>">
							</div>
							<div class="form-group">
								<label>Medicine Category</label><select id="inputstate"
									name="mtype" class="form-control" id="exampleCategory" value="<%=m.getCategory()%>">
									<option selected>--Choose--</option>
									<option value="Painkillers">Painkillers</option>
									<option value="Inhalers">Inhalers</option>
									<option value="Coldcures">Cold Cures</option>
									<option value="Sedatives">Sedatives</option>
									<option value="Vitamins">Vitamins</option>
									<option value="Stimulant">Stimulant</option>
								</select>

							</div>

							<div class="form-group">
								<label>Manufactured by</label><input name="mby" type="text"
									class="form-control" id="exampleManufacture" value="<%=m.getManufacturedby()%>">
							</div>
							<div class="form-group">
								<label>Expiry Date</label><input name="date" type="date" 
									class="form-control" id="examplePrice" value="<%=m.getDate()%>">
							</div>
							<div class="form-group">
								<label>Price</label><input name="price" type="number" step=0.01
									class="form-control" id="exampleUnits" value="<%=m.getPrice()%>">
							</div>
							<div class="form-group">
								<label>Units</label><input name="units" type="number"
									class="form-control" id="exampleUnits" value="<%=m.getUnits()%>">
							</div>
							
							
					
							



							<div class="text-center">
								<button type="add" class="btn btn-warning">Update</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>
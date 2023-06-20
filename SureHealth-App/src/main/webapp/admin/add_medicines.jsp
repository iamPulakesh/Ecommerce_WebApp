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
<title>Add Medicines</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navBar.jsp"%>

	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Add Medicines</h4>


						<form action="../add_medicines" method="post"
							enctype="multiport/form-data">

							<div class="form-group">
								<label>Medicine Name</label><input name="mname" type="text"
									class="form-control" id="exampleName">
							</div>
							<div class="form-group">
								<label>Medicine Category</label><select id="inputstate"
									name="mtype" class="form-control" id="exampleCategory">
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
									class="form-control" id="exampleManufacture">
							</div>
							<div class="form-group">
								<label>Expiry Date</label><input name="date" type="date"
									min="2008-01-01" max="2050-12-31" class="form-control"
									id="examplePrice">

								<div class="form-group">
									<label>Price</label><input name="price" type="text" step=0.01
										class="form-control" id="exampleUnits">
								</div>
							</div>
							<div class="form-group">
								<label>Units</label><input name="units" type="number"
									class="form-control" id="exampleUnits">
							</div>

							<div class="form-group">
								<label>Prescribed by</label><input name="email" type="text"
									class="form-control" id="exampleUnits">
							</div>



							<div class="text-center">
								<button type="add" class="btn btn-success">Add</button>
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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Home</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navBar.jsp"%>
	<div class="container text-center p-2">
		<div class="row">
			<div class="col-md-4 text-success">
				<a href="add_medicines.jsp">
					<div class="card">
						<div class="card-body text-center">
							<script src="https://cdn.lordicon.com/ritcuqlt.js"></script>
							<lord-icon src="https://cdn.lordicon.com/mecwbjnp.json"
								trigger="hover" style="width:250px;height:250px"> </lord-icon>
							<br>
							<h4>Add Medicines</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 text-info">
				<a href="all_products.jsp">
					<div class="card">
						<div class="card-body text-center">
							<script src="https://cdn.lordicon.com/ritcuqlt.js"></script>
							<lord-icon src="https://cdn.lordicon.com/hbjlznlo.json"
								trigger="hover" style="width:250px;height:250px"> </lord-icon>
							</i><br>
							<h4>All Products</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 text-danger">
				<a href="../logout">

					<div class="card">
						<div class="card-body text-center">
							<script src="https://cdn.lordicon.com/ritcuqlt.js"></script>
							<lord-icon src="https://cdn.lordicon.com/moscwhoj.json"
								trigger="hover" style="width:250px;height:250px"> </lord-icon>
							</i><br>

							<h4>Logout</h4>


						</div>
					</div>
				</a>
			</div>
		</div>
	</div>


</body>
</html>
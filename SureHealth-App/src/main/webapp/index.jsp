
<%@page import="com.entity.MedsDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.Dbconnect"%>
<%@page import="com.DAO.MedicineDAOImpl"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SureHealth</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/cover.png");
	height: 70vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #ebfaf5;
}

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
</head>


<body style="background-color: #ededed">

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<c:if test="${not empty addCart}">
		<div id="toast">${addCart}</div>

		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>
	</c:if>

	<%@include file="all_component/navBar.jsp"%>
	<div class="container-fluid back-img"></div>


	<!-- Start Medicine -->

	<div class="container">
		<h1 class="text-center mt-2">Medicines</h1>
		<div class="row">


			<%
			MedicineDAOImpl dao = new MedicineDAOImpl(Dbconnect.getConn());
			List<MedsDtls> list = dao.viewMeds();//get list of the medicines details from the database
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
		<div class="text-center mt-2">
			<a href="viewAll.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>
	</div>
	<!-- end medicine -->
	<hr>


	<!-- Start of Lab tests -->

<!-- 	<div class="container">
		<h1 class="text-center mt-3">Diagnostics Tests</h1>
		<div class="row">
			<div class="col-md-3.5 ml-4">
				<div class="card crd-ho">
					<div class="card-body text-center">

						<h5 class="text-center b">Thyroid Profile Test</h5>
						<p>Categories: Test</p>
						<p>Price 700</p>
						<div class="row">
							<a href="" class="btn btn-success btn-sm ml-3"><i
								class="fa-solid fa-cart-plus"></i>Add to Cart</a> <a href=""
								class="btn btn-danger btn-sm ml-1">Buy</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3.5 ml-4">
				<div class="card crd-ho">
					<div class="card-body text-center">

						<h5 class="text-center b">Uric Acid Serum</h5>
						<p>Categories: Test</p>
						<p>Price 250</p>
						<div class="row">
							<a href="" class="btn btn-success btn-sm ml-3"><i
								class="fa-solid fa-cart-plus"></i>Add to Cart</a> <a href=""
								class="btn btn-danger btn-sm ml-1">Buy</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3.5 ml-4">
				<div class="card crd-ho">
					<div class="card-body text-center">

						<h5 class="text-center b">Lipid Profile Test</h5>
						<p>Categories: Test</p>
						<p>Price 500</p>
						<div class="row">
							<a href="" class="btn btn-success btn-sm ml-3"><i
								class="fa-solid fa-cart-plus"></i>Add to Cart</a> <a href=""
								class="btn btn-danger btn-sm ml-1">Buy</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3.5 ml-4">
				<div class="card crd-ho">
					<div class="card-body text-center">

						<h5 class="text-center b">Blood Count Lab Test</h5>
						<p>Categories: Test</p>
						<p>Price 400</p>
						<div class="row">
							<a href="" class="btn btn-success btn-sm ml-3"><i
								class="fa-solid fa-cart-plus"></i>Add to Cart</a> <a href=""
								class="btn btn-danger btn-sm ml-1">Buy</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3.5 ml-4">
				<div class="card crd-ho">
					<div class="card-body text-center">

						<h5 class="text-center b">Lipid Profile Test</h5>
						<p>Categories: Test</p>
						<p>Price 500</p>
						<div class="row">
							<a href="" class="btn btn-success btn-sm ml-3"><i
								class="fa-solid fa-cart-plus"></i>Add to Cart</a> <a href=""
								class="btn btn-danger btn-sm ml-1">Buy</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="text-center mt-2">
			<a href"" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div> -->
	<!-- End of Lab tests -->


	<%@include file="all_component/footer.jsp"%>

</body>


</html>
<%@page import="com.entity.MedsDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.Dbconnect"%>
<%@page import="com.DAO.MedicineDAOImpl"%>
<%@page import="com.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<div class="container-fluid p-3">
	<div class="row">
		<div="col-md-3text-success">
			<h3>
				<i class="fa-solid fa-heart-pulse text-success"></i>SureHealth
			</h3>
		</div>
		<div class="col-md-6">

			<form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
				<input class="form-control mr-sm-2" type="search" name="ch"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>

		<c:if test="${not empty userobj}">
			<div class="col-md-3">
			<a href="cart.jsp" class=""><i class="fas fa-cart-plus fa-2x" aria-hidden="true"></i></a>
			
				<a href="" class="btn btn-success"><i class="fas fa-user" ></i>${userobj.name}</a> 
					
					<a href="login.jsp"
					class="btn btn-primary" ><i
					class="fas fa-sign-in-alt"></i>Logout</a>
			</div>
		</c:if>


		<c:if test="${empty userobj}">
			<div class="col-md-3 mt-2" >
			
			<a href="index.jsp"></a>
			
				<a href="login.jsp" class="btn btn-success"><i
					class="fa-solid fa-right-to-bracket"></i> Login</a> <a
					href="register.jsp" class="btn btn-primary"><i
					class="fa-solid fa-user-plus"></i> Register</a>
			</div>
		</c:if>


	</div>
</div>


<nav class="navbar navbar-expand-lg navbar-light bg-custom">
	<a class="navbar-brand" href="#"><i
		class="fa-sharp fa-solid fa-prescription"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp"><i
					class="fa-solid fa-house mr-1"></i>Home <span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="viewAll.jsp"><i class="fa-sharp fa-solid fa-pills mr-2"></i>Medicines</a></li>
			<li class="nav-item active"><a class="nav-link" href="DiagTest.jsp"><i
					class="fa-solid fa-flask-vial mr-2"></i>Diagnostics Tests</a></li>

			<li class="nav-item active"><a class="nav-link disabled"
				href="https://www.medscape.com/"><i
					class="fa-solid fa-newspaper mr-2"></i>News</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<a href="setting.jsp" class="btn btn-light my-2 my-sm-0" type="submit">
				<i class="fa-solid fa-gear mr-2"></i>Settings
			</a>
			<button class="btn btn-light my-2 my-sm-0 ml-1" type="submit">
				<i class="fa-solid fa-address-card mr-2"></i>About Us
			</button>
		</form>
	</div>
</nav>
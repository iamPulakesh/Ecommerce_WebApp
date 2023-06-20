<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Settings</title>
<%@include file="all_component/allCss.jsp"%>

<style type="text/css">
a {
	color: black;
}

a:hover {
	text-decoration: none;
}
</style>
</head>
<body style="background-color: #ededed">
	<%@include file="all_component/navBar.jsp"%>

	<div class="container">
		<h2 class="text-center">Hello</h2>
		<div class="row p-3">
			<div class="col-md-6">
				<a href="editProfile.jsp">
					<div class="card crd-ho">
						<div class="card-body text-center text-primary">
							<div class="text-primary">
								<i class="fa-solid fa-id-card fa-3x"></i>
							</div>
							<h3 style="color: black">Edit Profile</h3>
							<h6 style="color: black">Change Email or Password</h6>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-6 ">
				<a href="address.jsp">
					<div class="card crd-ho">
						<div class="card-body text-center text-primary">
							<div class="text-success">
								<i class="fa-solid fa-location-dot fa-3x"></i>
							</div>
							<h3 style="color: black">Your Address</h3>
							<h6 style="color: black">Edit Your Address</h6>
						</div>
					</div>
				</a>
			</div>
				<div class="col-md-6">
				<a href="">
					<div class="card crd-ho">
						<div class="card-body text-center text-primary">
							<div class="text-danger">
								<i class="fa-solid fa-box-open fa-3x"></i>
							</div>
							<h3 style="color: black">My Orders</h3>
							<h6 style="color: black">Track Your Order</h6>
						</div>
					</div>
				</a>
			</div>
			
				<div class="col-md-6">
				<a href="help.jsp">
					<div class="card crd-ho">
						<div class="card-body text-center text-primary">
							<div class="text-warning">
							<i class="fa-solid fa-question fa-3x"></i>
							</div>
							<h3 style="color: black">Help Center</h3>
							<h6 style="color: black">24*7 Service</h6>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	

	<%@include file="all_component/footer.jsp"%>
</body>
</html>
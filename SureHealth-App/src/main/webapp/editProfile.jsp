<%@page import="com.entity.MedsDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.Dbconnect"%>
<%@page import="com.DAO.MedicineDAOImpl"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
<%@include file="all_component/allCss.jsp"%>

</head>
<body style="background-color: #F0F1F2">
	<%@include file="all_component/navBar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-2">
					<div class="card-body">
					
					<h4 class="text-center">Edit Details</h4>
					<c:if test="${not empty succMsg}">
					<p class="text-center text-success">${succMsg}</p>
					<c:remove var="succMsg" scope="session"/>
					</c:if>
					
					<c:if test="${not empty failedMsg}">
					<p class="text-center text-danger">${failedMsg}</p>
					<c:remove var="failedMsg" scope="session"/>
					</c:if>
					
					<form action="updateProfile" method="post">
					
					<input type="hidden" value="${userobj.id }" name="id">

							<div class="form-group">
								<label for="exampleInputEmail1">Enter Your Name*</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="${userobj.name}" name="name">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email*</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="${userobj.email }" name="email">

							</div>
							
							<div class="form-group">
								<label for="exampleInputEmail1">Mobile No*</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="${userobj.phoneno }" name="phoneno">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password*</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="******" name="password">
							</div>
							
							<div class="text-center">
							<button type="submit" class="btn btn-success">Update</button>
							</div>
						</form>
					
					</div>
				</div>
			</div>
		</div>
	</div>
<%@include file="all_component/footer.jsp" %>
</body>
</html>
<%@page import="com.entity.MedsDtls"%>
<%@page import="com.entity.Cart"%>
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
<title>Cart</title>
<%@include file="all_component/allCss.jsp"%>

</head>
<body>
<body style="background-color: #F0F1F2">
	<%@include file="all_component/navBar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>

	</c:if>


	<c:if test="${not empty succMsg }">
		<div class="alert alert-success" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>
	
	<c:if test="${not empty failedMsg }">
		<div class="alert alert-danger text-center" role="alert">${failedMsg}</div>
		<c:remove var="failedMsg" scope="session" />
	</c:if>



	<div class="container">
		<div class="row">
			<div class="col-md-6">


				<div class="card bg-white mt-2">
					<div class="card=body">
						<h3 class="text-center text-success">Your Selected Item</h3>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Medicine Name</th>
									<th scope="col">Price</th>
									<th scope="col">Expiry Date</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								User u = (User) session.getAttribute("userobj");
								CartDAOImpl dao = new CartDAOImpl(Dbconnect.getConn());
								List<Cart> cart = dao.getMedsByUser(u.getId());

								for (Cart c : cart) {
								%>

								<tr>
									<th scope="row"><%=c.getMedsname()%></th>
									<td><%=c.getPrice()%></td>
									<td><%=c.getExpdate()%></td>
									<td><a href="removeBook?mid=<%=c.getMid()%>&&uid=<%=c.getUid()  %>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>

								<%
								}
								%>


							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card  mt-2">
					<div class="card-body">
						<h3 class="text-center text-danger">Your Order Details</h3>
						<form action="order" method="post">
						
						<input type="hidden" value="${userobj.id}" name="id">
						
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text" name="username"
										class="form-control" id="inputEmail4" value="<%=u.getName()%>"readonly="readonly">
								</div>
								<div class="form-group col-md-6">/
								
									<label for="inputPassword4">Email</label> <input type="email" name="mail"
										class="form-control" id="inputPassword4" value="<%=u.getEmail()%>"readonly="readonly">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Phone No</label> <input type="number" name="phone"
										class="form-control" id="inputEmail4" value="<%=u.getPhoneno()%>"readonly="readonly">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text" name="addr"
										class="form-control" id="inputPassword4">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">City</label> <input type="text" name="city"
										class="form-control" id="inputEmail4">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Pin Code</label> <input
										type="number" name="zip" class="form-control" id="inputPassword4">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">State</label> <input type="text" name="state"
										class="form-control" id="inputPassword4">
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword4">Select Payment Mode</label> <select
									class="form-control" name="payment">
									<option value="noselect">---Select---</option>
									<option value="cod">COD</option>
								</select>
							</div>
							<div class="text-center">
							<a href="order_success.jsp">
								<button class="btn btn-warning">Order Now</button>
								</a>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Address Page</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #F0F1F2">
	<%@include file="all_component/navBar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-2">
					<div class="card-body">

						<form>

							<div class="form-group">
								<label for="inputAddress">Address</label> <input type="text"
									class="form-control" id="inputAddress"
									placeholder="EXAMPLE :177 MAIN STREET,LITTLETON">
							</div>
					</div>
					<div class="form-row mt-2">
						<div class="form-group col-md-5 ml-4">
							<label for="inputCity">Pin Code</label> <input type="number"
								class="form-control" id="inputCity">
						</div>
						<div class="form-group col-md-5">
							<label for="inputState">State</label> <select id="inputState"
								class="form-control">
								<option selected>Choose...</option>
								<option>Kolkata</option>
								<option>Gujarat</option>
								<option>Delhi</option>
								<option>Punjab</option>
								<option>Mumbai</option>
								<option>Chennai</option>
								<option>Hyderabad</option>
								<option>Bihar</option>
								<option>Rajastan</option>
								<option>Kerala</option>
								<option>Odisha</option>
								<option>Uttar Pradesh</option>
							</select>
						</div>
					</div>
					<div class="form-group col-md-12">
						<label for="inputZip">City</label> <input type="text"
							class="form-control" id="inputZip">
					</div>


					<button type="submit" class="btn btn-success">Add</button>
					</form>

				</div>
			</div>
		</div>
	</div>

	<%@include file="all_component/footer.jsp"%>
</body>
</html>
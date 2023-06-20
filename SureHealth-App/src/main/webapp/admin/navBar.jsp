<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<div class="container-fluid p-3">
	<div class="row">
		<div ="col-md-3  text-success">
			<h3><i class="fa-solid fa-heart-pulse text-success"></i>SureHealth</h3>
		</div>
		<div class="col-md-6">

			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div> 
		
	</div>

</div>


<nav class="navbar navbar-expand-lg navbar-light bg-custom">
	<a class="navbar-brand" href="#"><i class="fa-sharp fa-solid fa-prescription"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="home.jsp"><i class="fa-solid fa-house"></i>Home
					<span class="sr-only">(current)</span>
			</a></li>

	
	</div>
</nav>
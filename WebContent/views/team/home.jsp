<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<title>Team Home</title>
</head>
<body style="background-color: rgb(237, 238, 240);">
	<!-- Navbar -->
	<jsp:include page="/views/general/navbar.jsp"></jsp:include>
	
	<!-- Secondary Navbar -->
	<jsp:include page="/views/team/nav.jsp"></jsp:include>
	
	<div class="container-fluid px-5">
		<div class="row">
			<div class="col-6">
				<div class="row pr-3">
					<div class="card w-100">
						<img class="card-img-top" src="https://www.w3schools.com/w3css/img_lights.jpg" alt="Card image cap">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
						</div>
					</div>
				</div>
				<div class="row pr-3 my-3 d-flex justify-content-between">
					<div class="card" style="width:32%;">
						<img class="card-img-top" src="https://timedotcom.files.wordpress.com/2015/07/earth-blue-marble-2002.jpg" alt="Card image cap" style="width:100%;height:10vw;object-fit: cover;">
						<div class="card-body" style="padding:0.5rem;">
							<p class="card-text">Shorter title</p>
						</div>
					</div>
					<div class="card" style="width:32%;">
						<img class="card-img-top" src="https://www.w3schools.com/w3css/img_lights.jpg" alt="Card image cap" style="width:100%;height:10vw;object-fit: cover;">
						<div class="card-body" style="padding:0.5rem;'">
							<p class="card-text">Here is a longer title, let's see how it handles it</p>
						</div>
					</div>
					<div class="card" style="width:32%;">
						<img class="card-img-top" src="https://www.w3schools.com/w3css/img_lights.jpg" alt="Card image cap" style="width:100%;height:10vw;object-fit: cover;">
						<div class="card-body" style="padding:0.5rem;">
							<h5 class="card-title">Card title</h5>
						</div>
					</div>
				</div>
			</div>
			<div class="col-6">
				<div class="row pl-3">
					<h5>test3</h5>
				</div>
				<div class="row pl-3">
					<h5>test4</h5>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
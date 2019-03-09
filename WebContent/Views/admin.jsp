<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<title>ADA Connect Admin Console</title>
</head>
<body>
	<!-- Navbar -->
	<jsp:include page="../Components/navbar.jsp"></jsp:include>

	<div class="container-fluid">
		<c:set var = "user" value = "${sessionScope.user}" />
		<c:choose>
			<c:when  test="${user == null}">
				<h1>Error!!</h1>
				<a href="login" class="btn btn-primary">Log in</a>
			</c:when>
			<c:otherwise>
				<h1> Add a new user </h1>
				<form action="admin" method="post">
					<div class="form-row">
			  			<div class="form-group col-lg-3">
			    			<label for="first-name">First Name:</label>
			    			<input type="text" class="form-control" id="first-name" name="first-name" required>
			  			</div>
					</div>
					<div class="form-row">
			  			<div class="form-group col-lg-3">
			    			<label for="last-name">Last Name:</label>
			    			<input type="text" class="form-control" id="last-name" name="last-name" required>
			  			</div>
					</div>
					<div class="form-row">
						<div class="form-group col-lg-3">
			            	<label for="role">Role:</label>
			                <select class="form-control" name='role' id="role" required>
			                	<option></option>
			                	<option>CEO</option>
			                    <option>Regional Coordinator</option>
			                    <option>Team Leader</option>
			                </select>
			            </div>
					</div>
					<div class="form-row">
			  			<div class="form-group col-lg-3">
			    			<label for="username">Username:</label>
			    			<input type="text" class="form-control" id="username" name="username" required>
			  			</div>
					</div>
					<div class="form-row">
			  			<div class="form-group col-lg-3">
			    			<label for="password">Password:</label>
			    			<input type="text" class="form-control" id="password" name="password" required>
			  			</div>
					</div>
		  			<button type="submit" class="btn btn-primary">Submit</button>
				</form>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>
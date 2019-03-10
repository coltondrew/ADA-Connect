<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<title>ADA Connect Login</title>
</head>
<body>
	<!-- Navbar -->
	<jsp:include page="/views/navbar.jsp"></jsp:include>
	
	<!-- Login  -->
	<div class="container-fluid">
<%-- 		<c:set var = "user" value = "${sessionScope.user}" /> --%>
<%-- 		<c:if test = "${user != null}" > --%>
<%-- 			<c:out value = "${user.username}"/> --%>
<%-- 		</c:if> --%>
		<h1>Log in</h1>
		<c:set var = "invalidCreds" value = "${requestScope.invalidUserCreds}" />
		<c:if test = "${invalidCreds != null}" >
			<p style="color:red;">Invalid username or password! Please try again!</p>
		</c:if>	
		<form action="/ADA-Connect/login" method="post">
			<div class="form-row">
	  			<div class="form-group col-lg-3">
	    			<label for="username">Username:</label>
	    			<input type="text" class="form-control" id="username" name="username" required>
	  			</div>
			</div>
			<div class="form-row">
	  			<div class="form-group col-lg-3">
	    			<label for="password">Password:</label>
	    			<input type="password" class="form-control" id="password" name="password" required>
	  			</div>
			</div>
  			<button type="submit" class="btn btn-primary" id ="loginbutton">Submit</button>
		</form>
	</div>
</body>
</html>
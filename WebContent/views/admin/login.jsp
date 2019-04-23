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
	<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/resources/img/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/resources/img/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/img/favicon-16x16.png">
	<link rel="manifest" href="${pageContext.request.contextPath}/resources/img/site.webmanifest">
	<title>ADA Connect Login</title>
	<style>
		.form-signin {
		    width: 100%;
		    max-width: 370px;
		    padding: 15px;
		    margin: 0 auto;
		}
	</style>
</head>
<body>
	<!-- Navbar -->
	<jsp:include page="/views/general/navbar.jsp"></jsp:include>
	
	<!-- Login  -->
	<div class="container-fluid text-center">
		<form class="form-signin" action="${pageContext.request.contextPath}/admin/login" method="post">
			<h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
			
			<label for="inputUsername" class="sr-only">Username</label>
			<input type="text" id="inputUsername" class="form-control" placeholder="Username" name="username" required autofocus>
			
			<label for="inputPassword" class="sr-only">Password</label>
			<input type="password" id="inputPassword" class="form-control" placeholder="Password" name="password" required>
			
			<c:set var="invalidCreds" value="${requestScope.invalidUserCreds}" />
			<c:if test="${invalidCreds != null}" >
				<p class="mt-3" style="color:red;">Invalid username or password! Please try again!</p>
			</c:if>	
<!-- 			<div class="checkbox mb-3"> -->
<!-- 			<label> -->
<!-- 				<input type="checkbox" value="remember-me"> Remember me -->
<!-- 			</label> -->
<!-- 			</div> -->
			<button class="btn btn-lg btn-primary btn-block mt-3" type="submit" style="background-color:#168d65;border-color:#168d65">Sign in</button>
<!-- 			<div class="form-row"> -->
<!-- 	  			<div class="form-group col-lg-3"> -->
<!-- 	    			<label for="username">Username:</label> -->
<!-- 	    			<input type="text" class="form-control" id="username" name="username" required> -->
<!-- 	  			</div> -->
<!-- 			</div> -->
<!-- 			<div class="form-row"> -->
<!-- 	  			<div class="form-group col-lg-3"> -->
<!-- 	    			<label for="password">Password:</label> -->
<!-- 	    			<input type="password" class="form-control" id="password" name="password" required> -->
<!-- 	  			</div> -->
<!-- 			</div> -->
<!--   			<button type="submit" class="btn btn-primary" id ="loginbutton">Submit</button> -->
		</form>
	</div>
</body>
</html>
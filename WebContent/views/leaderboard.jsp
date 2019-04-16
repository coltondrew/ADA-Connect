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
	<title>Leaderboard</title>
</head>
<body>
	<!-- Navbar -->
	<jsp:include page="/views/navbar.jsp"></jsp:include>
	
	<div class="embed-responsive embed-responsive-1by1">
		<iframe class="embed-responsive-item" src="https://adaomaha.shinyapps.io/adaapp/">
	         Sorry your browser does not support inline frames.
	    </iframe>
	</div>
</body>
</html>
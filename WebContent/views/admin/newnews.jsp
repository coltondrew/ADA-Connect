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
	<title>Add News</title>
</head>
<body>
	<!-- Navbar -->
	<jsp:include page="/views/navbar.jsp"></jsp:include>
	
	<div class="container-fluid">
		<div class="row">
	    	<!-- Sidebar Nav Column -->
			<jsp:include page="/views/admin/nav.jsp"></jsp:include>
			
	    	<!-- Content Column -->
	    	<div class="col-lg-9 mt-4 mb-4">
				<h1>Add a news article</h1>
				<form action="${pageContext.request.contextPath}/admin/new-news" method="post">
					<div class="form-row">
			  			<div class="form-group col-lg-3">
			    			<label for="news-title">Article Title:</label>
			    			<input type="text" class="form-control" id="news-title" name="news-title" required>
			  			</div>
					</div>
					<div class="form-group">
				    	<label for="news-body">Body:</label>
				    	<textarea class="form-control" id="news-body" name="news-body" rows="10"></textarea>
					</div>
				  	<div class="form-group">
    			  		<label for="image-file">Article Photo:</label>
    					<input type="file" class="form-control-file" id="image-file">
  				  	</div>
		  		  	<button type="submit" class="btn btn-primary">Submit</button>
				</form>
	      	</div>
	    </div>
	</div>
</body>
</html>
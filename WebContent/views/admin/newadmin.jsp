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
  	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
	<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/resources/img/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/resources/img/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/img/favicon-16x16.png">
	<link rel="manifest" href="${pageContext.request.contextPath}/resources/img/site.webmanifest">
	<title>Admin</title>
</head>
<body>
	<!-- Navbar -->
	<jsp:include page="/views/general/navbar.jsp"></jsp:include>

	<div class="container-fluid">
		<div class="row">
	    	<!-- Sidebar Nav Column -->
			<jsp:include page="/views/admin/nav.jsp"></jsp:include>
			
	    	<!-- Content Column -->
	    	<div class="col-md-9 ml-sm-auto pt-3 px-4">
				<h1>Add New Admin</h1>
				<hr/>
				
				<form action="${pageContext.request.contextPath}/admin/new-admin" method="post">
				  <div class="form-row">
				    <div class="form-group col-md-4">
			    			<label for="first-name">First Name</label>
			    			<input type="text" class="form-control" id="first-name" name="first-name" value="${requestScope.newUser.getFirstname()}" placeholder="John" required>
				    </div>
				    <div class="form-group col-md-4">
		    			<label for="last-name">Last Name</label>
		    			<input type="text" class="form-control" id="last-name" name="last-name" value="${requestScope.newUser.getLastname()}" placeholder="Doe" required>
				    </div>
					  <div class="form-group col-md-4">
					    <label for="role">Role</label>
		                <select class="form-control" name="role" id="role" required>
		                	<option ${requestScope.newUser.getRole().equals("") ? 'selected': ''}></option>
		                	<option ${requestScope.newUser.getRole().equals("CEO") ? 'selected': ''}>CEO</option>
		                    <option ${requestScope.newUser.getRole().equals("Regional Coordinator") ? 'selected': ''}>Regional Coordinator</option>
		                    <option ${requestScope.newUser.getRole().equals("Team Leader") ? 'selected': ''}>Team Leader</option>
		                </select>
					  </div>
				  </div>
				  <div class="form-row">
				    <div class="form-group col-md-6">
		    			<label for="username">Username</label>
			    		<input type="text" class="form-control" id="username" name="username" placeholder="Username" required>
				    </div>
				    <div class="form-group col-md-6">
		    			<label for="password">Password</label>
			    		<input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
				    </div>
				  </div>
				  <button type="submit" class="btn text-white" style="width:124px;background-color:#168d65;border-color:#168d65">Add</button>
				</form>
				
	      	</div>
	    </div>
	</div>
</body>
</html>
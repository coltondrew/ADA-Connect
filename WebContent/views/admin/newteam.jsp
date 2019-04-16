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
	<title>Add New Team</title>
</head>
<body>
	<!-- Navbar -->
	<jsp:include page="/views/general/navbar.jsp"></jsp:include>
	
	<div class="container-fluid">
		<div class="row">
	    	<!-- Sidebar Nav Column -->
			<jsp:include page="/views/admin/nav.jsp"></jsp:include>
			
	    	<!-- Content Column -->
	    	<div class="col-lg-9 mt-4 mb-4">
				<h1>Add a new team</h1>
				<form action="${pageContext.request.contextPath}/admin/new-team" method="post">
					<div class="form-row">
			  			<div class="form-group col-lg-3">
			    			<label for="team-name">Team Name:</label>
			    			<input type="text" class="form-control" id="team-name" name="team-name" required>
			  			</div>
					</div>
					<div class="form-row">
						<div class="form-group col-lg-3">
			            	<label for="team-leader">Team Leader:</label>
			                <select class="form-control" name="team-leader" id="team-leader" required>
			                	<option></option>
			                	<c:forEach items="${requestScope.teamLeaderList}" var="teamLeader">
				        			<option value="${teamLeader.getUsername()}"><c:out value="${teamLeader.getFirstname()} ${teamLeader.getLastname()}"></c:out></option>
				      			</c:forEach>
			                </select>
			            </div>
					</div>
					<div class="form-row">
			  			<div class="form-group col-lg-3">
			    			<label for="latitude">Latitude:</label>
			    			<input type="number" class="form-control" id="latitude" name="latitude" step="0.1" required>
			  			</div>
					</div>
					<div class="form-row">
			  			<div class="form-group col-lg-3">
			    			<label for="longitude">Longitude:</label>
			    			<input type="number" class="form-control" id="longitude" name="longitude" step="0.1" required>
			  			</div>
					</div>
				  <div class="form-group">
    			  		<label for="team-photo">Team Photo:</label>
    					<input type="file" class="form-control-file" id="team-photo">
  				  </div>
		  		  <button type="submit" class="btn btn-primary">Submit</button>
				</form>
	      	</div>
	    </div>
	</div>
</body>
</html>
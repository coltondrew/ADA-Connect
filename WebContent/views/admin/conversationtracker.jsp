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
	<title>Conversation Tracker</title>
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
	        	<h1>Track Conversations</h1>
	        	
	        	<form action="${pageContext.request.contextPath}/admin/conversation-tracker" method="post">
	        		<div class="form-row">
					    <div class="form-group col-md-2">
					    	<input type="number" class="form-control" id="week" name="week" placeholder="Week #" required>
					    </div>
					    <div class="form-group col-md-2">
					    	<input type="number" class="form-control" id="year" name="year" placeholder="Year #" required>
					    </div>
					    <div class="col-md-2">
						    <button type="submit" class="btn btn-primary">Submit</button>    
					    </div>
					</div>
	        	
		        	<table class="table">
						<thead class="thead-dark">
					    	<tr>
					      		<th scope="col">Name</th>
					      		<th scope="col">Conversations</th>
					      		<th scope="col">Conversions</th>
					    	</tr>
					  	</thead>
					  	<tbody>
				        	<c:forEach items="${requestScope.volList}" var="vol">
			        			<tr>
			        				<td><c:out value="${vol.getFirstname()} ${vol.getLastname()}"/></td>
			        				<td>
			        					<input type="hidden" name="id" value="${vol.getVolID()}"/>	
			        					<input type="number" class="form-control" name="conversations-${vol.getVolID()}" required>
			        				</td>
			        				<td><input type="number" class="form-control" name="conversions-${vol.getVolID()}" required></td>		        				
			        			</tr>
			      			</c:forEach>
					  	</tbody>
	      			</table>
      			</form>
	      	</div>
	    </div>
	</div>
</body>
</html>
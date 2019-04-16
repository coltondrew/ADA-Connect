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
	<title>Applications</title>
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
	        	<h1>Applications</h1>
	        	<p>Apps</p>
	        	
	        	<table class="table">
					<thead class="thead-dark">
				    	<tr>
				      		<th scope="col">ID</th>
				      		<th scope="col">Name</th>
				      		<th scope="col">Submission Date</th>
				    	</tr>
				  	</thead>
				  	<tbody>
			        	<c:forEach items="${requestScope.appList}" var="app">
		        			<tr>
		        				<th scope="row"><c:out value="${app.ID}"/></th>
		        				<td><a href="${pageContext.request.contextPath}/admin/application?id=${app.ID}"><c:out value="${app.firstname} ${app.lastname}"/></a></td>
		        				<td><c:out value="${app.datetime}"/></td>
		        			</tr>
		      			</c:forEach>
				  	</tbody>
      			</table>
      			
	      	</div>
	    </div>
	</div>
</body>
</html>
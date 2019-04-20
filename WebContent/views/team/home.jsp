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
					<img class="rounded" src="${pageContext.request.contextPath}/file-server?category=teamImg&filename=${sessionScope.teamObj.photoUrl}" alt="Card image cap" style="width:100%;height:30vw;object-fit: cover;">
				</div>
				<div class="row pr-3 my-3 d-flex justify-content-between">
					<c:forEach items="${requestScope.newsList}" var="news" end="2">
						<div class="card rounded" style="width:32%;">
							<img class="card-img-top" src="${pageContext.request.contextPath}/file-server?category=newsImg&filename=${news.pictureurl}" alt="Card image cap" style="width:100%;height:10vw;object-fit: cover;">
							<div class="card-body bg-light" style="padding:0.5rem;">
								<p class="card-title"><strong><c:out value="${news.title}"/></strong></p>
								<a href="${pageContext.request.contextPath}/team/news?id=${news.newsID}" class="stretched-link"></a>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-6">
				<div class="row pl-3">
					<h5><c:out value="${requestScope.totalConversations}"/></h5>
				</div>
				<div class="row pl-3">
					<h5>test4</h5>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
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
	
	<div class="container-fluid mb-1">
		<div class="row">
			<div class="col-7 pr-2">
				<div class="card w-100 rounded ">
					<div class="card-header text-white" style="background-color:#168d65">
						<c:out value="${sessionScope.teamObj.teamname}"/>
					</div>
					<img src="${pageContext.request.contextPath}/file-server?category=teamImg&filename=${sessionScope.teamObj.photoUrl}"  class="category-banner img-responsive card-img-bottom" style="width:100%;height:33vw;object-fit: cover;">								
				</div>
<!-- 				<div class="imagebox"> -->
<%-- 					<img src="${pageContext.request.contextPath}/file-server?category=teamImg&filename=${sessionScope.teamObj.photoUrl}"  class="category-banner img-responsive rounded" style="width:100%;height:35vw;object-fit: cover;"> --%>
<%-- 					<span class="imagebox-desc"><c:out value="${sessionScope.teamObj.teamname}"/></span> --%>
<!-- 				</div> -->
			</div>
			<div class="col-5">
				<div class="row pr-2">
					<div class="card w-100 rounded">
						<div class="card-header text-white" style="background-color:#168d65">
						  News
						</div>
						<div class="card-body p-2 bg-dark">
							<div class="d-flex justify-content-between flex-wrap">
								<c:forEach items="${requestScope.newsList}" var="news" end="2">
									<div class="card rounded text-white bg-dark" style="width:49%;">
										<img class="card-img-top" src="${pageContext.request.contextPath}/file-server?category=newsImg&filename=${news.pictureurl}" alt="Card image cap" style="width:100%;height:10vw;object-fit: cover;">
										<div class="card-body" style="padding:0.5rem;background-color:#168d65;">
											<p class="card-title"><strong><c:out value="${news.title}"/></strong></p>
											<a href="${pageContext.request.contextPath}/team/news?id=${news.newsID}" class="stretched-link"></a>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<div class="row pr-2">
					<div class="card w-100 rounded">
						<div class="card-header text-white" style="background-color:#168d65">
						 Total Conversations
						</div>
						<div class="card-body p-2 bg-dark text-white text-center">
							<h1><c:out value="${requestScope.totalConversations}"/></h1>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
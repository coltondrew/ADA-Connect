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
	<title>Team News</title>
</head>
<body class="bg-light">
	<!-- Navbar -->
	<jsp:include page="/views/general/navbar.jsp"></jsp:include>
	
	<!-- Secondary Navbar -->
	<jsp:include page="/views/team/nav.jsp"></jsp:include>
	
	<!-- Page Content -->
  	<div class="container bg-light rounded">
    	<div class="row">
			<!-- Post Content Column -->
			<div class="col-lg-8">

				<!-- Title -->
				<h1 class="mt-4"><c:out value="${requestScope.mainNews.title}"/></h1>

<!-- 				Author -->
<!-- 		        <p class="lead"> -->
<!-- 		          by -->
<!-- 		          <a href="#">Start Bootstrap</a> -->
<!-- 		        </p> -->
		
		        <hr>

				<!-- Date/Time -->
		        <p>Posted on <c:out value="${requestScope.mainNews.date}"/></p>
		
		        <hr>
		
		        <!-- Preview Image -->
		        <img class="img-fluid rounded" src="${pageContext.request.contextPath}/file-server?category=newsImg&filename=${requestScope.mainNews.pictureurl}" alt="" style="width:100%;height:35vw;">
		
		        <hr>
		
		        <!-- Post Content -->
		        <p><c:out value="${requestScope.mainNews.contents}"/></p>
          
			</div>

			<!-- Sidebar Widgets Column -->
			<div class="col-md-4">
				
				<c:forEach items="${requestScope.newsList}" var="news" end="5">
					<div class="my-4 px-5">
						<div class="card rounded">
							<img class="card-img-top" src="${pageContext.request.contextPath}/file-server?category=newsImg&filename=${news.pictureurl}" alt="Card image cap" style="width:100%;height:10vw;object-fit: cover;">
							<div class="card-body bg-light" style="padding:0.5rem;">
								<p class="card-title"><c:out value="${news.title}"/></p>
								<a href="${pageContext.request.contextPath}/team/news?id=${news.newsID}" class="stretched-link"></a>
							</div>
						</div>
					</div>
				</c:forEach>
			
			</div>
          
        </div>

      </div>
	
<!-- 	<div class="container-fluid"> -->
<!-- 		<div class=col-8> -->
		
<!-- 		</div> -->
<!-- 		<div class="col-4"> -->
<!-- 		</div> -->
<!-- 	</div> -->
</body>
</html>
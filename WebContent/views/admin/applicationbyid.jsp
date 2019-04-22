<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<title>Application</title>
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
	        	<h1>Applicant</h1>
		      	<form action="${pageContext.request.contextPath}/admin/application" method="post">
					<p><strong>Name: </strong> <c:out value="${requestScope.app.firstname} ${requestScope.app.lastname}"/></p>
		      		<p><strong>Email: </strong><c:out value="${requestScope.app.email}"/></p>
		      		<p><strong>School Year: </strong><c:out value="${requestScope.app.schoolyear}"/></p>
		      		<p><strong>University: </strong><c:out value="${requestScope.app.university}"/></p>
		      		<p><strong>University Population: </strong><fmt:formatNumber value="${requestScope.app.unipopulation}"/> students</p>
		      		<p><strong>Is there a current team on campus? </strong><c:out value="${requestScope.app.curteamoncampus ? 'Yes' : 'No'}"/></p>
		      		<p><strong>Expected university course load: </strong><c:out value="${requestScope.app.credithours}"/> credit hours</p>
		      		<p><strong>Expected hours working as a team leader: </strong><c:out value="${requestScope.app.credithours}"/> hours a week</p>
		      		<p><strong>Does applicant have another part-time job? </strong><c:out value="${requestScope.app.parttime ? 'Yes' : 'No'}"/></p>
		      		<p><strong>Expected number of hours at other part-time job: </strong><c:out value="${requestScope.app.partimehours}"/> hours</p>
		      		<p><strong>Is applicant a member of the Newman Center? </strong><c:out value="${requestScope.app.newman ? 'Yes': 'No'}"/></p>
		      		<p><strong>Estimated number of students involved at the Newman Center: </strong><c:out value="${requestScope.app.newmanstudents}"/> students</p>
		      		<p><strong>Is applicant involved in a Pro-Life group on campus? </strong><c:out value="${requestScope.app.prolifegroup ? 'Yes' : 'No'}"/></p>
		      		<p><strong>Estimated number of students involved in a Pro-Life group: </strong><c:out value="${requestScope.app.prolifegroupstudents}"/> students</p>
		      		<p><strong>Is university located in the Southern or Northern U.S.? </strong><c:out value="${requestScope.app.north ? 'Northern' : 'Southern'}"/></p>
		      		<p><strong>Religion of applicant: </strong><c:out value="${requestScope.app.religion}"/></p>
		      		<audio controls>
		        		<source src="${pageContext.request.contextPath}/admin/audio-app-server?filename=${requestScope.app.getAudiourl()}">
		        		Your browser does not support the audio element
		        	</audio>
		      		
	      			<input type="hidden" name="appID" value="${requestScope.app.ID}">
	      			<input class="btn btn-primary" type="submit" name="decision" value="Accept"/>
					<input class="btn btn-secondary" type="submit" name="decision" value="Decline"/>
				</form>
	      	</div>
	    </div>
	</div>
</body>
</html>
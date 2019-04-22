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
	<title>Team Roster</title>
</head>
<body style="background-color: rgb(237, 238, 240);">
	<!-- Navbar -->
	<jsp:include page="/views/general/navbar.jsp"></jsp:include>
	
	<!-- Secondary Navbar -->
	<jsp:include page="/views/team/nav.jsp"></jsp:include>
	
	<!-- Volunteers -->
	<div class="container-fluid px-3" >
		<div>
			<div class="ml-2">
				<h1>Team Roster</h1>
				<hr/>
			</div>
			<div class="d-flex flex-wrap justify-content-start">
				<c:forEach items="${requestScope.volList}" var="vol">
					<div class="card m-2 bg-light" style="width:15%">
						<img class="card-img-top" src="${pageContext.request.contextPath}/file-server?category=volImg&filename=${vol.getPictureUrl()}" alt="Card image cap" style="width:100%;height:13vw;object-fit: cover;">
						<div class="card-body" style="padding:0.5rem;">
							<h5 class="card-title text-center"><c:out value="${vol.firstname} ${vol.lastname}"/></h5>
							<a href="#volModal" data-toggle="modal" data-vol-id="${vol.volID}" class="stretched-link"></a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<!-- Edit/New Volunteer Modal -->
	<div class="modal fade" id="volModal" tabindex="-1" role="dialog" aria-labelledby="volModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
	    	<div class="modal-content">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="editVolunteerModalLabel">Volunteer</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	        		</button>
	      		</div>
	      		<div class="modal-body">
					<img id="vol-photo" src="" alt="Image" style="width:50%;height:15vw;object-fit: cover;">
	      			<p><strong>Name: </strong><span id="vol-name"></span></p>
	      			<p><strong>School Year: </strong><span id="school-year"></span></p>
	      			<p><strong>Hometown: </strong><span id="hometown"></span></p>
	      			<p><strong>High School: </strong><span id="high-school"></span></p>
	      			<p><strong>Bio: </strong><span id="vol-bio"></span></p>
				</div>
	      		<div class="modal-footer">
	        		<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	      		</div>
	    	</div>
	  	</div>
	</div>
</body>
<script>
	var contextPath = "${pageContext.request.contextPath}";
	
	var domain = "${pageContext.request.serverName}";
	var port = "${pageContext.request.serverPort}";
	
	var url = "http://" + domain + ":" + port + contextPath + "/get-volunteer"; 
	var photoSrc = contextPath + "/file-server?category=volImg&filename=";
	
	$('#volModal').on('show.bs.modal', function(e) {
     	var volId = $(e.relatedTarget).data('vol-id');
     	var urlParam = url + "?id=" + volId;
     	
     	$.getJSON(urlParam, function(vol) {
     		var bio = vol.bio;
     		var startDate = vol.datetime;
     		var firstName = vol.firstname;
     		var highSchool = vol.highschool;
     		var lastName = vol.lastname;
     		var pictureUrl = vol.pictureUrl;
     		var schoolYear = vol.schoolyear;
     		var hometown = vol.hometown;
     		     		
     		$("#vol-bio").html(bio);
     		$("#vol-name").html(firstName + " " + lastName);
     		$("#high-school").html(highSchool);
     		$("#school-year").html(schoolYear);
     		$("#hometown").html(hometown);
          	$("#vol-photo").attr("src", photoSrc + pictureUrl);
     	});
	});
	
	$('#volModal').on('hide.bs.modal', function(e) {
 		$("#vol-bio").html("");
 		$("#vol-name").html("");
 		$("#high-school").html("");
 		$("#school-year").html("");
 		$("#hometown").html("");
      	$("#vol-photo").attr("src", "");
	});
</script>
</html>
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
	    	<div class="col-md-9 ml-sm-auto col-lg-9 pt-3 px-4">
	        	<h1>Applications</h1>
	        	<hr/>
	        		        	
	        	<table class="table table-hover">
					<thead class="text-white" style="background-color:#168d65;">
				    	<tr>
				      		<th scope="col">ID</th>
				      		<th scope="col">Name</th>
				      		<th scope="col">Submission Date</th>
				    	</tr>
				  	</thead>
				  	<tbody>
			        	<c:forEach items="${requestScope.appList}" var="app">
		        			<tr class="clickable-row" data-app-id="${app.ID}" style="cursor:pointer;">
		        				<th scope="row"><c:out value="${app.ID}"/></th>
<%-- 		        				<td><a href="#appModal" data-toggle="modal" data-app-id="${app.ID}"><c:out value="${app.firstname} ${app.lastname}"/></a></td> --%>
		        				<td><c:out value="${app.firstname} ${app.lastname}"/></td>
		        				<td><c:out value="${app.datetime}"/></td>
		        			</tr>
		      			</c:forEach>
				  	</tbody>
      			</table>
	      	</div>
	    </div>
	</div>
	
	<!-- Manage Apps Modal -->
	<div class="modal fade" id="appModal" tabindex="-1" role="dialog" aria-labelledby="appModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
	    	<div class="modal-content">
	      		<form action="${pageContext.request.contextPath}/admin/application" method="post">
		      		<div class="modal-header">
		        		<h5 class="modal-title" id="appModalLabel">Applicant Info</h5>
		        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          			<span aria-hidden="true">&times;</span>
		        		</button>
		      		</div>
		      		<div class="modal-body">
		      			<p><strong>Name: </strong><span id="app-name"></span></p>
			      		<p><strong>Email: </strong><span id="app-email"></span></p>
			      		<p><strong>School Year: </strong><span id="app-school-year"></span></p>
			      		<p><strong>University: </strong><span id="app-uni"></span></p>
			      		<p><strong>University Population: </strong><span id="app-uni-pop"></span> students</p>
			      		<p><strong>Is there a current team on campus? </strong><span id="app-team-exists"></span></p>
			      		<p><strong>Expected university course load: </strong><span id="app-credits"></span> credit hours</p>
			      		<p><strong>Expected hours working as a team leader: </strong><span id="app-intern-hours"></span> hours a week</p>
			      		<p><strong>Does applicant have another part-time job? </strong><span id="app-pt"></span></p>
			      		<p><strong>Expected number of hours at other part-time job: </strong><span id="app-pt-hours"></span> hours</p>
			      		<p><strong>Is applicant a member of the Newman Center? </strong><span id="app-newman"></span></p>
			      		<p><strong>Estimated number of students involved at the Newman Center: </strong><span id="app-newman-pop"></span> students</p>
			      		<p><strong>Is applicant involved in a Pro-Life group on campus? </strong><span id="app-prolife"></span></p>
			      		<p><strong>Estimated number of students involved in a Pro-Life group: </strong><span id="app-prolife-pop"></span> students</p>
			      		<p><strong>Is university located in the Southern or Northern U.S.? </strong><span id="app-location"></span></p>
			      		<p><strong>Religion of applicant: </strong><span id="app-religion"></span></p>
			      		<div id="audio-controls">
				      		<audio id="audio-tag" controls>
				        		<source src="" id="app-audio">
				        		Your browser does not support the audio element
				        	</audio>
			      		</div>
		      			<input type="hidden" id="app-id" name="appID" value="${requestScope.app.ID}">
					</div>
		      		<div class="modal-footer">
		        		<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        		<input class="btn text-white" type="submit" name="decision" value="Accept" style="background-color:#168d65;border-color:#168d65"/>
						<input class="btn btn-danger" type="submit" name="decision" value="Decline"/>
		      		</div>
	      		</form>
	    	</div>
	  	</div>
	</div>
</body>
<script type="text/javascript">
	var contextPath = "${pageContext.request.contextPath}";
	var domain = "${pageContext.request.serverName}";
	var port = "${pageContext.request.serverPort}";
	
	var url = "http://" + domain + ":" + port + contextPath + "/admin/get-app"; 
	var audioSrcUrl = contextPath + "/admin/audio-app-server?filename=";
	var appId = null;
	
	$(".clickable-row").click(function() {
        $("#appModal").modal("show");
		appId = $(this).data("app-id");
    	var urlParam = url + "?id=" + appId;
    	
       	$("#app-id").val(appId);
       	$("#audio-controls").empty();

     	$.getJSON(urlParam, function(app) {
//      		var teamName = team.teamname;
//      		var teamLeader = team.username;
//      		var latitude = team.latitude;
//      		var longitude = team.longitude;
//      		var teamImgName = team.photoUrl;
     		console.log(app);
     		
     		$("#app-name").html(app.firstname + " " + app.lastname);
     		$("#app-email").html(app.email);
     		$("#app-school-year").html(app.schoolyear);
     		$("#app-uni").html(app.university);
     		$("#app-uni-pop").html(app.unipopulation);
     		$("#app-team-exists").html(app.curteamoncampus);
     		$("#app-credits").html(app.credithours);
     		$("#app-intern-hours").html(app.workhours);
     		$("#app-app-pt").html(app.parttime);
     		$("#app-pt-hours").html(app.parttimehours);
     		$("#app-newman").html(app.newman);
     		$("#app-newman-pop").html(app.newmanstudents);
     		$("#app-prolife").html(app.prolifegroup);
     		$("#app-prolife-pop").html(app.prolifegroupstudents);
     		$("#app-location").html(app.north);
     		$("#app-religion").html(app.religion);

			var audioSrcTag = '<audio id="audio-tag" controls><source src="' + contextPath + '/admin/audio-app-server?filename=' + app.audiourl + '" id="app-audio">Your browser does not support the audio element</audio>';
     		$("#audio-controls").html(audioSrcTag);
     	});
	});
	
	$('#appModal').on('hide.bs.modal', function(e) {
		$("#app-name").empty();
 		$("#app-email").empty();
 		$("#app-school-year").empty();
 		$("#app-uni").empty();
 		$("#app-uni-pop").empty();
 		$("#app-team-exists").empty();
 		$("#app-credits").empty();
 		$("#app-intern-hours").empty();
 		$("#app-app-pt").empty();
 		$("#app-pt-hours").empty();
 		$("#app-newman").empty();
 		$("#app-newman-pop").empty();
 		$("#app-prolife").empty();
 		$("#app-prolife-pop").empty();
 		$("#app-location").empty();
 		$("#app-religion").empty();

 		var audioTag = document.getElementById("audio-tag"); 
 		audioTag.pause();
 		audioTag.currentTime = 0;
//  		$("#audio-tag").pause();
//  		$("#audio-tag").currentTime = 0;
//  		audio.pause();
//  		audio.currentTime = 0;
 		$("#audio-tag").empty();
	});
</script>
</html>
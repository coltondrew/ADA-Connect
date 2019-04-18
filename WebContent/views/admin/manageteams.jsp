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
	<title>Manage Teams</title>
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
				<h1>Manage Teams</h1>
				
				<!-- Teams Manager -->
				<div class="card">
					<div class="card-header text-white bg-primary">
						<div class="row">
							<div class="col-10 d-flex align-items-center">
								<h5>Teams</h5>
							</div>
							<div class="col d-flex justify-content-end">
								<button type="button" class="btn btn-outline-light" data-toggle="modal" data-target="#editTeamModal" style="background-color:transparent;"> 
				  					<div style="text-align:center;"><i class="fas fa-plus" style="color: white;"></i></div>
								</button>
							</div>
						</div>
					</div>
					<div class="card-body">
						<table class="table">
							 <thead>
								 <tr>
								   <th scope="col">Picture</th>
								   <th scope="col">Name</th>
								 </tr>
							</thead>
							<tbody>
								<c:forEach items="${requestScope.teamsList}" var="team">
				        			<tr>
				        				<td><a href="#editTeamModal" data-toggle="modal" data-team-id="${team.ID}"><img alt="image" src="${pageContext.request.contextPath}/file-server?category=teamImg&filename=${team.photoUrl}" style="width:30%;height:12.5vw;object-fit: cover;"></a></td>
				        				<td><c:out value="${team.teamname}"/></td>			        				
				        			</tr>
			      				</c:forEach>
							</tbody>
						</table>
					</div>
				</div>	
	      	</div>
	    </div>
	</div>
	
	<!-- Edit/Add Teams Modal -->
	<div class="modal fade" id="editTeamModal" tabindex="-1" role="dialog" aria-labelledby="editTeamModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
	    	<div class="modal-content">
	    		<form action="${pageContext.request.contextPath}/admin/manage-teams" method="post" enctype="multipart/form-data">
		      		<div class="modal-header">
		        		<h5 class="modal-title" id="editTeamModalLabel"></h5>
		        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          			<span aria-hidden="true">&times;</span>
		        		</button>
		      		</div>
		      		<div class="modal-body">
		      			<input type="hidden" id="orig-img" name="orig-img" value="">
						<input type="hidden" id="team-id" name="team-id" value="">
						<input type="hidden" id="team-action" name="action" value="">
						<div class="form-row">
				  			<div class="form-group col-lg-12">
				    			<label for="team-name">Team Name:</label>
				    			<input type="text" class="form-control" id="team-name" name="team-name" required>
				  			</div>
						</div>
						<div class="form-row">
							<div class="form-group col-lg-12">
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
				  			<div class="form-group col-lg-12">
				    			<label for="latitude">Latitude:</label>
				    			<input type="number" class="form-control" id="latitude" name="latitude" step="0.1" required>
				  			</div>
						</div>
						<div class="form-row">
				  			<div class="form-group col-lg-12">
				    			<label for="longitude">Longitude:</label>
				    			<input type="number" class="form-control" id="longitude" name="longitude" step="0.1" required>
				  			</div>
						</div>
						<div class="form-group">
							<label for="team-img-input">Article Photo:</label>
					  		<img src="" id="team-img" alt="..." class="img-thumbnail" width="100%">
	    					<input type="file" onchange="readURL(this);"  class="form-control-file" id="team-img-input" name="team-img">
		  				</div>
					</div>
		      		<div class="modal-footer">
		        		<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        		<button type="submit" id="edit-btn" class="btn btn-primary"></button>
		        		<button type="button" class="btn btn-danger" data-target="#deleteModal" data-toggle="modal" data-team-id="" data-dismiss="modal" id="delete-btn">Delete</button>
		      		</div>
	      		</form>
	    	</div>
	  	</div>
	</div>
	
	<!-- Delete Confirmation Modal -->
	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
	    	<div class="modal-content">
	    		<form action="${pageContext.request.contextPath}/admin/manage-teams" method="post" enctype="multipart/form-data">
		      		<div class="modal-header">
		        		<h5 class="modal-title" id="deleteModalLabel">Delete Team</h5>
		        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          			<span aria-hidden="true">&times;</span>
		        		</button>
		      		</div>
		      		<div class="modal-body">
						<input type="hidden" id="del-team-id" name="team-id" value="">
						<input type="hidden" name="action" value="delete">
						<h5>Are you sure you want to delete this team?</h5>
					</div>
		      		<div class="modal-footer">
		        		<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
		        		<button type="submit" class="btn btn-danger">Delete</button>
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
	
	var url = "http://" + domain + ":" + port + contextPath + "/get-team"; 
	var imgSrcUrl = contextPath + "/file-server?category=teamImg&filename=";
	
	$('#editTeamModal').on('show.bs.modal', function(e) {
     	var teamId = $(e.relatedTarget).data('team-id');
     	
     	if(teamId != null) {
	     	var urlParam = url + "?id=" + teamId;
          	$("#delete-btn").show();
          	$("#delete-btn").attr("data-team-id", teamId);
			$("#editTeamModalLabel").html("Edit Team");
          	$("#team-id").val(teamId);
          	$("#team-action").val("update");
			$("#edit-btn").html("Update");

	     	
	     	$.getJSON(urlParam, function(team) {
	     		var teamName = team.teamname;
	     		var teamLeader = team.username;
	     		var latitude = team.latitude;
	     		var longitude = team.longitude;
	     		var teamImgName = team.photoUrl;
	     		console.log(teamLeader);
	     		
	     		$("#team-name").val(teamName);
	     		$("#latitude").val(latitude);
	     		$("#longitude").val(longitude);
	     		$("#orig-img").val(teamImgName);
	     		$("#team-leader").val(teamLeader);
	     		$("#team-img").attr("src", imgSrcUrl + teamImgName);
	     	});
     	}
     	else {
     		$("#team-name").val("");
     		$("#latitude").val("");
     		$("#longitude").val("");
     		$("#team-leader").val("");
     		$("#orig-img").val("");
     		$("#team-img").attr("src", "");
     		$("#team-img-input").val("");
     		
         	$("#team-id").val("");
         	$("team-action").val("add");
         	$("#delete-btn").hide();
         	$("#editTeamModalLabel").html("Add New Team");
			$("#edit-btn").html("Add");
     	}
	});
	
	$('#editTeamModal').on('hide.bs.modal', function(e) {
		$("#team-name").val("");
 		$("#latitude").val("");
 		$("#longitude").val("");
 		$("#team-leader").val("");
 		$("#orig-img").val("");
 		$("#team-img").attr("src", "");
 		$("#team-img-input").val("");
 		
     	$("#team-id").val("");
     	$("team-action").val("add");
     	$("#delete-btn").hide();
     	$("#editTeamModalLabel").html("Add New Team");
		$("#edit-btn").html("");
	});
	
	$('#deleteModal').on('show.bs.modal', function(e) {
		var teamId = $(e.relatedTarget).data('team-id');
		$(e.currentTarget).find('input[id="del-team-id"]').val(teamId);
	});
	
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#team-img').attr('src', e.target.result);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
</html>
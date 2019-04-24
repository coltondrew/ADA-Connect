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
	<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/resources/img/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/resources/img/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/img/favicon-16x16.png">
	<link rel="manifest" href="${pageContext.request.contextPath}/resources/img/site.webmanifest">
	<title>Manage Volunteers</title>
</head>
<body>
	<!-- Navbar -->
	<jsp:include page="/views/general/navbar.jsp"></jsp:include>
	
	<div class="container-fluid">
		<div class="row">
	    	<!-- Sidebar Nav Column -->
			<jsp:include page="/views/admin/nav.jsp"></jsp:include>
			
	    	<!-- Content Column -->
	    	<div class="col-md-9 ml-sm-auto pt-3 px-4">
				<h1>Manage Volunteers</h1>
				<hr/>
				
				<!-- Volunteer Manager -->
				<!-- Active Table -->
				<div class="card">
					<div class="card-header text-white" style="background-color:#168d65">
						<div class="row">
							<div class="col-10 d-flex align-items-center">
								<h5>Active Volunteers</h5>
							</div>
							<div class="col d-flex justify-content-end">
								<button type="button" class="btn btn-outline-light" data-toggle="modal" data-target="#editVolunteerModal" style="background-color:transparent;"> 
				  					<div style="text-align:center;"><i class="fas fa-plus" style="color: white;"></i></div>
								</button>
							</div>
						</div>
					</div>
					<div class="card-body">
						<table class="table table-hover">
							 <thead>
								 <tr>
								   <th scope="col">Name</th>
								   <th scope="col">Year</th>
								   <th scope="col">Hometown</th>
								   <th scope="col">High School</th>
								 </tr>
							</thead>
							<tbody>
								<c:forEach items="${requestScope.activeVols}" var="vol">
		        					<tr class="clickable-row" data-vol-id="${vol.volID}" style="cursor:pointer;">
				        				<td><c:out value="${vol.getFirstname()} ${vol.getLastname()}"/></td>
				        				<td><c:out value="${vol.getSchoolyear()}"/></td>
     				       				<td><c:out value="${vol.getHometown()}"/></td>
				        				<td><c:out value="${vol.getHighschool()}"/></td>				        				
				        			</tr>
			      				</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				
				<div class="card mt-3 mb-3">
					<div class="card-header text-white" style="background-color:#168d65">
						<div class="row">
							<div class="col-10 d-flex align-items-center">
								<h5>Inactive Volunteers</h5>
							</div>
							<div class="col d-flex justify-content-end">
								<button type="button" class="btn btn-outline-light" data-toggle="modal" data-target="#editVolunteerModal" style="background-color:transparent;"> 
				  					<div style="text-align:center;"><i class="fas fa-plus" style="color: white;"></i></div>
								</button>
							</div>
						</div>
					</div>
					<div class="card-body">
						<table class="table table-hover">
							 <thead>
								 <tr>
								   <th scope="col">Name</th>
								   <th scope="col">Year</th>
								   <th scope="col">Hometown</th>
								   <th scope="col">High School</th>
								 </tr>
							</thead>
							<tbody>
								<c:forEach items="${requestScope.inactiveVols}" var="vol">
		        					<tr class="clickable-row" data-vol-id="${vol.volID}" style="cursor:pointer;">
				        				<td><c:out value="${vol.getFirstname()} ${vol.getLastname()}"/></td>
				        				<td><c:out value="${vol.getSchoolyear()}"/></td>
     				       				<td><c:out value="${vol.getHometown()}"/></td>
				        				<td><c:out value="${vol.getHighschool()}"/></td>				        				
				        			</tr>
			      				</c:forEach>
							</tbody>
						</table>
					</div>
				</div>		
	      	</div>
	    </div>
	</div>
	
	<!-- Edit/New Volunteer Modal -->
	<div class="modal fade" id="editVolunteerModal" tabindex="-1" role="dialog" aria-labelledby="editVolunteerModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
	    	<div class="modal-content">
	    		<form action="${pageContext.request.contextPath}/admin/manage-volunteers" method="post" enctype="multipart/form-data">
		      		<div class="modal-header">
		        		<h5 class="modal-title" id="editVolunteerModalLabel"></h5>
		        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          			<span aria-hidden="true">&times;</span>
		        		</button>
		      		</div>
		      		<div class="modal-body">
		      			<input type="hidden" name="orig-image-path" value="">
						<input type="hidden" id="vol-id" name="vol-id" value="">
						<input type="hidden" id="vol-action" name="action" value="">
						<div class="form-row">
			 				<div class="form-group col-lg-12">
			   					<label for="first-name">First Name:</label>
			   					<input type="text" class="form-control" id="first-name" name="first-name" required>
			 				</div>
						</div>
						<div class="form-row">
					 			<div class="form-group col-lg-12">
					   			<label for="last-name">Last Name:</label>
					   			<input type="text" class="form-control" id="last-name" name="last-name" required>
					 			</div>
						</div>
						<div class="form-row">
							<div class="form-group col-lg-12">
					           	<label for="school-year">Year in School:</label>
					               <select class="form-control" name="school-year" id="school-year" required>
					               		<option></option>
					               		<option value="Freshman">Freshman</option>
					                   	<option value="Sophomore">Sophomore</option>
					                   	<option value="Junior">Junior</option>
					                   	<option value="Senior">Senior</option>
					                   	<option value="Graduate">Graduate</option>
					               </select>
					           </div>
						</div>
						<div class="form-row">
					 			<div class="form-group col-lg-12">
					   			<label for="hometown">Hometown (City, State):</label>
					   			<input type="text" class="form-control" id="hometown" name="hometown" required>
					 			</div>
						</div>
						<div class="form-row">
					 			<div class="form-group col-lg-12">
					   			<label for="highschool">High School:</label>
					   			<input type="text" class="form-control" id="highschool" name="highschool" required>
					 			</div>
						</div>
						<div class="form-group">
					    	<label for="bio">Bio</label>
					    	<textarea class="form-control" id="bio" name="bio" rows="5"></textarea>
						</div>
						<div class="form-row">
							<div class="form-group col-12">
				            	<label for="active-stat">Active Status</label>
				                <select class="form-control" name="active-stat" id="active-stat" required>
				                	<option></option>
				                	<option value="active">Active</option>
				                    <option value="inactive">Inactive</option>
				                </select>
				            </div>
			            </div>
						<div class="form-group">
					  		<label for="image-file">Volunteer Photo:</label>
					  		<img src="" id="vol-photo" alt="..." class="img-thumbnail" width="100%">
							<input type="file" onchange="readURL(this);" class="form-control-file" id="image-file" name="image-file">
						</div>
					</div>
		      		<div class="modal-footer">
		        		<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        		<button type="submit" id="edit-btn" class="btn text-white" style="background-color:#168d65;border-color:#168d65"></button>
		        		<button type="button" class="btn btn-danger" data-target="#deleteModal" data-toggle="modal" data-vol-id="" data-dismiss="modal" id="delete-btn">Delete</button>
		      		</div>
	      		</form>
	    	</div>
	  	</div>
	</div>
	
	<!-- Delete Confirmation Modal -->
	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
	    	<div class="modal-content">
	    		<form action="${pageContext.request.contextPath}/admin/manage-volunteers" method="post" enctype="multipart/form-data">
		      		<div class="modal-header">
		        		<h5 class="modal-title" id="deleteModalLabel">Delete Volunteer</h5>
		        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          			<span aria-hidden="true">&times;</span>
		        		</button>
		      		</div>
		      		<div class="modal-body">
						<input type="hidden" id="del-vol-id" name="vol-id" value="">
						<input type="hidden" name="action" value="delete">
						<h5>Are you sure you want to delete this volunteer?</h5>
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
	
	var url = "http://" + domain + ":" + port + contextPath + "/get-volunteer"; 
	var photoSrc = contextPath + "/file-server?category=volImg&filename=";
	
	$(".clickable-row").click(function() {
		var volId = $(this).data("vol-id");
		$("#editVolunteerModal").modal("show");
     	
     	if(volId != null) {
	     	var urlParam = url + "?id=" + volId;
          	$("#delete-btn").show();
          	$("#delete-btn").attr("data-vol-id", volId);
			$("#editVolunteerModalLabel").html("Edit Volunteer");
          	$("#vol-id").val(volId);
          	$("#vol-action").val("update");
			$("#edit-btn").html("Update");

	     	
	     	$.getJSON(urlParam, function(vol) {
	     		var bio = vol.bio;
	     		var startDate = vol.datetime;
	     		var firstName = vol.firstname;
	     		var highSchool = vol.highschool;
	     		var lastName = vol.lastname;
	     		var pictureUrl = vol.pictureUrl;
	     		var schoolYear = vol.schoolyear;
	     		var hometown = vol.hometown;
	     		var active = vol.active;
	     		console.log(vol);
	     		
	         	$("#bio").val(bio);
	         	$("#first-name").val(firstName);
	         	$("#highschool").val(highSchool);
	         	$("#last-name").val(lastName);
	          	$("#school-year").val(schoolYear);
	          	$("#hometown").val(hometown);
	          	$("#orig-image-path").val(pictureUrl);
	          	if(active) {
	          		$("#active-stat").val("active")	          		
	          	}
	          	else {
	          		$("#active-stat").val("inactive")	          		
	          	}
	          	$("#vol-photo").attr("src", photoSrc + pictureUrl);
	     	});
     	}
     	else {
         	$("#bio").val("");
         	$("#first-name").val("");
         	$("#highschool").val("");
         	$("#last-name").val("");
          	$("#school-year").val("");
          	$("#hometown").val("");
      		$("#active-stat").val("")	          		
          	$("#orig-image-path").val("");
          	$("#image-file").val("");
          	$("#vol-id").val("");
          	$("#vol-action").val("add");
          	$("delete-btn").hide();
			$("#editVolunteerModalLabel").html("Add New Volunteer");
			$("#edit-btn").html("Add");
     	}
	});
	
	$('#editVolunteerModal').on('hide.bs.modal', function(e) {
     	$(e.currentTarget).find('textarea[name="bio"]').val("");
     	$(e.currentTarget).find('input[name="first-name"]').val("");
     	$(e.currentTarget).find('input[name="highschool"]').val("");
     	$(e.currentTarget).find('input[name="last-name"]').val("");
      	$(e.currentTarget).find('select[name="school-year"]').val("");
      	$(e.currentTarget).find('input[name="hometown"]').val("");
      	$(e.currentTarget).find('input[name="orig-image-path"]').val("");
      	$(e.currentTarget).find('input[id="image-file"]').val("");
  		$("#active-stat").val("")	          		
      	$(e.currentTarget).find('input[id="vol-id"]').val("");
      	$(e.currentTarget).find('input[id="vol-action"]').val("add");
      	$(e.currentTarget).find('button[id="delete-btn"]').hide();
		$("#editVolunteerModalLabel").html("");
		$("#edit-btn").html("");
      	$("#vol-photo").attr("src", "");
	});
	
	$('#deleteModal').on('show.bs.modal', function(e) {
		var volId = $(e.relatedTarget).data('vol-id');
		$(e.currentTarget).find('input[id="del-vol-id"]').val(volId);
	});
	
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#vol-photo').attr('src', e.target.result)
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
</html>
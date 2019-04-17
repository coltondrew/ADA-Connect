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
	    	<div class="col-lg-9 mt-4 mb-4">
				<h1>Manage Volunteers</h1>
				
				<!-- Volunteer Manager -->
				<div class="card">
					<div class="card-header text-white bg-primary">
						<div class="row">
							<div class="col-10 d-flex align-items-center">
								<h5>Volunteers</h5>
							</div>
							<div class="col d-flex justify-content-end">
								<button type="button" class="btn btn-outline-light" data-toggle="modal" data-target="#editVolunteerModal" style="background-color:transparent;"> 
				  					<div style="text-align:center;"><i class="fas fa-plus" style="color: white;"></i></div>
								</button>
							</div>
						</div>
					</div>
					<div class="card-body">
						<table class="table">
							 <thead>
								 <tr>
								   <th scope="col">Name</th>
								   <th scope="col">Year</th>
								   <th scope="col">Hometown</th>
								   <th scope="col">High School</th>
								 </tr>
							</thead>
							<tbody>
								<c:forEach items="${requestScope.volList}" var="vol">
				        			<tr>
				        				<td><a href="#editVolunteerModal" data-toggle="modal" data-vol-id="${vol.getVolID()}"><c:out value="${vol.getFirstname()} ${vol.getLastname()}"/></a></td>
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
						<div class="form-group">
					  		<label for="image-file">Volunteer Photo:</label>
					  		<img src="" id="vol-photo" alt="..." class="img-thumbnail" width="100%">
							<input type="file" onchange="readURL(this);" class="form-control-file" id="image-file" name="image-file">
						</div>
					</div>
		      		<div class="modal-footer">
		        		<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        		<button type="submit" id="edit-btn" class="btn btn-primary"></button>
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
	
	var url = "http://" + domain + ":" + port + contextPath + "/admin/get-volunteer"; 
	var photoSrc = contextPath + "/file-server?filename=";
	
	$('#editVolunteerModal').on('show.bs.modal', function(e) {
     	var volId = $(e.relatedTarget).data('vol-id');
     	
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
	     		
	         	$(e.currentTarget).find('textarea[name="bio"]').val(bio);
	         	$(e.currentTarget).find('input[name="first-name"]').val(firstName);
	         	$(e.currentTarget).find('input[name="highschool"]').val(highSchool);
	         	$(e.currentTarget).find('input[name="last-name"]').val(lastName);
	          	$(e.currentTarget).find('select[name="school-year"]').val(schoolYear);
	          	$(e.currentTarget).find('input[name="hometown"]').val(hometown);
	          	$(e.currentTarget).find('input[name="orig-image-path"]').val(pictureUrl);
	          	$("#vol-photo").attr("src", photoSrc + pictureUrl);
	     	});
     	}
     	else {
         	$(e.currentTarget).find('textarea[name="bio"]').val("");
         	$(e.currentTarget).find('input[name="first-name"]').val("");
         	$(e.currentTarget).find('input[name="highschool"]').val("");
         	$(e.currentTarget).find('input[name="last-name"]').val("");
          	$(e.currentTarget).find('select[name="school-year"]').val("");
          	$(e.currentTarget).find('input[name="hometown"]').val("");
          	$(e.currentTarget).find('input[name="orig-image-path"]').val("");
          	$(e.currentTarget).find('input[id="image-file"]').val("");
          	$(e.currentTarget).find('input[id="vol-id"]').val("");
          	$(e.currentTarget).find('input[id="vol-action"]').val("add");
          	$(e.currentTarget).find('button[id="delete-btn"]').hide();
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
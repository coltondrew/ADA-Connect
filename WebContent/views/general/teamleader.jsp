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
	<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/resources/img/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/resources/img/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/img/favicon-16x16.png">
	<link rel="manifest" href="${pageContext.request.contextPath}/resources/img/site.webmanifest">
	<title>Team Leader</title>
</head>
<body class="bg-light">
	<!-- Navbar -->
	<jsp:include page="/views/general/navbar.jsp"></jsp:include>
	
	<div class="py-4" style="background-image:linear-gradient(180deg,#168d65 25%,#232220 75%);padding-left:12.5%;padding-right:12.5%">
		<div class="container py-3 px-5 rounded bg-light">
			<!-- Heading -->
			<h1>Apply to be a Dialogue Team Leader!</h1>
			<hr/>
			
			<!-- Application Form -->
			<form action="${pageContext.request.contextPath}/team-leader" method="post" enctype="multipart/form-data">
				<!-- Personal Info -->
				<h4 class="pb-2">Personal Information</h4>
				<div class="form-row">
		  			<div class="form-group col-md-6">
		    			<label for="first-name">First Name</label>
		    			<input type="text" class="form-control" id="first-name" name="first-name" required>
		  			</div>
		  			<div class="form-group col-md-6">
		    			<label for="last-name">Last Name</label>
		    			<input type="text" class="form-control" id="last-name" name="last-name" required>
		  			</div>
	  			</div>
	  			<div class="form-row">
		  			<div class="form-group col-12">
		    			<label for="email">Email</label>
		    			<input type="email" class="form-control" id="email" name="email" required>
		  			</div>
	  			</div>
	  			<div class="form-row">
		  			<div class="form-group col-12">
		            	<label for="reliigon">Religious Affiliation</label>
		                <select class="form-control" name="religion" id="religion" required>
		                	<option></option>
		                	<option value="catholic">Catholic</option>
		                    <option value="christian">Christian</option>
		                    <option value="other">Other</option>
		                </select>
					</div>
				</div>
				
				<!-- University Info -->
				<h4 class="mt-3 pb-2">University Information</h4>
				<div class="form-row">
		  			<div class="form-group col-12">
		    			<label for="university">University</label>
		    			<input type="text" class="form-control" id="university" name="university" required>
		  			</div>
	  			</div>
	  			<div class="form-row">
		  			<div class="form-group col-12">
		    			<label for="university-population">University Population</label>
		    			<input type="number" class="form-control" id="university-population" name="university-population" required>
		  			</div>
	  			</div>
	  			<div class="form-row">
					<div class="form-group col-12">
		            	<label for="location">University Location</label>
		                <select class="form-control" name="location" id="location" required>
		                	<option></option>
		                	<option value="north">Northern US</option>
		                    <option value="south">Southern US</option>
		                </select>
		            </div>
	            </div>
	  			<div class="form-row">
					<div class="form-group col-12">
		            	<label for="school-year">Year in School</label>
		                <select class="form-control" name='school-year' id="school-year" required>
		                	<option></option>
		                	<option>Freshman</option>
		                    <option>Sophomore</option>
		                    <option>Junior</option>
		                    <option>Senior</option>
		                    <option>Graduate</option>
		                </select>
		            </div>
	            </div>
	            <div class="form-row">
		  			<div class="form-group col-12">
		    			<label for="num-credits">Expected Credit Hours Next Year</label>
		    			<input type="number" class="form-control" id="num-credits" name="num-credits" required>
		  			</div>
	  			</div>
	  			<div class="form-row">
					<div class="form-group col-12">
		            	<label for="team-exists">ADA Team Currently Exist</label>
		                <select class="form-control" name="team-exists" id="team-exists" required>
		                	<option></option>
		                	<option>Yes</option>
		                    <option>No</option>
		                </select>
					</div>
				</div>
				<div class="form-row">
		  			<div class="form-group col-12">
		            	<label for="newman">Newman Center Member</label>
		                <select class="form-control" name="newman" id="newman" required>
		                	<option></option>
		                	<option>Yes</option>
		                    <option>No</option>
		                </select>
					</div>
				</div>
				<div class="form-row">
		  			<div class="form-group col-12">
		    			<label for="num-newman">Newman Center Population</label>
		    			<input type="number" class="form-control" id="num-newman" name="num-newman" required>
		  			</div>
				</div>
				
				<!-- Other Info -->
				<h4 class="mt-3 pb-2">Other Information</h4>
				<div class="form-row">
		  			<div class="form-group col-12">
		    			<label for="ada-hours">Expected ADA Work Hours Per Week</label>
		    			<input type="number" class="form-control" id="ada-hours" name="ada-hours" required>
		  			</div>
	  			</div>
	  			<div class="form-row">
		  			<div class="form-group col-12">
		            	<label for="job">Will You Have Another Part-Time Job?</label>
		                <select class="form-control" name="job" id="job" required>
		                	<option></option>
		                	<option>Yes</option>
		                    <option>No</option>
		                </select>
					</div>
				</div>
				<div class="form-row">
		  			<div class="form-group col-12">
		    			<label for="other-job-hours">Expected Hours Per Week at Other Jobs</label>
		    			<input type="number" class="form-control" id="other-job-hours" name="other-job-hours" required>
		  			</div>
				</div>
				<div class="form-row">
		  			<div class="form-group col-12">
		            	<label for="prolife">Are You Involved in a Pro-Life Group?</label>
		                <select class="form-control" name="prolife" id="prolife" required>
		                	<option></option>
		                	<option>Yes</option>
		                    <option>No</option>
		                </select>
					</div>
				</div>
				<div class="form-row">
		  			<div class="form-group col-12">
		    			<label for="num-prolife">Estimated Number of Students Involved in Pro-Life group</label>
		    			<input type="number" class="form-control" id="num-prolife" name="num-prolife" required>
		  			</div>
				</div>
				<div class="form-row">
					<div class="form-group col-12">
		    			<label for="customFile">Recording of Conversation Using ADA Content</label>			
						<div class="custom-file">
						  <input type="file" onchange="readURL(this);" class="custom-file-input" id="customFile" name="audio-file">
						  <label id="file-label" class="custom-file-label" for="customFile">Choose file</label>
						</div>
		  			</div>
				</div>
	  			<button type="submit" class="btn btn-lg text-white rounded" style="background-color:#168d65;border-color:#168d65">Submit</button>
			</form>
		</div> 
	</div>
</body>
<script>
function readURL(input) {
    if (input.files && input.files[0]) {
    	$("#file-label").html(input.files[0].name);
    }
}
</script>
</html>
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
	<title>Team Leader</title>
</head>
<body>
	<!-- Navbar -->
	<jsp:include page="/views/navbar.jsp"></jsp:include>
	
	<div class="container-fluid">
		<!-- Heading -->
		<h2>Apply to be a Dialogue Team Leader!</h2>
		<!-- Application Form -->
		<form action="${pageContext.request.contextPath}/team-leader" method="post">
			<div class="form-row">
	  			<div class="form-group col-lg-3">
	    			<label for="first-name">First Name:</label>
	    			<input type="text" class="form-control" id="first-name" name="first-name" required>
	  			</div>
			</div>
			<div class="form-row">
	  			<div class="form-group col-lg-3">
	    			<label for="last-name">Last Name:</label>
	    			<input type="text" class="form-control" id="last-name" name="last-name" required>
	  			</div>
			</div>
			<div class="form-row">
	  			<div class="form-group col-lg-3">
	    			<label for="email">Email:</label>
	    			<input type="email" class="form-control" id="email" name="email" required>
	  			</div>
			</div>
			<div class="form-row">
				<div class="form-group col-lg-3">
	            	<label for="school-year">Year in School:</label>
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
	  			<div class="form-group col-lg-3">
	    			<label for="university">University:</label>
	    			<input type="text" class="form-control" id="university" name="university" required>
	  			</div>
			</div>
			<div class="form-row">
	  			<div class="form-group col-lg-3">
	    			<label for="university-population">Population of University:</label>
	    			<input type="number" class="form-control" id="university-population" name="university-population" required>
	  			</div>
			</div>
			<div class="form-row">
				<div class="form-group col-lg-3">
					<label class="col-form-label">Is there currently a team on campus?</label>
					<div>
						<div class="form-check form-check-inline">
			  				<input class="form-check-input" type="radio" name="team-exists-radio" id="team-exists-yes" value="yes" required>
			  				<label class="form-check-label" for="team-exists-yes">Yes</label>
						</div>
						<div class="form-check form-check-inline">
			  				<input class="form-check-input" type="radio" name="team-exists-radio" id="team-exists-no" value="no" required>
			  				<label class="form-check-label" for="team-exists-no">No</label>
						</div>
					</div>
				</div>
			</div>
			<div class="form-row">
	  			<div class="form-group col-lg-3">
	    			<label for="num-credits">Expected Number of Credit Hours Next Year:</label>
	    			<input type="number" class="form-control" id="num-credits" name="num-credits" required>
	  			</div>
			</div>
			<div class="form-row">
	  			<div class="form-group col-lg-3">
	    			<label for="ada-hours">Expected Number of Hours Per Week:</label>
	    			<input type="number" class="form-control" id="ada-hours" name="ada-hours" required>
	  			</div>
			</div>
			<div class="form-row">
				<div class="form-group col-lg-3">
					<label class="col-form-label">Will you have another part-time job?</label>
					<div>
						<div class="form-check form-check-inline">
			  				<input class="form-check-input" type="radio" name="job-radio" id="job-radio-yes" value="yes" required>
			  				<label class="form-check-label" for="job-radio-yes">Yes</label>
						</div>
						<div class="form-check form-check-inline">
			  				<input class="form-check-input" type="radio" name="job-radio" id="job-radio-no" value="no" required>
			  				<label class="form-check-label" for="job-radio-no">No</label>
						</div>
					</div>
				</div>
			</div>
			<div class="form-row">
	  			<div class="form-group col-lg-3">
	    			<label for="other-job-hours">If so, how many hours will you work?</label>
	    			<input type="number" class="form-control" id="other-job-hours" name="other-job-hours" required>
	  			</div>
			</div>
			<div class="form-row">
				<div class="form-group col-lg-3">
					<label class="col-form-label">Are you a member of the Newman Center?</label>
					<div>
						<div class="form-check form-check-inline">
			  				<input class="form-check-input" type="radio" name="newman-radio" id="newman-radio-yes" value="yes" required>
			  				<label class="form-check-label" for="newman-radio-yes">Yes</label>
						</div>
						<div class="form-check form-check-inline">
			  				<input class="form-check-input" type="radio" name="newman-radio" id="newman-radio-no" value="no" required>
			  				<label class="form-check-label" for="newman-radio-no">No</label>
						</div>
					</div>
				</div>
			</div>
			<div class="form-row">
	  			<div class="form-group col-lg-3">
	    			<label for="num-newman">Estimated Number of Students Involved at the Newman Center:</label>
	    			<input type="number" class="form-control" id="num-newman" name="num-newman" required>
	  			</div>
			</div>
			<div class="form-row">
				<div class="form-group col-lg-3">
					<label class="col-form-label">Are you involved in the Pro-Life group?</label>
					<div>
						<div class="form-check form-check-inline">
			  				<input class="form-check-input" type="radio" name="prolife-radio" id="prolife-radio-yes" value="yes" required>
			  				<label class="form-check-label" for="prolife-radio-yes">Yes</label>
						</div>
						<div class="form-check form-check-inline">
			  				<input class="form-check-input" type="radio" name="prolife-radio" id="prolife-radio-no" value="no" required>
			  				<label class="form-check-label" for="prolife-radio-no">No</label>
						</div>
					</div>
				</div>
			</div>
			<div class="form-row">
	  			<div class="form-group col-lg-3">
	    			<label for="num-prolife">Estimated Number of Students Involved in Pro-Life group:</label>
	    			<input type="number" class="form-control" id="num-prolife" name="num-prolife" required>
	  			</div>
			</div>
			<div class="form-row">
				<div class="form-group col-lg-4">
					<label class="col-form-label">Is your university in the Southern or Northern U.S.?</label>
					<div>
						<div class="form-check form-check-inline">
			  				<input class="form-check-input" type="radio" name="location-radio" id="location-radio-south" value="south" required>
			  				<label class="form-check-label" for="location-radio-south">South</label>
						</div>
						<div class="form-check form-check-inline">
			  				<input class="form-check-input" type="radio" name="location-radio" id="location-radio-north" value="north" required>
			  				<label class="form-check-label" for="location-radio-north">North</label>
						</div>
					</div>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-lg-3">
					<label class="col-form-label">Religious Affiliation:</label>
					<div>
						<div class="form-check form-check-inline">
			  				<input class="form-check-input" type="radio" name="religion-radio" id="religion-radio-catholic" value="catholic" required>
			  				<label class="form-check-label" for="religion-radio-catholic">Catholic</label>
						</div>
						<div class="form-check form-check-inline">
			  				<input class="form-check-input" type="radio" name="religion-radio" id="religion-radio-christian" value="christian" required>
			  				<label class="form-check-label" for="religion-radio-christian">Christian</label>
						</div>
						<div class="form-check form-check-inline">
			  				<input class="form-check-input" type="radio" name="religion-radio" id="religion-radio-other" value="other" required>
			  				<label class="form-check-label" for="religion-radio-other">Other</label>
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
    			<label for="audio-file">Recording of Conversation Using ADA Content:</label>
    			<input type="file" class="form-control-file" id="audio-file">
  			</div>
  			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>
</body>
</html>
<%@ taglib uri="http://ADA-Connect.com/taglib" prefix="cf"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/raphael.min.js"></script>
  	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-mapael/2.2.0/js/jquery.mapael.min.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/usa_states.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/france_departments.js"></script>
	<title>ADA Connect</title>
	    <style type="text/css">
        /* Specific mapael css class are below
         * 'mapael' class is added by plugin
        */
        .mapael .map {
            position: relative;
        }

        .mapael .mapTooltip {
            position: absolute;
            background-color: #474c4b;
            moz-opacity: 0.70;
            opacity: 0.70;
            filter: alpha(opacity=70);
            border-radius: 10px;
            padding: 10px;
            z-index: 1000;
            max-width: 200px;
            display: none;
            color: #fff;
        }
    </style>
</head>
<body class="bg-light">
	<!-- Navbar -->
	<jsp:include page="/views/general/navbar.jsp"></jsp:include>

  	<div class="container">
    	<div class="map">Alternative content</div>
	</div>
	
	<!-- Mission -->
	<div style="background-image:linear-gradient(180deg,#f8f9fa 50%,#232220 50%);">
		<div class="container rounded" style="background-color:#168d65">
			<div class="text-white text-center py-4 px-5">
				<h5>What Drives Us</h5>
				<h2>ADA Mission</h2>
				<p>Our mission is to end abortion by creating cultural change.</p>
				<p>We believe many people are pro-choice simply because they have never heard a rational, well-presented, secular argument against abortion. Our goal is to change that. Our ADA Dialogue Training Program is designed to equip our Dialogue Volunteers with research-driven, persuasive pro-life arguments - so they can quickly and easily explain why everyone, regardless of religion or political affiliation, should be pro-life.</p>
				<p>Change the culture. End Abortion</p>
			</div>
		</div>
	</div>
	
	<!-- ADA Model -->
	<div style="background-color:#232220">
		<div class="container text-white py-4">
			<div class="text-center mb-5">
				<h5>The ADA Model</h5>
				<h2>How it Works</h2>
			</div>
			<div class="row">
				<div class="col-sm-6 text-center mb-5 px-4">
					<div class="mb-4 d-inline-block">
						<span class="d-block" style="width:49px">
						  	<img src="${pageContext.request.contextPath}/resources/img/person-icon.png" style="max-width:100%; height:auto;" alt="">
						</span>
					</div>
					<h4>DIALOGUE INTERNS</h4>
					We recruit and hire talented Dialogue Interns. Our internship functions like many flexible part-time jobs except instead of flipping burgers our Dialogue Interns equip volunteers to change minds
				</div>
				<div class="col-sm-6 text-center mb-5 px-4">
					<div class="mb-4 d-inline-block">
						<span class="d-block" style="width:122px">
						  	<img src="${pageContext.request.contextPath}/resources/img/team-icon.png" style="max-width:100%; height:auto;" alt="">
						</span>
					</div>
					<h4>DIALOGUE TEAMS</h4>
					Each Dialogue Intern assembles, trains and leads a Dialogue Team of 10 dedicated Dialogue Volunteers through weekly outreach events where they engage and persuade pro-choice advocates in their area
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6 text-center mb-5 px-4">
					<div class="mb-4 d-inline-block">
						<span class="d-block" style="width:107px">
						  	<img src="${pageContext.request.contextPath}/resources/img/chat-icon-1.png" style="max-width:100%; height:auto;" alt="">
						</span>
					</div>
					<h4>CREATE CONVERSATIONS</h4>
					One Dialogue Team can create hundreds of persuasive conversations on the abortion topic using the arguments we teach in our ADA Dialogue Training Program
				</div>
				<div class="col-sm-6 text-center mb-5 px-4">
					<div class="mb-4 d-inline-block">
						<span class="d-block" style="width:84.5px">
						  	<img src="${pageContext.request.contextPath}/resources/img/heart-icon.png" style="max-width:100%; height:auto;" alt="">
						</span>
					</div>
					<h4>CHANGE CULTURE</h4>
					As our Dialogue Teams change hearts and minds on abortion we begin to shift the cultural opinion on the abortion topic back ton one that values and protects life
				</div>
			</div>
		</div>
	</div>
</body>
<script>
$(function () {
    $(".container").mapael({
        map: {
            name: "usa_states"
        },
        // Add some plots on the map
        plots: {
            // Circle plot
            'omaha': {
                type: "circle",
                latitude: 41.26,
                longitude: -95.93,
                tooltip: {content: "<span style=\"font-weight:bold;\">City :</span> Omaha <br />"},
            }
        }
    });
});
</script>
</html>
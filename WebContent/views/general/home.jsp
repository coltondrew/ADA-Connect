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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/chroma-js/1.1.1/chroma.min.js" charset="utf-8"></script>	
  	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/raphael.min.js"></script>
  	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-mapael/2.2.0/js/jquery.mapael.min.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/usa_states.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/france_departments.js"></script>
  	<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/resources/img/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/resources/img/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/img/favicon-16x16.png">
	<link rel="manifest" href="${pageContext.request.contextPath}/resources/img/site.webmanifest">
	<style type="text/css">
        /* Specific mapael css class are below
         * 'mapael' class is added by plugin
        */

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
        
        .mapael .map {
            position: relative;
        }
        
        circle {
        	cursor:pointer;
        }
    </style>
	<title>ADA Connect</title>
</head>
<body class="bg-light">
	<!-- Navbar -->
	<jsp:include page="/views/general/navbar.jsp"></jsp:include>

  	<div class="container mt-3">
    	<div class="map">Alternative content</div>
	</div>
	
	<!-- Mission -->
	<div class="mt-4" style="background-image:linear-gradient(180deg,#f8f9fa 50%,#232220 50%);">
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
var contextPath = "${pageContext.request.contextPath}";
var domain = "${pageContext.request.serverName}";
var port = "${pageContext.request.serverPort}";

$(function () {
	var url = "http://" + domain + ":" + port + contextPath + "/list-teams"; 
		
	$.getJSON(url, function(teams) {
		console.log(teams);
		var plots = {};
		var plotsColors = chroma.scale("Greens");
		$.each(teams, function(num, team) {
			var plot = {};
			plot.latitude = team.latitude;
			plot.longitude = team.longitude;
			plot.tooltip = {content: "<span style=\"font-weight:bold;\">Team: </span>" + team.teamname + "<br />"};
			plot.type = "circle";
			plot.teamID = team.ID;
			// Assign the background color randomize from a scale
            plot.attrs = {
                fill: "#168d65"
			};
			plots[num] = plot;
		});
		
	    $(".container").mapael({
	        map: {
	            name: "usa_states",
	            defaultPlot: {
                    eventHandlers: {
                        click: function (e, id, mapElem, textElem, elemOptions) {
                            if (typeof elemOptions.teamID != 'undefined') {
                            	console.log(elemOptions.teamID);
                            	var link = "http://" + domain + ":" + port + contextPath + "/team?id=" + elemOptions.teamID; 
								window.location.href = link;
                            }
                        }
                    }
                }
	        },
	        // Add some plots on the map
	        plots: plots
	    });		
	});
});
</script>
</html>
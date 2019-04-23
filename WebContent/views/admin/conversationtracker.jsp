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
	<title>Conversation Tracker</title>
	<style>
		.dropdown-item:active {
	    background-color: #168d65;
	}
	</style>
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
	        	<h1>Track Conversations</h1>
	        	<hr/>
	        	
				<div class="d-flex justify-content-center">
		        	<div class="spinner-grow" role="status" id="spinner" style="color:#168d65;width:7rem;height:7rem">
	  					<span class="sr-only">Loading...</span>
					</div>
				</div>
	        	<div id="loading-content" style="display:none;">
		        	<form action="${pageContext.request.contextPath}/admin/conversation-tracker" method="post">
		        		<div class="form-row">
			        		<div class="form-group col-md-2">
				            	<label for="year">Year:</label>
				                <select class="form-control" name="year" id="year" onchange="updateWeeks(this)" required>
				                </select>
			            	</div>
			            	<div class="form-group col-md-2">
				            	<label for="week">Week:</label>
				                <select class="form-control" name="week" id="week" onchange="updateTable(this)" required>
				                </select>
			            	</div>
						    <div class="col form-group mt-auto d-flex justify-content-start">
							    <div class="btn-group" id="new-btns">
									<button type="button" class="btn text-white dropdown-toggle mx-1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="width:124px;background-color:#168d65;border-color:#168d65">
									  New
									</button>
									<div class="dropdown-menu">
									  <button type="button" id="new-week-btn" class="dropdown-item">New Week</button>
									  <button type="button" id="new-year-btn" class="dropdown-item">New Year</button>
									</div>
								</div>
						        <button type="button" class="btn mx-1 text-white" id="edit-btn" style="width:124px;background-color:#168d65;border-color:#168d65" >Edit</button>
							    <button type="submit" class="btn mx-1 save-btn text-white" id="new-save-btn" style="width:124px;background-color:#168d65;border-color:#168d65">Save Changes</button>
							    <button type="submit" class="btn mx-1 save-btn text-white" id="edit-save-btn" style="width:124px;background-color:#168d65;border-color:#168d65">Save Changes</button>
							    <button type="button" class="btn btn-secondary mx-1 cancel-btn text-white" id="new-cancel-btn" style="width:124px;">Cancel</button>   
							    <button type="button" class="btn btn-secondary mx-1 cancel-btn text-white" id="edit-cancel-btn" style="width:124px;">Cancel</button>   							   
							    <button type="submit" class="btn btn-danger mx-1 text-white" id="del-btn" style="width:124px;">Delete</button>     
							</div>
						</div>
		        	
			        	<table class="table" id="stats-table">
							<thead class="thead-dark">
						    	<tr>
						      		<th scope="col">Name</th>
						      		<th scope="col">Conversations</th>
						      		<th scope="col">Conversions</th>
						    	</tr>
						  	</thead>
						  	<tbody id="tbody">
					        	<c:forEach items="${requestScope.statsList}" var="stats">
				        			<tr>
				        				<td><c:out value="${stats.vol.getFirstname()} ${stats.vol.getLastname()}"/></td>
				        				<td>
				        					<input type="hidden" name="id" value="${vol.getVolID()}"/>	
				        					<input type="number" class="form-control" name="conversations-${stats.vol.getVolID()}" required>
				        				</td>
				        				<td><input type="number" class="form-control" name="conversions-${stats.vol.getVolID()}" required></td>		        				
				        			</tr>
				      			</c:forEach>
						  	</tbody>
		      			</table>
	      			</form>
	        	</div>
	      	</div>
	    </div>
	</div>
</body>
<script>
var contextPath = "${pageContext.request.contextPath}";
var domain = "${pageContext.request.serverName}";
var port = "${pageContext.request.serverPort}";

var url = "http://" + domain + ":" + port + contextPath;
var yearWeekMap = null;
$(document).ready(function(){
	// Hide Elements
	$("#loading-content").hide();
	$("#del-btn").hide();
	$(".save-btn").hide();
	$(".cancel-btn").hide();
	
	// Show Elements
	$("#spinner").show();
	$("#new-btns").show();
	$("#edit-btn").show();
	$(".dispText").show();
	
	$.getJSON(url + "/get-distinct-years-weeks", function(result) {
		yearWeekMap = result;
		var years = Object.keys(result);
		years.sort();

		// Set years select menu
		$.each(years, function(i, year) {
			 $('#year').append($('<option>', { 
			        value: year,
			        text : year 
			    }));
		});
		
		// Set weeks select menu
		var currentYear = years[years.length - 1];
		$("#year").val(currentYear);
		$("#year").trigger("change");
 	});
});

function updateWeeks() {
	var weeks = yearWeekMap[$("#year").val()];
	$("#week").empty();
	$.each(weeks, function(i, week) {
		 $('#week').append($('<option>', { 
		        value: week,
		        text : week 
		    }));
	});
	var currentWeek = weeks[weeks.length - 1];
	$("#week").val(currentWeek);
	$("#week").trigger("change");
}

function updateTable() {
	// Wait for json to load
	$("#loading-content").hide();
	$("#spinner").show();
	
	var yearNum = $("#year").val();
	var weekNum = $("#week").val();
	$("#stats-table tbody").empty();

	$.getJSON(url + "/get-stats", {week: weekNum, year: yearNum}, function(result) {
		// Set years select menu
		$.each(result, function(i, stat) {
			var volName = stat.vol.firstname + " " + stat.vol.lastname;
			var volID = stat.vol.volID;
			var conversations = stat.conversations;
			var conversions = stat.conversions;
			var nameCol = '<td>' + volName + '</td>';
			var conversationCol = '<td><input type="hidden" name="id" value="' + volID + '"/><span class="dispText">' + conversations + '</span><input type="number" class="form-control editable" name="conversations-' + volID + '" value="' + conversations + '"required></td>';
			var conversionCol = '<td><span class="dispText">' + conversions + '</span><input type="number" class="form-control editable" name="conversions-' + volID + '" value="' + conversions + '" required></td>';
			var markup = '<tr>' + nameCol + conversationCol + conversionCol + '</tr>';
		    $("table tbody").append(markup);
		});
		
		$(".editable").hide();
		$("#spinner").hide();
		$("#loading-content").show();
// 		console.log(result);
	});
}
	
$('#edit-btn').click(function(){
	// Hide elements
	$(this).hide();
	$("#new-btns").hide();
	$(".dispText").hide();
	$('#week').prop('disabled', 'disabled');
	$('#year').prop('disabled', 'disabled');
	
	// Show elements
	$("#edit-save-btn").show();
	$(".editable").show();
	$("#del-btn").show();
	$("#edit-cancel-btn").show();
	
	var week = parseInt($("#week").val());
	var year = parseInt($("#year").val());
	var years = Object.keys(yearWeekMap);
	var currentYear = parseInt(years[years.length - 1]);
	var weeks = yearWeekMap[currentYear];
	var currentWeek = parseInt(weeks[weeks.length - 1]);
	if(week === currentWeek && year === currentYear) {
		$("#del-btn").prop('disabled', false);
	}
	else {
		$("#del-btn").prop('disabled', true);
	}
});

$("#edit-cancel-btn").click(function() {
	// Hide elements
	$("#edit-save-btn").hide();
	$("#edit-cancel-btn").hide();
	$("#del-btn").hide();
	$(".editable").hide();
	
	// Show elements
	$("#new-btns").show();
	$("#edit-btn").show();
	$(".dispText").show();
	$('#week').prop('disabled', false);
	$('#year').prop('disabled', false);
});

$('.save-btn').click(function(){
	$(this).hide();
	$("#edit-btn").show();
	$(".dispText").show();
	
	$(".editable").each(function(i, input) {
		if($.trim(input.value) == '') {
			$(this).val("0");
			$(this).prev().html("0");
		}
		else {
			$(this).prev().html(input.value);

		}
	});
	
	$(".editable").hide();
});

$("#new-week-btn").click(function() {
	// Wait for json to load
	$("#loading-content").hide();
	$("#spinner").show();

	// Hide elements
	$("#new-btns").hide();
	$("#edit-btn").hide();
	$(".dispText").hide();
// 	$("#tbody").hide();
	$("#del-btn").hide();
	
	// Show elements
	$("#new-save-btn").show();
	$("#new-cancel-btn").show();
	$(".editable").show();
	
	// Set years dropdown
	var years = Object.keys(yearWeekMap);
	var currentYear = years[years.length - 1];
	$("#year").val(currentYear);
	$('#year').prop('disabled', 'disabled');
	
	// Set weeks dropdown
	var weeks = yearWeekMap[currentYear];
	$("#week").empty();
	$.each(weeks, function(i, week) {
		 $('#week').append($('<option>', { 
		        value: week,
		        text : week 
		    }));
	});
	var newWeek = weeks[weeks.length - 1] + 1;
// 	console.log(newWeek);
	 $('#week').append($('<option>', { 
	        value: newWeek,
	        text : newWeek 
	    }));
	$("#week").val(newWeek);
	$('#week').prop('disabled', 'disabled');
	
	// Update table
	$.getJSON(url + "/get-active-vols", function(result) {
		$("#stats-table tbody").empty();
		// Set years select menu
		$.each(result, function(i, vol) {
			var volName = vol.firstname + " " + vol.lastname;
			var volID = vol.volID;
			var conversations = 0;
			var conversions = 0;
			var nameCol = '<td>' + volName + '</td>';
			var conversationCol = '<td><input type="hidden" name="id" value="' + volID + '"/><span class="dispText">' + conversations + '</span><input type="number" class="form-control editable" name="conversations-' + volID + '" value="' + conversations + '"required></td>';
			var conversionCol = '<td><span class="dispText">' + conversions + '</span><input type="number" class="form-control editable" name="conversions-' + volID + '" value="' + conversions + '" required></td>';
			var markup = '<tr>' + nameCol + conversationCol + conversionCol + '</tr>';
		    $("table tbody").append(markup);
		});
		
		$(".dispText").hide();
		$("#spinner").hide();
		$("#loading-content").show();
// 		$("#tbody").show();
	});
});

$("#new-year-btn").click(function() {
	// Wait for json to load
	$("#loading-content").hide();
	$("#spinner").show();
	
	// Hide elements
	$("#new-btns").hide();
	$("#edit-btn").hide();
	$(".dispText").hide();
// 	$("#tbody").hide();
	$("#del-btn").hide();
	
	// Show elements
	$("#new-save-btn").show();
	$("#new-cancel-btn").show();
	$(".editable").show();
	
	// Set years dropdown
	var years = Object.keys(yearWeekMap);
	var newYear = parseInt(years[years.length - 1]) + 1;
	$('#year').append($('<option>', { 
        value: newYear,
        text : newYear 
    }));
	$("#year").val(newYear);
	$('#year').prop('disabled', 'disabled');
	
	// Set weeks dropdown
	$("#week").empty();
	$('#week').append($('<option>', { 
	       value: 1,
	       text : 1 
	   }));
	$("#week").val("1");
	$('#week').prop('disabled', 'disabled');
	
	// Update table
	$.getJSON(url + "/get-active-vols", function(result) {
		$("#stats-table tbody").empty();
		// Set years select menu
		$.each(result, function(i, vol) {
			var volName = vol.firstname + " " + vol.lastname;
			var volID = vol.volID;
			var conversations = 0;
			var conversions = 0;
			var nameCol = '<td>' + volName + '</td>';
			var conversationCol = '<td><input type="hidden" name="id" value="' + volID + '"/><span class="dispText">' + conversations + '</span><input type="number" class="form-control editable" name="conversations-' + volID + '" value="' + conversations + '"required></td>';
			var conversionCol = '<td><span class="dispText">' + conversions + '</span><input type="number" class="form-control editable" name="conversions-' + volID + '" value="' + conversions + '" required></td>';
			var markup = '<tr>' + nameCol + conversationCol + conversionCol + '</tr>';
		    $("table tbody").append(markup);
		});
		
		$(".dispText").hide();
		$("#spinner").hide();
		$("#loading-content").show();
// 		$("#tbody").show();
	});
});

$("#new-cancel-btn").click(function() {
	// Hide elements
	$("#new-save-btn").hide();
	$("#new-cancel-btn").hide();
	$(".editable").hide();
	
	// Show elements
	$("#new-btns").show();
	$("#edit-btn").show();
	$(".dispText").show();
	
	// Set years dropdown
	var years = Object.keys(yearWeekMap);
	var currentYear = years[years.length - 1];
	$("#year").val(currentYear);
	$('#year').prop('disabled', false);
	
	// Set weeks dropdown
	$("#week").prop('disabled', false);
	
	if(!yearWeekMap.hasOwnProperty(year)) {
		// Set years select menu
		$("#year").empty();
		var years = Object.keys(yearWeekMap);
		var currentYear = years[years.length - 1];

		$.each(years, function(i, year) {
			 $('#year').append($('<option>', { 
			        value: year,
			        text : year 
			    }));
		});
		$("#year").val(currentYear);
	}
	updateWeeks();
});

$("form").submit(function(event) {
	event.preventDefault();
	var action = getClickedBtn();
	$('#week').prop('disabled', false);
	$('#year').prop('disabled', false);
    
    var postUrl = $(this).attr("action"); //get form action url
	var requestMethod = $(this).attr("method"); //get form GET/POST method
	var formData = $(this).serializeArray(); // convert form to array
	formData.push({name: "action", value: action});
// 	console.log(formData);
	
	$.ajax({
	    type: requestMethod,
	    url: postUrl,
	    data: $.param(formData)
	});
	
	// Hide elements
	$(".save-btn").hide();
	$(".cancel-btn").hide();
	$("#del-btn").hide();
	$(".editable").hide();
	
	// Show elements
	$("#new-btns").show();
	$("#edit-btn").show();
	$(".dispText").show();
	if(action === "add") {
		var year = $("#year").val();
		if(yearWeekMap.hasOwnProperty(year)) {
			var week = $("#week").val();
			yearWeekMap[year].push(parseInt(week));
// 			console.log(yearWeekMap);
		}
		else {
			var year = $("#year").val();
			yearWeekMap[year] = [1];
// 			console.log("NEW YEAR");
// 			console.log(yearWeekMap);
		}
	}
	else if(action === "update") {
		
	}
	else if(action === "delete") {
		var year = $("#year").val();
		var weeks = yearWeekMap[year];
		weeks.pop();
		if(weeks.length === 0) {
			delete yearWeekMap[year];
		}
		
		// Set years select menu
		$("#year").empty();
		var years = Object.keys(yearWeekMap);
		var currentYear = years[years.length - 1];

		$.each(years, function(i, year) {
			 $('#year').append($('<option>', { 
			        value: year,
			        text : year 
			    }));
		});
		$("#year").val(currentYear);
		
		updateWeeks();
// 		console.log(yearWeekMap);
	}
// 	$("#tbody").show();
});

$("button[type=submit]").click(function() {
    $("button[type=submit]").removeAttr("clicked");
    $(this).attr("clicked", "true");
});

function getClickedBtn() {
    var btn = $("button[type=submit][clicked=true]").attr("id");
    if(btn === "edit-save-btn") {
    	return "update";
    }
    else if(btn === "new-save-btn") {
    	return "add";
    }
    else if(btn === "del-btn"){
    	return "delete";
    }
    else {
    	return "none";
    }
}
// $("#year").click(function() {
// 	console.log("YEAR CLICKED");
// });

</script>
</html>
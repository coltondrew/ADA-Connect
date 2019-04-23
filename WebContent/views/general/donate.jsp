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
	<title>Donate</title>
	<style>
	h1 {
	    font-family: 'Oswald',Helvetica,Arial,Lucida,sans-serif;
	    font-size: 100px;
	    text-align: center;
	    padding-bottom: 0px;
	    color: #333;
	    font-weight: 700;
	    line-height: 1em;
	    margin-bottom:0;
	}
	p {
		font-family: 'Lora',Georgia,"Times New Roman",serif;
		font-size: 20px;
	}
	h4 {
		font-family: 'Oswald',Helvetica,Arial,Lucida,sans-serif;
	    text-transform: uppercase;
	    font-size: 21px;
	    line-height: 1.7em;
	    text-align: center;
	    font-weight:700
	}
	.btn-green {
		border-width: 15px!important;
	    border-color: rgba(210,159,104,0);
	    border-radius: 59px;
	    letter-spacing: 3px;
	    font-size: 16px;
	    font-family: 'Oswald',Helvetica,Arial,Lucida,sans-serif!important;
	    text-transform: uppercase!important;
	    background-color: #168d65;
	    color: #fff!important;
	    display: inline-block;
	    padding: 0.3em 1em!important;
	    position: relative;
	    font-weight:725;
	}
	</style>
</head>
<body style="background-color:#232220">
	<!-- Navbar -->
	<jsp:include page="/views/general/navbar.jsp"></jsp:include>

	<!-- Converts -->
	<div>
		<div class="container mt-4">
			<div class="text-center text-white mb-5">
				<h5>WHEN YOU GIVE TO ADA</h5>
				<h2>You Changes Minds</h2>
			</div>
			
			<div class="row text-center text-white mb-4">
				<div class="col-lg-4 mb-3">
					<div class="mb-4">
						<h1>
							<span style="color:#168d65">$50</span>
						</h1>
						<p>
							<span style="color:#ffffff">a month</span>
						</p>
					</div>
					<div>
						<h4>CREATES 1 CONVERT</h4>
					</div>
					<div>
						<p style="line-height:2em;font-size:18px;">
							A $50 a month gift covers the cost of creating 1 convert each month. Your gift would help us change 1 person's mind on abortion every month!
						</p>
					</div>
				</div>
				<div class="col-lg-4 mb-3">
					<div class="mb-4">
						<h1>
							<span style="color:#168d65">$100</span>
						</h1>	
						<p>
							<span style="color:#ffffff">a month</span>
						</p>				
					</div>
					<div>
						<h4>EQUIPS 2 VOLUNTEERS</h4>
					</div>
					<div>
						<p style="line-height:2em;font-size:18px;">
							A $100 a month gift covers the cost of weekly training for 2 Dialogue Volunteers. Your gift would create, on average, 30 converts in one year!
						</p>
					</div>
				</div>
				<div class="col-lg-4 mb-3">
					<div class="mb-4">
						<h1>
							<span style="color:#168d65">$500</span>
						</h1>
						<p>
							<span style="color:#ffffff">a month</span>
						</p>
					</div>
					<div>
						<h4>SPONSORS 1 DIALOGUE TEAM</h4>
					</div>
					<div>
						<p style="line-height:2em;font-size:18px;">
							A $500 a month gift covers the cost of equipping an entire Dialogue Team. Your gift would create, on average, 149 converts in one year!
						</p>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row" style="padding:0 10%;margin:0">
			<div class="col-md-6 text-center mb-4">
				<a class="btn btn-green" href="https://secure.egsnetwork.com/donate/A7857559BF94440" role="button" target="_blank">GIVE ONLINE</a>
			</div>
			<div class="col-md-6 text-center mb-4">
				<a class="btn btn-green" href="${pageContext.request.contextPath}/resources/misc/Mail-In-Form.pdf" role="button" target="_blank">GIVE BY MAIL</a>
			</div>
		</div>
	</div>
</body>
</html>
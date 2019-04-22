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
	<title>About</title>
</head>
<body class="bg-light">
	<!-- Navbar -->
	<jsp:include page="/views/general/navbar.jsp"></jsp:include>
	
	<!-- Staff -->
	<div class="container mt-4">
		<div class="text-center">
			<h5>ABOUT US</h5>
			<h2>Meet Our Team</h2>
		</div>
		<div class="row my-4">
			<div class="col-12">
				<div class="row">
					<div class="col-12 col-lg-4" style="padding:0 3%">
						<div class="mb-4">
							<img src="${pageContext.request.contextPath}/resources/img/jacob-headshot.jpg" class="rounded mx-auto d-block" style="width:100%;height:auto" alt="">
						</div>
						<h4>Jacob Burow</h4>
						<p>Founder, Executive Director</p>
						<p>Jacob's pro-life activism began in Bryan Texas where he was heavily involved in the 40 Days for Life movement. In 2001 he began volunteering with Justice For All as their Logistics Coordinator. He spent 11 years working extensively with JFA as a certified Dialogue Trainer. He accepted a full time position in 2012. During his time at Justice for All Jacob had over 3000 conversations with people on the abortion issue. In 2014 Jacob co-founded the Abortion Dialogue Academy. In 2016 he married Katie Burow, his co-founder and business partner. Today he serves as the Executive Director and President of the organization.</p>
					</div>
					<div class="col-12 col-lg-4" style="padding:0 3%">
						<div class="mb-4">
							<img src="${pageContext.request.contextPath}/resources/img/katie-headshot.jpg" class="rounded mx-auto d-block" style="width:100%;height:auto" alt="">
						</div>
						<h4>Katherine Burow</h4>
						<p>Founder, Programs Director</p>
						<p>Katie graduated from Washington University in St. Louis with a degree in Marketing, Economics and Strategy at the Olin Business School. While in college Katie led the WU Students for Life club for 3 years. She also worked as a summer intern at Justice For All in 2012 and 2013. In 2013 she completed the Students For Life of America Wilberforce Fellowship. In 2014, Katie co-founded the Abortion Dialogue Academy. In 2016 she married Jacob Burow, her co-founder and business partner. Today she serves as the Vice President and Programs Director for the organization.</p>
					</div>
					<div class="col-12 col-lg-4" style="padding:0 3%">
						<div class="mb-4">
							<img src="${pageContext.request.contextPath}/resources/img/phil-headshot.jpg" class="rounded mx-auto d-block" style="width:100%;height:auto" alt="">
						</div>
						<h4>Phillip Baumberger</h4>
						<p>Programs Coordinator- Omaha</p>
						<p>In 2016 Phillip co-founded Mavericks for Life at the University of Nebraska in Omaha. During his first year using ADA's Dialogue Training Program he had over 100 conversations with pro-choice advocates. In 2017 he became ADA's first Dialogue Intern and his Dialogue Team created 1000 abortion conversations and 149 converts in one year. He is an ADA certified mentor with a 21% conversion rate. He will graduate from the University of Nebraska in Omaha in 2019 with degrees in Math, Computer Science and Spanish.</p>
					</div>
				</div>
			</div>
			<div class="col-12">
				<div class="row">
					<div class="col-12 col-lg-4" style="padding:0 3%">
						<div class="mb-4">
							<img src="${pageContext.request.contextPath}/resources/img/pamela-headshot.jpg" class="rounded mx-auto d-block" style="width:100%;height:auto" alt="">
						</div>
						<h4>Pamela Burow</h4>
						<p>Office Manager</p>
						<p>Pamela has been managing ADA's donations and mailings since 2015. She has a degree from Texas A&M university.</p>
					</div>
					<div class="col-12 col-lg-4" style="padding:0 3%">
						<div class="mb-4">
							<img src="${pageContext.request.contextPath}/resources/img/amos-headshot.jpg" class="rounded mx-auto d-block" style="width:100%;height:auto" alt="">
						</div>
						<h4>Amos Long</h4>
						<p>ADA App Developer</p>
						<p>Amos is a Software Consultant in St. Louis, MO.  He served on the area planning committee for 40 Days for Life in his hometown of Peoria, IL.  He has a degree in Mathematics, Computer Science, and Religion from Illinois Wesleyan University.</p>
					</div>
					<div class="col-12 col-lg-4" style="padding:0 3%">
						<div class="mb-4">
							<img src="${pageContext.request.contextPath}/resources/img/erin-headshot.jpg" class="rounded mx-auto d-block" style="width:100%;height:auto" alt="">
						</div>
						<h4>Erin Jones</h4>
						<p>Nebraska Dialogue Intern</p>
						<p>During Erin's first year using ADA's Dialogue Training Program she had 134 conversations with pro-choice advocates and a 9% conversion rate. As the newest addition to our team she will be leading the Maverick Students for Life Dialogue Team this Fall 2018. Erin is a sophomore at the University of Nebraska in Omaha studying for a major in Speech Language Pathology.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
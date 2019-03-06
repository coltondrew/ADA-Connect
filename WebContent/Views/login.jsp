<%@ page import="models.User"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>ADA Connect Login</title>
</head>
<body>
	<nav class="navbar navbar-default">
	    <div class="container-fluid">
	        <!-- Brand and toggle get grouped for better mobile display -->
	        <div class="navbar-header">
	            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
	                <span class="sr-only">Toggle navigation</span>
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
	            </button>
	            <a class="navbar-brand" href="#">ADA Connect</a>
	        </div>
	
	        <!-- Collect the nav links, forms, and other content for toggling -->
	        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	            <ul class="nav navbar-nav">
	                <li><a href="home">Home<span class="sr-only"></span></a></li>
	                <li><a href="news">News<span class="sr-only"></span></a></li>
	                <li><a href="Teams">Teams<span class="sr-only"></span></a></li>
	                <li class="active"><a href="admin">Admin<span class="sr-only"></span></a></li>
	                <%
					User currentUser = (User) session.getAttribute("user");
					if(currentUser != null) {
					%>
	                	<li><a href="logout">Log out<span class="sr-only"></span></a></li>
	                <%
					}
	                %>
	            </ul>
	        </div><!-- /.navbar-collapse -->
	    </div><!-- /.container-fluid -->
	</nav>
	<!-- Login  -->
	<div class="container-fluid">
		<h1>Log in</h1>
		
		<%
			if(request.getAttribute("invalidUserCreds") != null) {
				out.println("<p style=\"color:red;\">Invalid username or password! Please try again!</p>");
			}
			
		%>
		<form action="login" method="post">
			<div class="row">
	  			<div class="form-group col-xs-4">
	    			<label for="username">Username:</label>
	    			<input type="text" class="form-control" id="username" name="username" required>
	  			</div>
			</div>
			<div class="row">
	  			<div class="form-group col-xs-4">
	    			<label for="password">Password:</label>
	    			<input type="password" class="form-control" id="password" name="password" required>
	  			</div>
			</div>
  			<button type="submit" class="btn btn-primary" id ="loginbutton">Submit</button>
		</form>
	</div>
</body>
</html>
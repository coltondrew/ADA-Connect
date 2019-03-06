<%@ page import="models.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>ADA Connect Admin Console</title>
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
	            <a class="navbar-brand" href="home">ADA Connect</a>
	        </div>
	
	        <!-- Collect the nav links, forms, and other content for toggling -->
	        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	            <ul class="nav navbar-nav">
	                <li><a href="home">Home<span class="sr-only"></span></a></li>
	                <li><a href="news">News<span class="sr-only"></span></a></li>
	                <li><a href="teams">Teams<span class="sr-only"></span></a></li>
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
<!--   <a href="home">Home</a> -->
<!--   <a href="news">News</a> -->
<!--   <a href="teams">Teams</a> -->
<!--   <a href="admin">Admin</a> -->
<!--   <a href="logout" class="btn btn-primary">Log out</a> -->
	<div class="container-fluid">
		<%
		if(currentUser == null) {
		%>
			<h1>Error!!</h1>
			<a href="login" class="btn btn-primary">Log in</a>
		<%
		}
		else {
// 			String username = currentUser.getUsername();
// 			out.println("<h1>Welcome " + username + "!</h1>");
		%>
		<h1> Add a new user </h1>
		<form action="admin" method="post">
			<div class="row">
	  			<div class="form-group col-xs-4">
	    			<label for="first-name">First Name:</label>
	    			<input type="text" class="form-control" id="first-name" name="first-name" required>
	  			</div>
			</div>
			<div class="row">
	  			<div class="form-group col-xs-4">
	    			<label for="last-name">Last Name:</label>
	    			<input type="text" class="form-control" id="last-name" name="last-name" required>
	  			</div>
			</div>
			<div class="row">
				<div class="form-group col-xs-4">
	            	<label for="role">Role:</label>
	                <select class="form-control" name='role' id="role" required>
	                	<option></option>
	                	<option>CEO</option>
	                    <option>Regional Coordinator</option>
	                    <option>Team Leader</option>
	                </select>
	            </div>
			</div>
			<div class="row">
	  			<div class="form-group col-xs-4">
	    			<label for="username">Username:</label>
	    			<input type="text" class="form-control" id="username" name="username" required>
	  			</div>
			</div>
			<div class="row">
	  			<div class="form-group col-xs-4">
	    			<label for="password">Password:</label>
	    			<input type="text" class="form-control" id="password" name="password" required>
	  			</div>
			</div>
  			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
		<%		
		}
		%>
	</div>
</body>
</html>
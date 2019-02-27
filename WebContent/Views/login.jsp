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
	<!-- Login  -->
  <a href="home">Home</a>
  <a href="news">News</a>
  <a href="teams">Teams</a>
  <a href="admin">Admin</a>
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
	    			<input type="text" class="form-control" id="username" name="username">
	  			</div>
			</div>
			<div class="row">
	  			<div class="form-group col-xs-4">
	    			<label for="passwor">Password:</label>
	    			<input type="password" class="form-control" id="password" name="password">
	  			</div>
			</div>
  			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
<!-- 		<form action="login" method="post"> -->
<!-- 			Email:<br> <input type="text" name="username" required><br> -->
<!-- 			<br>Password:<br> <input type="password" name="password" required><br> -->
<!-- 			<br> <input type="submit" value="Submit"> -->
<!-- 		</form> -->
	</div>
</body>
</html>
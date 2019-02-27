<%@ page import="models.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>ADA Connect Admin Console</title>
</head>
<body>
  <a href="home">Home</a>
  <a href="news">News</a>
  <a href="teams">Teams</a>
  <a href="admin">Admin</a>
	<div class="container-fluid">
		<%
		User currentUser = (User) session.getAttribute("user");
		if(currentUser == null) {
		%>
			<h1>Error!!</h1>
			<a href="login" class="btn btn-primary">Log in</a>
		<%
		}
		else {
			String username = currentUser.getUsername();
			out.println("<h1>Welcome " + username + "!</h1>");
		%>
		<p> This is the admin page, options will be added here. <p>
			<a href="logout" class="btn btn-primary">Log out</a>
		<%		
		}
		%>
	</div>
</body>
</html>
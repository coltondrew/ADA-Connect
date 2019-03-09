<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
 	<a class="navbar-brand" href="#">ADA Connect</a>
 	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
   		<span class="navbar-toggler-icon"></span>
 	</button>

 	<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
   		<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
     		<li class="nav-item active">
       			<a class="nav-link" href="home">Home</a>
     		</li>
     		<li class="nav-item">
       			<a class="nav-link" href="news">News</a>
     		</li>
     		<li class="nav-item">
       			<a class="nav-link" href="teams">Teams</a>
     		</li>
     		<li class="nav-item">
       			<a class="nav-link" href="admin">Admin</a>
     		</li>
     		<c:set var = "user" value = "${sessionScope.user}" />
			<c:if test = "${user != null}" >
				<li class="nav-item">
					<a class="nav-link" href="logout">Log out</a>
				</li>
			</c:if>
   		</ul>
 	</div>
</nav>

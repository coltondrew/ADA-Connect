<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
 	<a class="navbar-brand" href="/ADA-Connect/home">ADA Connect</a>
 	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
   		<span class="navbar-toggler-icon"></span>
 	</button>

 	<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
   		<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
     		<li class="nav-item active">
       			<a class="nav-link" href="/ADA-Connect/home">Home</a>
     		</li>
     		<li class="nav-item">
       			<a class="nav-link" href="/ADA-Connect/about">About</a>
     		</li>
     		<li class="nav-item dropdown">
        		<a class="nav-link dropdown-toggle" href="#" id="teamsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          			Teams
        		</a>
        		<div class="dropdown-menu" aria-labelledby="teamsDropdown">
          			<a class="dropdown-item" href="/ADA-Connect/team">Team</a>
        		</div>
      		</li>
     		<li class="nav-item">
       			<a class="nav-link" href="/ADA-Connect/leaderboard">Leaderboard</a>
     		</li>
     		<li class="nav-item">
       			<a class="nav-link" href="/ADA-Connect/converts">Converts</a>
     		</li>
     		<li class="nav-item dropdown">
        		<a class="nav-link dropdown-toggle" href="#" id="involveDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          			Get Involved
        		</a>
        		<div class="dropdown-menu" aria-labelledby="involveDropdown">
          			<a class="dropdown-item" href="/ADA-Connect/volunteer">Dialogue Volunteer</a>
          			<a class="dropdown-item" href="/ADA-Connect/prayer-partner">Prayer Partner</a>
          			<a class="dropdown-item" href="/ADA-Connect/team-leader">Team Leader</a>
        		</div>
      		</li>
     		<li class="nav-item">
       			<a class="nav-link" href="/ADA-Connect/donate">Donate</a>
     		</li>
     		<li class="nav-item">
       			<a class="nav-link" href="/ADA-Connect/admin">Admin</a>
     		</li>
     		<c:set var="user" value="${sessionScope.user}" />
			<c:if test="${user != null}" >
				<li class="nav-item">
					<a class="nav-link" href="/ADA-Connect/admin/logout">Log out</a>
				</li>
			</c:if>
   		</ul>
 	</div>
</nav>

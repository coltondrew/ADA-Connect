<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://ADA-Connect.com/taglib" prefix="cf"%>


<nav class="navbar navbar-expand-lg navbar-light bg-light">
 	<a class="navbar-brand" href="/ADA-Connect/home">ADA Connect</a>
 	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
   		<span class="navbar-toggler-icon"></span>
 	</button>

 	<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
   		<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
   			<c:set var="active" value="${fn:endsWith(pageContext.request.requestURI, 'home.jsp') }" />
     		<li class="${active ? 'nav-item active' : 'nav-item'}">
       			<a class="nav-link" href="/ADA-Connect/home">Home</a>
     		</li>
     		<c:set var="active" value="${fn:endsWith(pageContext.request.requestURI, 'about.jsp') }" />
     		<li class="${active ? 'nav-item active' : 'nav-item'}">
       			<a class="nav-link" href="/ADA-Connect/about">About</a>
     		</li>
     		<c:set var="active" value="${fn:endsWith(pageContext.request.requestURI, 'team.jsp') }" />
     		<li class="${active ? 'nav-item dropdown active' : 'nav-item dropdown'}">
        		<a class="nav-link dropdown-toggle" href="#" id="teamsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          			Teams
        		</a>
        		<div class="dropdown-menu" aria-labelledby="teamsDropdown">
          			<a class="dropdown-item" href="/ADA-Connect/team">Team</a>
        		</div>
      		</li>
      		<c:set var="active" value="${fn:endsWith(pageContext.request.requestURI, 'leaderboard.jsp') }" />
     		<li class="${active ? 'nav-item active' : 'nav-item'}">
       			<a class="nav-link" href="/ADA-Connect/leaderboard">Leaderboard</a>
     		</li>
     		<c:set var="active" value="${fn:endsWith(pageContext.request.requestURI, 'converts.jsp') }" />
     		<li class="${active ? 'nav-item active' : 'nav-item'}">
       			<a class="nav-link" href="/ADA-Connect/converts">Converts</a>
     		</li>
     		<c:set var="volunteerActive" value="${fn:endsWith(pageContext.request.requestURI, 'volunteer.jsp') }" />
     		<c:set var="partnerActive" value="${fn:endsWith(pageContext.request.requestURI, 'prayerpartner.jsp') }" />
     		<c:set var="leaderActive" value="${fn:endsWith(pageContext.request.requestURI, 'teamleader.jsp') }" />
   			<c:set var="active" value="${volunteerActive || partnerActive || leaderActive }" />
     		<li class="${active ? 'nav-item dropdown active' : 'nav-item dropdown'}">
        		<a class="nav-link dropdown-toggle" href="#" id="involveDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          			Get Involved
        		</a>
        		<div class="dropdown-menu" aria-labelledby="involveDropdown">
          			<a class="dropdown-item" href="/ADA-Connect/volunteer">Dialogue Volunteer</a>
          			<a class="dropdown-item" href="/ADA-Connect/prayer-partner">Prayer Partner</a>
          			<a class="dropdown-item" href="/ADA-Connect/team-leader">Team Leader</a>
        		</div>
      		</li>
      		<c:set var="active" value="${fn:endsWith(pageContext.request.requestURI, 'donate.jsp') }" />
     		<li class="${active ? 'nav-item active' : 'nav-item'}">
       			<a class="nav-link" href="/ADA-Connect/donate">Donate</a>
     		</li>
<!--      	To-Do: Implement Regex function -->
     		<c:set var="active" value="${cf:matches('.*/admin/.*', pageContext.request.requestURI) }" />
     		<li class="${active ? 'nav-item active' : 'nav-item'}">
       			<a class="nav-link" href="/ADA-Connect/admin">Admin</a>
     		</li>
     		<c:set var="adminUser" value="${sessionScope.adminUser}" />
			<c:if test="${adminUser != null}" >
				<li class="nav-item">
					<a class="nav-link" href="/ADA-Connect/admin/logout">Log out</a>
				</li>
			</c:if>
   		</ul>
 	</div>
</nav>
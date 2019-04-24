<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://ADA-Connect.com/taglib" prefix="cf"%>
<style>
#logo {
	width: 17rem;
	height: auto;
}

@media screen and (max-width: 480px) {
    #logo {
         width: 8rem;
         height: auto;
    }
}

</style>


<nav id="navbar" class="navbar navbar-expand-lg navbar-light bg-white sticky-top px-5 shadow">
 	<a class="navbar-brand" href="${pageContext.request.contextPath}/home">
    	<img src="${pageContext.request.contextPath}/resources/img/logo.png"  id="logo" alt="">
 	</a>
 	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
   		<span class="navbar-toggler-icon"></span>
 	</button>

 	<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
   		<ul class="navbar-nav ml-auto mt-2 mt-lg-0">
			<!-- Home -->
   			<c:set var="active" value="${fn:endsWith(pageContext.request.requestURI, 'general/home.jsp') }" />
     		<li class="${active ? 'nav-item active' : 'nav-item'}">
       			<a class="nav-link" href="${pageContext.request.contextPath}/home">Home</a>
     		</li>
     		
     		<!-- About -->
     		<c:set var="active" value="${fn:endsWith(pageContext.request.requestURI, 'general/about.jsp') }" />
     		<li class="${active ? 'nav-item active' : 'nav-item'}">
       			<a class="nav-link" href="${pageContext.request.contextPath}/about">About</a>
     		</li>
     		
     		<!-- Teams -->
     		<c:set var="active" value="${cf:matches('.*/team/.*', pageContext.request.requestURI) }" />
     		<li class="${active ? 'nav-item dropdown active' : 'nav-item dropdown'}">
        		<a class="nav-link dropdown-toggle" href="#" id="teamsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          			Teams
        		</a>
        		<div class="dropdown-menu" aria-labelledby="teamsDropdown" id="teams-dropdown">
        		</div>
      		</li>
      		
      		<!-- Leaderboard -->
      		<c:set var="active" value="${fn:endsWith(pageContext.request.requestURI, 'general/leaderboard.jsp') }" />
     		<li class="${active ? 'nav-item active' : 'nav-item'}">
       			<a class="nav-link" href="${pageContext.request.contextPath}/leaderboard">Leaderboard</a>
     		</li>
     		
     		<!-- Converts -->
     		<c:set var="active" value="${fn:endsWith(pageContext.request.requestURI, 'general/converts.jsp') }" />
     		<li class="${active ? 'nav-item active' : 'nav-item'}">
       			<a class="nav-link" href="${pageContext.request.contextPath}/converts">Converts</a>
     		</li>
     		
     		<!-- Get Involved -->
     		<c:set var="volunteerActive" value="${fn:endsWith(pageContext.request.requestURI, 'general/volunteer.jsp') }" />
     		<c:set var="partnerActive" value="${fn:endsWith(pageContext.request.requestURI, 'general/prayerpartner.jsp') }" />
     		<c:set var="leaderActive" value="${fn:endsWith(pageContext.request.requestURI, 'general/teamleader.jsp') }" />
   			<c:set var="active" value="${volunteerActive || partnerActive || leaderActive }" />
     		<li class="${active ? 'nav-item dropdown active' : 'nav-item dropdown'}">
        		<a class="nav-link dropdown-toggle" href="#" id="involveDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          			Get Involved
        		</a>
        		<div class="dropdown-menu" aria-labelledby="involveDropdown">
          			<a class="dropdown-item" href="${pageContext.request.contextPath}/volunteer">Dialogue Volunteer</a>
          			<a class="dropdown-item" href="${pageContext.request.contextPath}/prayer-partner">Prayer Partner</a>
          			<a class="dropdown-item" href="${pageContext.request.contextPath}/team-leader">Team Leader</a>
        		</div>
      		</li>
      		
      		<!-- Donate -->
      		<c:set var="active" value="${fn:endsWith(pageContext.request.requestURI, 'general/donate.jsp') }" />
     		<li class="${active ? 'nav-item active' : 'nav-item'}">
       			<a class="nav-link" href="${pageContext.request.contextPath}/donate">Donate</a>
     		</li>
     		
     		<!-- Admin -->
     		<c:set var="active" value="${cf:matches('.*/admin/.*', pageContext.request.requestURI) }" />
     		<li class="${active ? 'nav-item active' : 'nav-item'}">
       			<a class="nav-link" href="${pageContext.request.contextPath}/admin">Admin</a>
     		</li>
     		
     		<!-- Logout -->
     		<c:set var="adminUser" value="${sessionScope.adminUser}" />
			<c:if test="${adminUser != null}" >
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath}/admin/logout">Logout</a>
				</li>
			</c:if>
   		</ul>
 	</div>
</nav>
<script type="text/javascript">
var contextPath = "${pageContext.request.contextPath}";
var domain = "${pageContext.request.serverName}";
var port = "${pageContext.request.serverPort}";
</script>
<script src="${pageContext.request.contextPath}/resources/js/nav.js"></script>
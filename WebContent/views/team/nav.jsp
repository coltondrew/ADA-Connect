<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<div class="container-fluid row">
	<div class="col-6">
		<ul class="nav justify-content-start">
			<li class="nav-item">
				<a class="nav-link" href="${pageContext.request.contextPath}/team">Home</a>
			</li>
		</ul>
	</div>
	<div class="col">
		<ul class="nav justify-content-end">
		  <li class="nav-item">
		    <a class="nav-link" href="${pageContext.request.contextPath}/team/news">News</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="${pageContext.request.contextPath}/team/leaderboard">Leaderboard</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="${pageContext.request.contextPath}/team/roster">Roster</a>
		  </li>
		</ul>
	</div>
</div>
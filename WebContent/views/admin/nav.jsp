<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<div class="col-lg-3 mt-4 mb-4">
	<div class="list-group">
	    <a href="${pageContext.request.contextPath}/admin/home" class="list-group-item">Home</a>
	    <a href="${pageContext.request.contextPath}/admin/new-admin" class="list-group-item">Add New Admin</a>
	    <a href="${pageContext.request.contextPath}/admin/view-applications" class="list-group-item">View Applicants</a>
	    <a href="${pageContext.request.contextPath}/admin/manage-volunteers" class="list-group-item">Manage Volunteers</a>
   	    <a href="${pageContext.request.contextPath}/admin/manage-teams" class="list-group-item">Manage Teams</a>
   	    <a href="${pageContext.request.contextPath}/admin/conversation-tracker" class="list-group-item">Track Conversations</a>
   	    <a href="${pageContext.request.contextPath}/admin/manage-news" class="list-group-item">Manage News</a>   	    
    </div>
</div>
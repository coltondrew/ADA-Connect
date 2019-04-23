<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<style>
.sidebar {
    top: 0;
    bottom: 0;
    left: 0;
    z-index: 100;
    padding: 0;
    box-shadow: inset -1px 0 0 rgba(0, 0, 0, .1);
}
.sidebar-sticky {
    position: -webkit-sticky;
    position: sticky;
    top: 76.78px;
    height: calc(100vh - 76.68px);
    padding-top: .5rem;
    overflow-x: hidden;
    overflow-y: auto;
}
.sidebar .nav-link {
    font-weight: 500;
    color: #333;
}
.sidebar .nav-link .feather {
    margin-right: 4px;
    color: #999;
}
.sidebar .nav-link:hover .feather, .sidebar .nav-link.active .feather {
    color: inherit;
}
</style>
 <nav class="col-md-3 d-none d-md-block bg-light sidebar">
   <div class="sidebar-sticky">
     <ul class="nav flex-column">
       <!-- Home -->
       <c:set var="active" value="${fn:endsWith(pageContext.request.requestURI, 'admin/home.jsp') }" />
       <li class="nav-item">
         <a class="nav-link ${active ? 'active' : ''}" href="${pageContext.request.contextPath}/admin/home">
	       <i class="fas fa-home fa-fw feather" style="font-size:24px;vertical-align:middle"></i>
           <span style="vertical-align:middle">Home<c:if test="${active==true}"><span class="sr-only">(current)</span></c:if></span>
         </a>
       </li>
       <!-- Conversation Tracker -->
       <c:set var="active" value="${fn:endsWith(pageContext.request.requestURI, 'admin/conversationtracker.jsp') }" />
       <li class="nav-item">
         <a class="nav-link ${active ? 'active' : ''}" href="${pageContext.request.contextPath}/admin/conversation-tracker">
           <i class="far fa-comment fa-fw feather" style="font-size:24px;vertical-align:middle"></i>
           <span style="vertical-align:middle">Track Conversations<c:if test="${active==true}"><span class="sr-only">(current)</span></c:if></span>
         </a>
       </li>
       <!-- View Applications -->
       <li class="nav-item">
       <c:set var="active" value="${fn:endsWith(pageContext.request.requestURI, 'admin/viewapplications.jsp') }" />
         <a class="nav-link ${active ? 'active' : ''}" href="${pageContext.request.contextPath}/admin/view-applications">
           <i class="far fa-file-alt fa-fw feather" style="font-size:24px;vertical-align:middle"></i>
		   <span style="vertical-align:middle">View Applicants<c:if test="${active==true}"><span class="sr-only">(current)</span></c:if></span>
         </a>
       </li>
       <!-- New Admin -->
       <li class="nav-item">
       <c:set var="active" value="${fn:endsWith(pageContext.request.requestURI, 'admin/newadmin.jsp') }" />
         <a class="nav-link ${active ? 'active' : ''}" href="${pageContext.request.contextPath}/admin/new-admin">
           <i class="fas fa-user-lock fa-fw feather" style="font-size:24px;vertical-align:middle"></i>
		   <span style="vertical-align:middle">New Admin<c:if test="${active==true}"><span class="sr-only">(current)</span></c:if></span>
         </a>
       </li>
       <!-- Manage News -->
       <c:set var="active" value="${fn:endsWith(pageContext.request.requestURI, 'admin/managenews.jsp') }" />
       <li class="nav-item">
         <a class="nav-link ${active ? 'active' : ''}" href="${pageContext.request.contextPath}/admin/manage-news">
           <i class="far fa-newspaper fa-fw feather" style="font-size:24px;vertical-align:middle"></i>
		   <span style="vertical-align:middle">Manage News<c:if test="${active==true}"><span class="sr-only">(current)</span></c:if></span>
         </a>
       </li>
       <!-- Manage Teams -->
       <c:set var="active" value="${fn:endsWith(pageContext.request.requestURI, 'admin/manageteams.jsp') }" />
       <li class="nav-item">
         <a class="nav-link ${active ? 'active' : ''}" href="${pageContext.request.contextPath}/admin/manage-teams">
           <i class="fas fa-users fa-fw feather" style="font-size:24px;vertical-align:middle"></i>
		   <span style="vertical-align:middle">Manage Teams<c:if test="${active==true}"><span class="sr-only">(current)</span></c:if></span>
         </a>
       </li>
       <!-- Manage Volunteers -->
       <c:set var="active" value="${fn:endsWith(pageContext.request.requestURI, 'admin/managevolunteers.jsp') }" />
       <li class="nav-item">
         <a class="nav-link ${active ? 'active' : ''}" href="${pageContext.request.contextPath}/admin/manage-volunteers">
           <i class="far fa-user fa-fw feather" style="font-size:24px;vertical-align:middle"></i>
		   <span style="vertical-align:middle">Manage Volunteers<c:if test="${active==true}"><span class="sr-only">(current)</span></c:if></span>
         </a>
       </li>
     </ul>
   </div>
 </nav>
 
 


<!-- <div class="col-lg-3 mt-4 mb-4"> -->
<!-- 	<div class="list-group"> -->
<%-- 	    <a href="${pageContext.request.contextPath}/admin/home" class="list-group-item">Home</a> --%>
<%-- 	    <a href="${pageContext.request.contextPath}/admin/new-admin" class="list-group-item">Add New Admin</a> --%>
<%-- 	    <a href="${pageContext.request.contextPath}/admin/view-applications" class="list-group-item">View Applicants</a> --%>
<%-- 	    <a href="${pageContext.request.contextPath}/admin/manage-volunteers" class="list-group-item">Manage Volunteers</a> --%>
<%--    	    <a href="${pageContext.request.contextPath}/admin/manage-teams" class="list-group-item">Manage Teams</a> --%>
<%--    	    <a href="${pageContext.request.contextPath}/admin/conversation-tracker" class="list-group-item">Track Conversations</a> --%>
<%--    	    <a href="${pageContext.request.contextPath}/admin/manage-news" class="list-group-item">Manage News</a>   	     --%>
<!--     </div> -->
<!-- </div> -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
	<title>Manage News</title>
</head>
<body>
	<!-- Navbar -->
	<jsp:include page="/views/general/navbar.jsp"></jsp:include>
	
	<div class="container-fluid">
		<div class="row">
	    	<!-- Sidebar Nav Column -->
			<jsp:include page="/views/admin/nav.jsp"></jsp:include>
			
	    	<!-- Content Column -->
	    	<div class="col-lg-9 mt-4 mb-4">
				<h1>Manage News</h1>
				
				<!-- News Manager -->
				<div class="card">
					<div class="card-header text-white bg-primary">
						<div class="row">
							<div class="col-10 d-flex align-items-center">
								<h5>News</h5>
							</div>
							<div class="col d-flex justify-content-end">
								<button type="button" class="btn btn-outline-light" data-toggle="modal" data-target="#editNewsModal" style="background-color:transparent;"> 
				  					<div style="text-align:center;"><i class="fas fa-plus" style="color: white;"></i></div>
								</button>
							</div>
						</div>
					</div>
					<div class="card-body">
						<table class="table">
							 <thead>
								 <tr>
								   <th scope="col">Picture</th>
								   <th scope="col">Title</th>
								 </tr>
							</thead>
							<tbody>
								<c:forEach items="${requestScope.newsList}" var="news">
				        			<tr>
				        				<td><a href="#editNewsModal" data-toggle="modal" data-news-id="${news.newsID}"><img alt="image" src="${pageContext.request.contextPath}/file-server?category=newsImg&filename=${news.pictureurl}"></a></td>
				        				<td><c:out value="${news.title}"/></td>			        				
				        			</tr>
			      				</c:forEach>
							</tbody>
						</table>
					</div>
				</div>	
	      	</div>
	    </div>
	</div>
	
	<!-- Edit/Add News Modal -->
	<div class="modal fade" id="editNewsModal" tabindex="-1" role="dialog" aria-labelledby="editNewsModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
	    	<div class="modal-content">
	    		<form action="${pageContext.request.contextPath}/admin/manage-news" method="post" enctype="multipart/form-data">
		      		<div class="modal-header">
		        		<h5 class="modal-title" id="editNewsModalLabel"></h5>
		        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          			<span aria-hidden="true">&times;</span>
		        		</button>
		      		</div>
		      		<div class="modal-body">
		      			<input type="hidden" id="orig-img" name="orig-img" value="">
						<input type="hidden" id="news-id" name="news-id" value="">
						<input type="hidden" id="news-action" name="action" value="">
						<div class="form-row">
				  			<div class="form-group col-lg-12">
				    			<label for="news-title">Article Title:</label>
				    			<input type="text" class="form-control" id="news-title" name="news-title" required>
				  			</div>
						</div>
						<div class="form-group">
					    	<label for="news-body">Body:</label>
					    	<textarea class="form-control" id="news-body" name="news-body" rows="10"></textarea>
						</div>
					  	<div class="form-group">
	    			  		<label for="news-img-input">Article Photo:</label>
					  		<img src="" id="news-img" alt="..." class="img-thumbnail" width="100%">
	    					<input type="file" onchange="readURL(this);"  class="form-control-file" id="news-img-input" name="news-img">
	  				  	</div>
					</div>
		      		<div class="modal-footer">
		        		<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        		<button type="submit" id="edit-btn" class="btn btn-primary"></button>
		        		<button type="button" class="btn btn-danger" data-target="#deleteModal" data-toggle="modal" data-news-id="" data-dismiss="modal" id="delete-btn">Delete</button>
		      		</div>
	      		</form>
	    	</div>
	  	</div>
	</div>
	
	<!-- Delete Confirmation Modal -->
	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
	    	<div class="modal-content">
	    		<form action="${pageContext.request.contextPath}/admin/manage-news" method="post" enctype="multipart/form-data">
		      		<div class="modal-header">
		        		<h5 class="modal-title" id="deleteModalLabel">Delete News</h5>
		        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          			<span aria-hidden="true">&times;</span>
		        		</button>
		      		</div>
		      		<div class="modal-body">
						<input type="hidden" id="del-news-id" name="news-id" value="">
						<input type="hidden" name="action" value="delete">
						<h5>Are you sure you want to delete this news item?</h5>
					</div>
		      		<div class="modal-footer">
		        		<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
		        		<button type="submit" class="btn btn-danger">Delete</button>
		      		</div>
	      		</form>
	    	</div>
	  	</div>
	</div>			
</body>
<script type="text/javascript">
	var contextPath = "${pageContext.request.contextPath}";
	var domain = "${pageContext.request.serverName}";
	var port = "${pageContext.request.serverPort}";
	
	var url = "http://" + domain + ":" + port + contextPath + "/get-news"; 
	var imgSrcUrl = contextPath + "/file-server?category=newsImg&filename=";
	
	$('#editNewsModal').on('show.bs.modal', function(e) {
     	var newsId = $(e.relatedTarget).data('news-id');
     	
     	if(newsId != null) {
	     	var urlParam = url + "?id=" + newsId;
          	$("#delete-btn").show();
          	$("#delete-btn").attr("data-news-id", newsId);
			$("#editNewsModalLabel").html("Edit News");
          	$("#news-id").val(newsId);
          	$("#news-action").val("update");
			$("#edit-btn").html("Update");

	     	
	     	$.getJSON(urlParam, function(news) {
	     		var newsTitle = news.title;
	     		var newsBody = news.contents;
	     		var newsImgUrl = news.pictureurl;
	     		
	     		$("#news-title").val(newsTitle);
	     		$("#news-body").val(newsBody);
	     		$("#orig-img").val(newsImgUrl);
	     		$("#news-img").attr("src", imgSrcUrl + newsImgUrl);
	     	});
     	}
     	else {
     		$("#news-title").val("");
     		$("#news-body").val("");
     		$("#orig-img").val("");
     		$("#news-img").attr("src", "");
     		$("#news-img-input").val("");
     		
         	$("#news-id").val("");
         	$("news-action").val("add");
         	$("#delete-btn").hide();
         	$("#editNewsModalLabel").html("Add News Item");
			$("#edit-btn").html("Add");
     	}
	});
	
	$('#editNewsModal').on('hide.bs.modal', function(e) {
 		$("#news-title").val("");
 		$("#news-body").val("");
 		$("#orig-img").val("");
 		$("#news-img").attr("src", "");
 		$("#news-img-input").val("");
 		
     	$("#news-id").val("");
     	$("news-action").val("add");
     	$("#delete-btn").hide();
     	$("#editNewsModalLabel").html("Add News Item");
		$("edit-btn").html("");
	});
	
	$('#deleteModal').on('show.bs.modal', function(e) {
		var newsId = $(e.relatedTarget).data('news-id');
		$(e.currentTarget).find('input[id="del-news-id"]').val(newsId);
	});
	
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#news-img').attr('src', e.target.result);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
</html>
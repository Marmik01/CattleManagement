<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css">
<link href="/resources/assets/vendor/fonts/circular-std/style.css"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/assets/libs/css/style.css">
<link rel="stylesheet"
	href="/resources/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
<link rel="stylesheet" type="text/css"
	href="/resources/assets/vendor/datatables/css/dataTables.bootstrap4.css">
<link rel="stylesheet" type="text/css"
	href="/resources/assets/vendor/datatables/css/buttons.bootstrap4.css">
<link rel="stylesheet" type="text/css"
	href="/resources/assets/vendor/datatables/css/select.bootstrap4.css">
<link rel="stylesheet" type="text/css"
	href="/resources/assets/vendor/datatables/css/fixedHeader.bootstrap4.css">
<%@include file="HeaderFile.jsp"%>
<title>Add\Edit Video</title>
<style>
</style>
</head>
<body>

	<c:if test="${video.videoID <= 0}">
		<c:set var="url" value="addVideo"></c:set>
		<c:set var="btnValue" value="Add Video"></c:set>
		
	</c:if>
	
	<c:if test="${video.videoID != 0 }">
		<c:set var="url" value="updateVideo"></c:set>
		<c:set var="btnValue" value="Update Video"></c:set>
		
	</c:if>
	<div class="dashboard-main-wrapper">
		<%@include file="AdminNavBar.jsp"%>
		<%@include file="AdminSideBar.jsp"%>
		<div class="dashboard-wrapper">
			<div class="container-fluid dashboard-content ">
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="page-header">
							<h2 class="pageheader-title">Video Management</h2><h1></h1>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="adminDashboard"
											class="breadcrumb-link">Admin Dashboard </a></li>
										<li class="breadcrumb-item"><a href="videoManagement"
											class="breadcrumb-link">Video Management</a></li>
										<li class="breadcrumb-item active" aria-current="page">Add\Edit
											Video</li>
									</ol>
								</nav>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="card">
							<h5 class="card-header">Seminar Details</h5>
							<div class="card-body">
								<form id="validationform" action="${url }" method="post" enctype="multipart/form-data">
									<input type="hidden" value="${video.videoID}" name="videoID">
									<input type="hidden" value="false" id="videoActive" name="videoActive">
								
									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Video
											Title</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<input type="text" placeholder="Video Title"
												class="form-control" name="videoTitle"
												value="${video.videoTitle}" required>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Video Youtube URL
											</label>
										<div class="col-12 col-sm-8 col-lg-6">
										<input type="text" placeholder="Video Youtube URL"
												class="form-control" name="videoYoutubeLink"
												value="${video.videoYoutubeLink}" required>
										</div>
									</div>
									
									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Video Display Location
											</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<select name="videoDisplayLocation"class="form-control" id="input-select">
                                                    <option value="Home Page">Home Page</option>
                                                    <option value="About Us">About Us</option>
                                                    <option value="Seminar Page">Seminar Page</option>
                                                    <option value="Seminar Feedback">Seminar Feedback</option>
                                                </select>
										</div>
									</div>
									

									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Video
											Active</label>
										<div class="col-12 col-sm-8 col-lg-6 pt-1">
											<div class="switch-button switch-button-yesno">
												<input type="checkbox" name="switch19" id="switch19"
													name=""  onclick="myFunction()"
													value="${video.videoActive}"><span>
													<label for="switch19"></label>
												</span>
											</div>
										</div>
									</div>
					
									<div class="form-group row text-right">
										<div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0 ">
											<button type="submit" class="btn btn-space btn-primary">${btnValue }</button>
										</div>
									</div>
								</form>

							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<%@include file="AdminFooter.jsp"%>
	<script>

	function myFunction(){
		  var checkBox = document.getElementById("switch19");
		  document.getElementById("videoActive").value= checkBox.checked
		
	}
	</script>
	<script src="/resources/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
	<!-- 
	<script src="/resources/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="/resources/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <script src="/resources/assets/libs/js/main-js.js"></script>
    <script src="/resources/assets/vendor/inputmask/js/jquery.inputmask.bundle.js"></script>
  -->
</body>
</html>
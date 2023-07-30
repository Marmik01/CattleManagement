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
<link rel="stylesheet"
	href="/resources/assets/vendor/datepicker/tempusdominus-bootstrap-4.css" />
<link rel="stylesheet"
	href="/resources/assets/vendor/inputmask/css/inputmask.css" />
<%@include file="HeaderFile.jsp"%>
<title>Add Power Point</title>
<style>
</style>
</head>
<body>
	<div class="dashboard-main-wrapper">
		<%@include file="AdminNavBar.jsp"%>
		<%@include file="AdminSideBar.jsp"%>
		<div class="dashboard-wrapper">
			<div class="container-fluid dashboard-content ">
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="page-header">
							<h2 class="pageheader-title">Power Point Management</h2>
							<h1></h1>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="adminDashboard"
											class="breadcrumb-link">Admin Dashboard </a></li>
										<li class="breadcrumb-item"><a href="seminarResources"
											class="breadcrumb-link">Power Point Management</a></li>
										<li class="breadcrumb-item active" aria-current="page">Add Power Point</li>
									</ol>
								</nav>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="card">
							<h5 class="card-header">Power Point Details</h5>
							<div class="card-body">
								<form id="validationform" action="addPowerPointPresentation" method="post"
									enctype="multipart/form-data">
									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Mother Id
											</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<input type="text" placeholder="File Name"
												class="form-control" name="fileName"
												value="${powerPoint.fileName}" required>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Father Id
											</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<input type="text" placeholder="File Name"
												class="form-control" name="fileName"
												value="${powerPoint.fileName}" required>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Expected Date
											</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<input type="date" placeholder="File Name"
												class="form-control" name="fileName"
												value="${powerPoint.fileName}" required>
										</div>
									</div>
								
								
									<div class="form-group row text-right">
										<div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0 ">
											<button type="submit" class="btn btn-space btn-primary">Add Presentation</button>
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
	<script src="/resources/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
	<!-- 
	<script src="/resources/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="/resources/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <script src="/resources/assets/libs/js/main-js.js"></script>
    <script src="/resources/assets/vendor/inputmask/js/jquery.inputmask.bundle.js"></script>
  -->
</body>
</html>
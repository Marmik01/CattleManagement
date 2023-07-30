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
<title>Add\Edit Seminar</title>
<style>
</style>
</head>
<body>

	<c:if test="${seminar.seminarID <= 0}">
		<c:set var="url" value="addSeminar"></c:set>
		<c:set var="btnValue" value="Add Seminar"></c:set>
		<c:set var="seminarLinkFinal" value="${seminarLink }"></c:set>
		
	</c:if>
	
	<c:if test="${seminar.seminarID != 0 }">
		<c:set var="url" value="updateSeminar"></c:set>
		<c:set var="btnValue" value="Update Seminar"></c:set>
		<c:set var="seminarLinkFinal" value="${seminar.seminarZoomLink }"></c:set>
		
	</c:if>
	<div class="dashboard-main-wrapper">
		<%@include file="AdminNavBar.jsp"%>
		<%@include file="AdminSideBar.jsp"%>
		<div class="dashboard-wrapper">
			<div class="container-fluid dashboard-content ">
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="page-header">
							<h2 class="pageheader-title">Seminar Management</h2><h1></h1>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="adminDashboard"
											class="breadcrumb-link">Admin Dashboard </a></li>
										<li class="breadcrumb-item"><a href="seminarManagement"
											class="breadcrumb-link">Seminar Management</a></li>
										<li class="breadcrumb-item active" aria-current="page">Add\Edit
											Seminar</li>
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
									<input type="hidden" value="${seminar.seminarID}" name="seminarID">
									<input type="hidden" value="${seminar.imgPathGujarati}" name="imgPathGujarati">
									<input type="hidden" value="${seminar.imgPathEnglish}" name="imgPathEnglish">
									<input type="hidden" value="false" id="acceptingRegistration" name="acceptingRegistration">
								
									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Seminar
											Title</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<input type="text" placeholder="Seminar Title"
												class="form-control" name="seminarName"
												value="${seminar.seminarName}" required>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Seminar
											Type</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<label
												class="custom-control custom-radio custom-control-inline">
												<input name="seminarType" value="Online" type="radio"
												class="custom-control-input"><span
												class="custom-control-label">Online</span>
											</label> <label
												class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="seminarType" value="Offline"
												class="custom-control-input"><span
												class="custom-control-label">Offline</span>
											</label> <label
												class="custom-control custom-radio custom-control-inline">
												<input type="radio" name="seminarType"
												value="Online + Offline" class="custom-control-input"><span
												class="custom-control-label">Online + Offline</span>
											</label>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Seminar
											Fees</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<input type="number" name="seminarFees"
												value="${seminar.seminarFees }" min="0"
												placeholder="Seminar Fees" class="form-control" required>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Seminar
											Zoom Link</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<input type="text" placeholder="Seminar Zoom Link"
												class="form-control" name="seminarZoomLink" value="${seminarLinkFinal}" readonly>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Seminar
											Whatsapp Group Link</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<input type="text" placeholder="Seminar Whatsapp Group Link"
												class="form-control" name="whatsappLink"
												value="${seminar.whatsappLink }" required>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Seminar
											Banner English</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<input type="file" placeholder="Seminar Banner English"
												class="form-control" name="seminarEnglishBanner">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Seminar
											Banner Gujarati</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<input type="file" placeholder="Seminar Banner Gujarat"
												class="form-control" name="seminarGujaratiBanner">
										</div>
									</div>

									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Seminar
											Description</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<textarea class="form-control"
												id="exampleFormControlTextarea1" maxlength="10000"
												name="seminarDescription" rows="10" required>${seminar.seminarDescription }</textarea>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Seminar
											Start Date</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<input type="datetime-local" placeholder="Seminar Fees"
												name="seminarStart" value="${seminar.seminarStart }"
												class="form-control" required>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Seminar
											End Date</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<input type="datetime-local" min="0"
												placeholder="Seminar Fees" name="seminarEnd"
												value="${seminar.seminarEnd }" class="form-control" required>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Registration
											Start Date</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<input type="datetime-local" min="0"
												placeholder="Seminar Fees" name="seminarRegistrationStart"
												value="${seminar.seminarRegistrationStart }"
												class="form-control" required>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Registration
											End Date</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<input type="datetime-local" min="0"
												placeholder="Seminar Fees" name="seminarRegistrationEnd"
												value="${seminar.seminarRegistrationEnd }"
												class="form-control" required>
										</div>
									</div>

									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Registration
											Open</label>
										<div class="col-12 col-sm-8 col-lg-6 pt-1">
											<div class="switch-button switch-button-yesno">
												<input type="checkbox" name="switch19" id="switch19"
													name=""  onclick="myFunction()"
													value="${seminar.acceptingRegistration}"><span>
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
	$(function() {
	    var $radios = $('input:radio[name=seminarType]');
	    if($radios.is(':checked') === false) {
	        $radios.filter('[value=Online]').prop('checked', true);
	    }
	});

	function myFunction(){
		  var checkBox = document.getElementById("switch19");
		  document.getElementById("acceptingRegistration").value= checkBox.checked
		
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
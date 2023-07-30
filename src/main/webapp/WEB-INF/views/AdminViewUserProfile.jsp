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

<%@include file="HeaderFile.jsp"%>
<title>User Profile</title>
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
							<h2 class="pageheader-title">User Profile</h2>
							<p class="pageheader-text">Nulla euismod urna eros, sit amet
								scelerisque torton lectus vel mauris facilisis faucibus at enim
								quis massa lobortis rutrum.</p>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="adminDashboard"
											class="breadcrumb-link">Admin Dashboard</a></li>
										<li class="breadcrumb-item"><a href="userMangement"
											class="breadcrumb-link">User Management</a></li>

										<li class="breadcrumb-item active" aria-current="page">Message
											Template</li>
									</ol>
								</nav>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div id="alert" class="alert alert-primary">
							<span id="msg">${msg }</span>
						</div>
					</div>
				</div>
				<div class="row">
					<!-- ============================================================== -->
					<!-- basic tabs  -->
					<!-- ============================================================== -->
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 mb-5">
						<div class="tab-regular">
							<ul class="nav nav-tabs " id="myTab" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									id="home-tab" data-toggle="tab" href="#home" role="tab"
									aria-controls="home" aria-selected="true">User Profile</a></li>
								<li class="nav-item"><a class="nav-link" id="profile-tab"
									data-toggle="tab" href="#profile" role="tab"
									aria-controls="profile" aria-selected="false">Seminar
										Registered</a></li>
								<li class="nav-item"><a class="nav-link" id="contact-tab"
									data-toggle="tab" href="#contact" role="tab"
									aria-controls="contact" aria-selected="false">Counselling
										Request</a></li>
							</ul>
							<div class="tab-content" id="myTabContent">
								<div class="tab-pane fade show active" id="home" role="tabpanel"
									aria-labelledby="home-tab">
									<p class="lead">User Profile</p>
									<hr>
									<div class="row">
										<div class="col-9">
											<div class="row">
												<div class="col-6">
													</div>	
											</div>		
											<br>
											<div class="row">
												<div class="col-6">
													<h3>Phone Number</h3><hr>
													<h4>${userProfile.phoneNumber }</h4>
												</div>
												<div class="col-6">
													<h3>Email Address</h3><hr>
													<h4>${userProfile.emailID}</h4>
												</div>
											
											</div>		
											<br>
											<div class="row">
												<div class="col-6">
													<h3>City</h3><hr>
													<h4>${userProfile.city}</h4>
												</div>
												<div class="col-6">
													<h3>State</h3><hr>
													<h4>${userProfile.state}</h4>
												</div>
											</div>		
											<br>
											<div class="row">
												<div class="col-4">
													<h3>Instituation Name</h3><hr>
													<h4>${userProfile.institutionName}</h4>
													
												</div>
												<div class="col-4">
													<h3>Grade</h3><hr>
													<h4>${userProfile.grade}</h4>
													
												</div>
												<div class="col-4">
													<h3>Board</h3><hr>
													<h4>${userProfile.board}</h4>
													
												</div>

											</div>
											<br>
											<div class="row">
												<div class="col-6">
													<h3>Gender</h3><hr>
													<h4>${userProfile.gender}</h4>
													
												</div>
												<div class="col-6">
													<h3>Created At</h3><hr>
													<h4>${userProfile.createdAt}</h4>
													
												</div>

											</div>
																	<br>
											<div class="row">
												<div class="col-6">
													<h3>User Active</h3><hr>
													<h4>${userProfile.userActive ? 'Active':'Not Active'}</h4>
													
												</div>
												<div class="col-6">
													<h3>Created At</h3><hr>
													<h4>${userProfile.userInterested ? 'Interested':'Not Interested'}</h4>
													
												</div>

											</div>
										</div>
										<div class="col-3 "  style="text-align:center;">
													<h2><strong>${userProfile.firstName } ${userProfile.lastName }</strong></h2>		
											<br>
											<img src="${userProfile.profileImage }" alt="user" class="img-fluid rounded" width="250px" height="250px">
											</div>
										
									</div>
									<div class="row">
									
									
									</div>
									
								</div>
								<div class="tab-pane fade" id="profile" role="tabpanel"
									aria-labelledby="profile-tab">
									<p class="lead">Seminar Attended</p>
									<div class="table-responsive">
										<table id="example"
											class="table table-striped table-bordered second"
											style="width: 100%">
											<thead>
												<tr>
													<th>Seminar ID</th>
													<th>Seminar Name</th>
													<th>Seminar Type</th>
													<th>Seminar Fees</th>
													<th>Seminar Start</th>
													<th>Registration At</th>
													<th>Question</th>
												</tr>
											</thead>
											<tbody>

												<c:forEach items="${seminarRegistration}" var="a">
													<tr>
														<th>${a.seminarID }</th>
														<th>${a.seminarName }</th>
														<th>${a.seminarType }</th>
														<th>${a.seminarFees }</th>
														<th>${a.seminarStart }</th>
														<th>${a.registrationAt }</th>
														<th>${a.question }</th>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
								<div class="tab-pane fade" id="contact" role="tabpanel"
									aria-labelledby="contact-tab">
									<p class="lead">Counselling Request</p>
									<div class="table-responsive">
										<table id="example"
											class="table table-striped table-bordered third"
											style="width: 100%">
											<thead>
												<tr>
													<th>Time Slot ID</th>
													<th>Start Time</th>
													<th>End Time</th>
													<th>Counselling Type</th>
													<th>Requested At</th>
													<th>Accepted</th>
													

												</tr>
											</thead>
											<tbody>

												<c:forEach items="${personalCounselling}" var="a">
													<tr>
														<th>${a.timeSlotID }</th>
														<th>${a.startTime }</th>
														<th>${a.endTime }</th>
														<th>${a.counsellingType}</th>
														<th>${a.requestedAt}</th>
														<th>${a.accepted ? 'Yes' : 'No'}</th>
													
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script
		src="/resources/assets/vendor/datatables/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
	<script
		src="/resources/assets/vendor/datatables/js/buttons.bootstrap4.min.js"></script>
		<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
	<script src="/resources/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
	<script>
	jQuery(document).ready(function($) {
	     var table = $('table.third').DataTable({
             lengthChange: false,
             buttons: ['copy', 'excel', 'pdf', 'print', 'colvis']
         });

         table.buttons().container()
             .appendTo('#example_wrapper .col-md-6:eq(0)');
         
         var table1 = $('table.second').DataTable({
             lengthChange: false,
             buttons: ['copy', 'excel', 'pdf', 'print', 'colvis']
         });

         table1.buttons().container()
             .appendTo('#example_wrapper .col-md-6:eq(0)');
     });
	</script>
	
	<script src="/resources/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
	<script
		src="/resources/assets/vendor/multi-select/js/jquery.multi-select.js"></script>
	<script src="/resources/assets/libs/js/main-js.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script
		src="/resources/assets/vendor/datatables/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
	<script
		src="/resources/assets/vendor/datatables/js/buttons.bootstrap4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.colVis.min.js"></script>
	<script
		src="https://cdn.datatables.net/rowgroup/1.0.4/js/dataTables.rowGroup.min.js"></script>
	<script
		src="https://cdn.datatables.net/select/1.2.7/js/dataTables.select.min.js"></script>
	<script
		src="https://cdn.datatables.net/fixedheader/3.1.5/js/dataTables.fixedHeader.min.js"></script>
	<%@include file="AdminFooter.jsp"%>
</body>
</html>
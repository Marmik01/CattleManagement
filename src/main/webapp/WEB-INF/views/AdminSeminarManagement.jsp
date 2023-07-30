<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Seminar Management</title>
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
</head>
<%@include file="HeaderFile.jsp"%>

<body>
	<div class="dashboard-main-wrapper">
		<%@include file="AdminNavBar.jsp"%>
		<%@include file="AdminSideBar.jsp"%>
		<div class="dashboard-wrapper">
			<div class="container-fluid dashboard-content ">
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="page-header">
							<h2 class="pageheader-title">Seminar Management</h2>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="adminDashboard"
											class="breadcrumb-link">Admin Dashboard</a></li>
										<li class="breadcrumb-item active" aria-current="page">Seminar
											Management</li>
									</ol>
								</nav>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-6">
						<div id="alert" class="alert alert-primary">
							<span id="msg">${msg }</span>
						</div>
					</div>
					<div class="col-6 d-flex justify-content-end">
						<a href="addSeminar" class="btn  text-white open" style="background-color:#1a3f13;" >Add
							Seminar</a>
					</div>
				</div>
	
				<br>
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">Seminar Table</h5>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table id="example"
									class="table table-striped table-bordered second"
									style="width: 100%">
									<thead>
										<tr>
											<th>Cattle Id</th>
											<th>Vaccine Name</th>
											<th>To Be Given</th>
											<th>Vaccine Date</th>
											<th>Status</th>
											
										<!-- 	<th>Registration Start Date</th>
											<th>Registration End Date</th>
											<th>Accepting Registration</th>
											
											<th>Action</th> -->
										</tr>
									</thead>
									<tbody>
									
										<c:forEach items="${seminarList}" var="a">
											<tr>
												<th>${a.seminarID }</th>
												<th>${a.seminarName}</th>
												<th>${a.seminarType}</th>
												<th>${a.seminarStart }</th>
												<th>${a.seminarEnd}</th>
<%-- 												<th>${a.seminarRegistrationStart }</th>
												<th>${a.seminarRegistrationEnd}</th>
												<th>${a.acceptingRegistration ? 'Yes' : 'No'}</th>
												<th>
												<a href="editSeminar/${a.seminarID}"
													class="btn  mt-1  btn-xs text-white" style="background-color:#1a3f13;">Edit Seminar</a>&nbsp;&nbsp;&nbsp;&nbsp;
													
													<a href="viewSeminar/${a.seminarID}"
													class="btn  mt-1  btn-xs text-white" style="background-color:#1a3f13;">View Seminar</a>&nbsp;&nbsp;&nbsp;&nbsp;
													
													<a href="viewSeminarRegisteredUser/${a.seminarID}"
													class="btn  mt-1  btn-xs text-white" style="background-color:#1a3f13;">View Registered Users</a>&nbsp;&nbsp;&nbsp;&nbsp;
													
													<a href="sendReminder/${a.seminarID}"
													class="btn mt-1 btn-xs text-white" style="background-color:#1a3f13;">Send Reminder</a></th> --%>
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


	<script	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script	src="/resources/assets/vendor/datatables/js/dataTables.bootstrap4.min.js"></script>
	<script	src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
	<script	src="/resources/assets/vendor/datatables/js/buttons.bootstrap4.min.js"></script>
	<script src="/resources/assets/vendor/datatables/js/data-table.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
	<script src="/resources/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
	<script src="/resources/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
	<script src="/resources/assets/vendor/multi-select/js/jquery.multi-select.js"></script>
	<script src="/resources/assets/libs/js/main-js.js"></script>
	<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script src="/resources/assets/vendor/datatables/js/dataTables.bootstrap4.min.js"></script>
	<script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
	<script	src="/resources/assets/vendor/datatables/js/buttons.bootstrap4.min.js"></script>
	<script src="/resources/assets/vendor/datatables/js/data-table.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
	<script	src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
	<script	src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
	<script	src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.colVis.min.js"></script>
	<script	src="https://cdn.datatables.net/rowgroup/1.0.4/js/dataTables.rowGroup.min.js"></script>
	<script	src="https://cdn.datatables.net/select/1.2.7/js/dataTables.select.min.js"></script>
	<script	src="https://cdn.datatables.net/fixedheader/3.1.5/js/dataTables.fixedHeader.min.js"></script>
	<%@include file="AdminFooter.jsp"%>
</body>
</html>
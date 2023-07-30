<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Management</title>
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
							<h2 class="pageheader-title">User Management</h2>
							<p class="pageheader-text">Nulla euismod urna eros, sit amet
								scelerisque torton lectus vel mauris facilisis faucibus at enim
								quis massa lobortis rutrum.</p>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="adminDashboard"
											class="breadcrumb-link">Admin Dashboard</a></li>
										<li class="breadcrumb-item active" aria-current="page">User
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
				</div>
				<div class="row">
					<div class="col-6">
						
					</div>
					<div class="col-6 d-flex justify-content-end">
						<button class="btn  text-white open" style="background-color:#1a3f13;">Add Medical Detail</button>
					</div>
				</div>
				
										<div class="popup-overlay">
															<div class="popup-content">
																<i class="fas fa-window-close close" style="float: right"></i><br>
																<br>
																<form id="addAdmin" action="addAdmin" method="post">
																	<div class="card">
																		<div class="card-header">
																			<h3 class="mb-1">Create Cattle</h3>
																			<p></p>
																		</div>
																		<div class="card-body">
																			
																				<div class="form-group"> <Label for="pass1" style="float: left;">Medical Report file : </Label>
																					 <input type="file"  class="form-control form-control-lg" min="1" max="6" name="range-inline" required> 
																				</div>
																				
																				<div class="form-group"> <Label for="pass1" style="float: left;"  >Cattle Id : </Label>
																					 <input type="text"name="range-inline" class="form-control form-control-lg" required> 
																				</div>
																				<div class="form-group"> <Label for="pass1" style="float: left;"  >Doctor Name : </Label>
																					 <input type="text"name="range-inline" class="form-control form-control-lg" required> 
																				</div>
																				<div class="form-group"> <Label for="pass1" style="float: left;"  >Comment : </Label>
																					 <!-- <input type="text"name="range-inline" class="form-control form-control-lg" required>  -->
																					 <textarea rows="20"  name="range-inline" class="form-control form-control-lg" required></textarea>
																				</div>
																		</div>
																	</div>
																</form>
															</div>
			</div>
				<br>
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">User Table</h5>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table id="example"
									class="table table-striped table-bordered second"
									style="width: 100%">
									<thead>
										<tr>
											<th>Medical Report ID</th>
											<th>URL</th>
											<th>Comment</th>
											<th>Inserted At</th>
											<th>Cattle ID</th>
											<th>Doctor Name</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach items="${userList}" var="a">
											<tr>
												<th>${a.userID }</th>
												<th><img src="${a.profileImage}" alt="user" class="rounded" class="img-fluid" width="145px" height="145px"></th>
												<th>${a.firstName} ${a.lastName }</th>
												<th>${a.emailID}</th>
												<th>${a.phoneNumber}</th>
												<th>${a.createdAt}</th>
												<th><a href="deactivateUser/${a.userID}" style="background-color:#1a3f13;" class="btn  text-white open">Delete</a> 
												</th>
												
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
	<script
		src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script
		src="/resources/assets/vendor/datatables/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
	<script
		src="/resources/assets/vendor/datatables/js/buttons.bootstrap4.min.js"></script>
	<script src="/resources/assets/vendor/datatables/js/data-table.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
	<script src="/resources/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
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
	<script src="/resources/assets/vendor/datatables/js/data-table.js"></script>
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
	
	 <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="/resources/assets/vendor/datatables/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
    <script src="/resources/assets/vendor/datatables/js/buttons.bootstrap4.min.js"></script>
    <script src="/resources/assets/vendor/datatables/js/data-table.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
</body>
</html>
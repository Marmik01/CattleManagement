<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Seminar</title>
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
										<li class="breadcrumb-item"><a href="seminarManagement"
											class="breadcrumb-link">Seminar Management</a></li>
										<li class="breadcrumb-item active" aria-current="page">View Seminar</li>
									</ol>
								</nav>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					
					<div class="col-12 qw d-flex justify-content-end" style="padding: 12px;">
						<a href="editSeminar/${seminar.seminarID}" class="btn bg-dark text-white open">Edit Seminar</a>
						<a href="viewSeminarRegisteredUser/${seminar.seminarID}" class="btn bg-dark text-white open">View Registered Users</a>
				
					</div>
				</div>
				 <div class="row">
                    <!-- ============================================================== -->
                    <!-- basic table  -->
                    <!-- ============================================================== -->
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="card">
                            <h5 class="card-header">Seminar Detail Table</h5>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Name</th>
                                                <th>Information Stored</th>
                                            </tr>
                                        </thead>
                                        
                                        <tbody>
                                        	<tr>
                                        		<th>Seminar ID</th>
                                        		<th>${seminar.seminarID}</th>
                                        	</tr>
                                        	<tr>
                                        		<th>Seminar Name</th>
                                        		<th>${seminar.seminarName}</th>
                                        	</tr>
                                        	<tr>
                                        		<th>Seminar Type</th>
                                        		<th>${seminar.seminarType}</th>
                                        	</tr>
                                        	<tr>
                                        		<th>Seminar Fee</th>
                                        		<th>${seminar.seminarFees}</th>
                                        	</tr>
                                        	
                                        	<tr>
                                        		<th>Seminar Start Date</th>
                                        		<th>${seminar.seminarStart}</th>
                                        	</tr>
                                        	<tr>
                                        		<th>Seminar End Date</th>
                                        		<th>${seminar.seminarEnd}</th>
                                        	</tr>
                                        	<tr>
                                        		<th>Seminar Registration Start Date</th>
                                        		<th>${seminar.seminarRegistrationStart}</th>
                                        	</tr>
                                        	<tr>
                                        		<th>Seminar Registration End Date</th>
                                        		<th>${seminar.seminarRegistrationEnd}</th>
                                        	</tr>
                                        	<tr>
                                        		<th>Seminar Registration Open</th>
                                        		<th>${seminar.acceptingRegistration ? 'Yes' : 'No'}</th>
                                        	</tr>
                                        	<tr>
                                        		<th>Seminar Zoom Link</th>
                                        		<th>${seminar.seminarZoomLink}</th>
                                        	</tr>
                                        	<tr>
                                        		<th>Seminar Description</th>
                                        		<th>${seminar.seminarDescription}</th>
                                        	</tr>
                                        	<tr>
                                        		<th>Seminar English Banner</th>
                                        		<th><img src="${seminar.imgPathEnglish}" alt="No Image Added" width="150px" height="150px"  class="img-fluid"></th>
                                        	</tr>
                                        	<tr>
                                        		<th>Seminar Gujarati Banner</th>
                                        		<th><img src="${seminar.imgPathGujarati}" alt="No Image Added" width="150px" height="150px" class="img-fluid"></th>
                                        	</tr>
                                        	<tr>
                                        		<th>Seminar Whatsapp Link</th>
                                        		<th>${seminar.whatsappLink}</th>
                                        	</tr>
                                        	
                                        	
                                        	
										</tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- end basic table  -->
                    <!-- ============================================================== -->
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
</body>
</html>
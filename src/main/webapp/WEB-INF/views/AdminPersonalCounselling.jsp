<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="HeaderFile.jsp"%>

<link href='/resources/assets/vendor/full-calendar/css/fullcalendar.css'
	rel='stylesheet' />
<link
	href='/resources/assets/vendor/full-calendar/css/fullcalendar.print.css'
	rel='stylesheet' media='print' />
<title>Personal Counselling</title>
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
							<h2 class="pageheader-title">Personal Counselling</h2>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="adminDashboard"
											class="breadcrumb-link">Admin Dashboard</a></li>
										<li class="breadcrumb-item active" aria-current="page">Personal
											Counselling</li>
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
						<a href="bookedSlots" class="btn  text-white open" style="background-color:#1a3f13;">
							add Milk detail</a>&nbsp;	
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
											<th>Milk Id</th>
											<th>Date</th>
											<th>Price Sold/Litre</th>
											<th>Liters Sold</th>
											<th>Total Price</th>
											<th>Farm ID</th>
											<th>Cattle ID</th>
											<th>Time Of The Day</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach items="${userList}" var="a">
											<tr>
													<th>Milk Id</th>
													<th>Date</th>
													<th>Price Sold/Litre</th>
													<th>Liters Sold</th>
													<th>Total Price</th>
													<th>Farm ID</th>
													<th>Cattle ID</th>
													<th>Time Of The Day</th>
													<th>Action</th>
												
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

			</div>
			<%@include file="AdminFooter.jsp"%>
		</div>
	</div>

	<script src='/resources/assets/vendor/full-calendar/js/moment.min.js'></script>
	<script src='/resources/assets/vendor/full-calendar/js/fullcalendar.js'></script>
	<script
		src='/resources/assets/vendor/full-calendar/js/jquery-ui.min.js'></script>
	<script src='/resources/assets/vendor/full-calendar/js/calendar.js'></script>
</body>
</html>
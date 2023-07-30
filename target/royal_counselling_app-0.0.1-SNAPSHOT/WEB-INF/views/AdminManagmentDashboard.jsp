<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<%@include file="HeaderFile.jsp"%>
<title>Admin Management</title>
<style>
.popup-overlay {
	/*Hides pop-up when there is no "active" class*/
	visibility: hidden;
	position: absolute;
	background: #ffffff;
	border: 3px solid #666666;
	width: 50%;
	height: fit-content;
	left: 25%;
	z-index: +25;
}

.popup-overlay.active {
	/*displays pop-up when "active" class is present*/
	visibility: visible;
	text-align: center;
}

.popup-content {
	/*Hides pop-up content when there is no "active" class */
	visibility: hidden;
}

.popup-content.active {
	/*Shows pop-up content when "active" class is present */
	visibility: visible;
}

.close {
	display: inline-block;
	vertical-align: middle;
	border-radius: 30px;
	margin: .20rem;
	font-size: 1rem;
	color: #666666;
	background: #ffffff;
	border: 1px solid #666666;
}
</style>
</head>
<body>
	<div class="dashboard-main-wrapper">
		<%@include file="AdminNavBar.jsp"%>
		<div class="nav-left-sidebar sidebar-dark">
			<div class="menu-list">
				<nav class="navbar navbar-expand-lg navbar-light">
					<a class="d-xl-none d-lg-none" href="#">Dashboard</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarNav" aria-controls="navbarNav"
						aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarNav">
						<ul class="navbar-nav flex-column">
							<li class="nav-divider">Menu</li>
							<li class="nav-item "><a class="nav-link active"
								href="adminManagment" aria-expanded="false"
								data-target="#submenu-1" aria-controls="submenu-1"><i
									class="fa fa-fw fa-user-circle"></i>Admin Management</a> <a
								class="nav-link" href="#" aria-expanded="false"
								data-target="#submenu-1" aria-controls="submenu-1"><i
									class="fas fa-address-card"></i>User Management<span
									class="badge badge-success">6</span></a> <a class="nav-link"
								href="#" aria-expanded="false" data-target="#submenu-1"
								aria-controls="submenu-1"><i class="fas fa-diagnoses"></i>Seminar
									Management <span class="badge badge-success">6</span></a> <a
								class="nav-link" href="#" aria-expanded="false"
								data-target="#submenu-1" aria-controls="submenu-1"><i
									class="fas fa-list"></i>Seminar Resources <span
									class="badge badge-success">6</span></a> <a class="nav-link "
								href="#" aria-expanded="false" data-target="#submenu-1"
								aria-controls="submenu-1"><i class="fas fa-address-card"></i>Personal
									Counselling<span class="badge badge-success">6</span></a> <a
								class="nav-link" href="messageTemplates" aria-expanded="false"
								data-target="#submenu-1" aria-controls="submenu-1"><i
									class=" fas fa-newspaper"></i>Message Templates<span
									class="badge badge-success">6</span></a> <a class="nav-link"
								href="#" aria-expanded="false" data-target="#submenu-1"
								aria-controls="submenu-1"><i class="fas fa-video"></i>Video
									Management<span class="badge badge-success">6</span></a> <a
								class="nav-link" href="messageTemplates" aria-expanded="false"
								data-target="#submenu-1" aria-controls="submenu-1"><i
									class=" far fa-comment"></i>PPT Request<span
									class="badge badge-success">6</span></a>
											<a class="nav-link"
								href="#" aria-expanded="false"
								data-target="#submenu-1" aria-controls="submenu-1"><i
								class=" fas fa-link"></i>Link Management<span
								class="badge badge-success">6</span></a>		
																</li>
						</ul>
					</div>

				</nav>
			</div>
		</div>
		<div class="dashboard-wrapper">
			<div class="container-fluid dashboard-content ">
				<div class="row"></div>
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="page-header">
							<h2 class="pageheader-title">Admin Management</h2>
							<p class="pageheader-text">Nulla euismod urna eros, sit amet
								scelerisque torton lectus vel mauris facilisis faucibus at enim
								quis massa lobortis rutrum.</p>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="adminDashboard"
											class="breadcrumb-link">Admin Dashboard</a></li>
										<li class="breadcrumb-item active" aria-current="page">Admin
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
						<button class="btn bg-dark text-white open">Add Admin</button>
					</div>
				</div>
							<div class="popup-overlay">
				<div class="popup-content">
					<i class="fas fa-window-close close" style="float: right"></i><br>
					<br>
					<form id="addAdmin" action="addAdmin" method="post">
						<div class="card">
							<div class="card-header">
								<h3 class="mb-1">Admin Signup Form</h3>
								<p>Please Enter Admin Information</p>
							</div>
							<div class="card-body">
								<div class="form-group">
									<input class="form-control form-control-lg" type="text"
										name="name" id="name" placeholder="Admin Name"
										autocomplete="off" onkeyup="checkSpace(this)" required>

								</div>
								<div class="form-group">
									<input class="form-control form-control-lg" type="email"
										name="emailID" required placeholder="E-mail"
										autocomplete="off">
								</div>
								<div class="form-group">
									<input class="form-control form-control-lg" id="pass1"
										name="password" autocomplete="off" type="password"
										placeholder="Password" required>
								</div>
								<div class="form-group">
									<input class="form-control form-control-lg"
										placeholder="Confirm" autocomplete="off" oninput="check(this)"
										required>
								</div>
								<div class="form-group pt-2">
									<button class="btn btn-block btn-primary" type="submit">Register
										Admin</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
				<br>
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="card">
							<h5 class="card-header">Basic Table</h5>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered first">
										<thead>
											<tr>
												<th>Admin ID</th>
												<th>Admin Name</th>
												<th>Email ID</th>
												<th>Create At</th>
												<th>Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${admins}" var="a">
												<tr>
													<th>${a.adminID }</th>
													<th>${a.name }</th>
													<th>${a.emailID}</th>
													<th>${a.createdAt }</th>
													<th><a href="deleteAdmin/${a.adminID}" class="btn bg-dark text-white">Delete Admin</a>
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
	<%@include file="AdminFooter.jsp"%>
	<script>
	$(document).ready(function(){
			var cookieValue = document.getElementById("msg").innerHTML;
			if(cookieValue == ''){
				document.getElementById("alert").style.display = "none";
			}
			setTimeout(()=>{
				  document.getElementById("alert").style.display = "none";
			},4000)
		});
		function checkSpace(input) {
			console.log(input.value.trim)
			if (input.value.trim() === '') {

				input.setCustomValidity("Please don't enter blank space");
			} else {
				// input is valid -- reset the error message
				input.setCustomValidity('');
			}
		}
		function check(input) {
			if (input.value != document.getElementById('pass1').value) {
				input.setCustomValidity('Password Must be Matching.');
			} else {
				// input is valid -- reset the error message
				input.setCustomValidity('');
			}
		}

		let con = true
		//appends an "active" class to .popup and .popup-content when the "Open" button is clicked
		$(".open").on("click", function() {
			if (con == true) {
			
				$(".popup-overlay, .popup-content").addClass("active");
				con = false
			} else {
				con = true
				$(".popup-overlay, .popup-content").removeClass("active");
				$("#addAdmin").trigger('reset');
			}

		});

		//removes the "active" class to .popup and .popup-content when the "Close" button is clicked 
		$(".close").on("click", function() {
			con = true
			$(".popup-overlay, .popup-content").removeClass("active");
			$("#addAdmin").trigger('reset');

		});
	</script>
</body>
</html>
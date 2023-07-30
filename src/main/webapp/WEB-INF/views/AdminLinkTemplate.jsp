<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="HeaderFile.jsp"%>
<title>Link Management</title>
</head>
<body>
	<div class="dashboard-main-wrapper">
		<%@include file="AdminNavBar.jsp"%>
		<%@include file="AdminSideBar.jsp"%>
		<div class="dashboard-wrapper">
			<div class="container-fluid dashboard-content ">
				<div class="row">
					<div class="col-6">
						<div id="alert" class="alert alert-primary">
							<span id="msg">${msg }</span>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="page-header">
							<h2 class="pageheader-title">Link Management</h2>
							<p class="pageheader-text">Nulla euismod urna eros, sit amet
								scelerisque torton lectus vel mauris facilisis faucibus at enim
								quis massa lobortis rutrum.</p>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="adminDashboard"
											class="breadcrumb-link">Admin Dashboard</a></li>
										<li class="breadcrumb-item active" aria-current="page">Link
											Management</li>
									</ol>
								</nav>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="card">
							<h5 class="card-header">Master Links</h5>
							<div class="card-body">
								<form id="validationform" action="updateLinks" method="post">
									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Seminar
											Zoom Link</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<input type="text" placeholder="Type something"
												value="${link.seminarLink}" class="form-control" name="seminarLink" required>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Personal
											Counselling Zoom Link</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<input type="text" placeholder="Type something"
												value="${link.counsellingLink}" name="counsellingLink"  class="form-control" required>
										</div>
									</div>
									 <div class="row d-flex justify-content-center">
                                              <button type="submit" class="btn btn-space btn-primary">Submit</button>
                                               
                                        </div>
								</form>
							</div>
							<div class="card-footer text-center">
								<strong class="text-danger ">Please not! Links will
									update for upcoming events only. Already allocated links for
									seminar and personal counselling will not update </strong>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%@include file="AdminFooter.jsp"%>
		</div>
	</div>
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

	</script>
</body>
</html>
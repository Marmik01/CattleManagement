<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="HeaderFile.jsp"%>
<title>Message Template Management</title>
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
							<h2 class="pageheader-title">Message Templates</h2>
							<p class="pageheader-text">Nulla euismod urna eros, sit amet
								scelerisque torton lectus vel mauris facilisis faucibus at enim
								quis massa lobortis rutrum.</p>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="adminDashboard"
											class="breadcrumb-link">Admin Dashboard</a></li>
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
				<%@include file="AdminFooter.jsp"%>
			</div>
		</div>
		</div>
</body>
</html>
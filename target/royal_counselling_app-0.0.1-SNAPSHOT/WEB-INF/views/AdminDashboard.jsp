<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
   <!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  	<%@include file="HeaderFile.jsp"%>
<title>Admin Management</title>
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
							<h2 class="pageheader-title">Admin Dashboard</h2>
							<p class="pageheader-text">Nulla euismod urna eros, sit amet
								scelerisque torton lectus vel mauris facilisis faucibus at enim
								quis massa lobortis rutrum.</p>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item active"><a
											href="adminDashboard" class="breadcrumb-link">Admin
												Dashboard</a></li>
									</ol>
								</nav>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
						<div class="card border-3 border-top border-top-primary">
							<div class="card-body">
								<h5 class="text-muted">New Users Registered in Past One Day</h5>
								<div class="metric-value d-inline-block">
									<h1 class="mb-1">120</h1>
								</div>
								<div
									class="metric-label d-inline-block float-right text-success font-weight-bold">
									<span
										class="icon-circle-small icon-box-xs text-success bg-success-light"><i
										class="fa fa-fw fa-arrow-up"></i></span><span class="ml-1">5.86%</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
						<div class="card border-3 border-top border-top-primary">
							<div class="card-body">
								<h5 class="text-muted">Total Seminar Registration in Past
									One Day</h5>
								<div class="metric-value d-inline-block">
									<h1 class="mb-1">1245</h1>
								</div>
								<div
									class="metric-label d-inline-block float-right text-success font-weight-bold">
									<span
										class="icon-circle-small icon-box-xs text-success bg-success-light"><i
										class="fa fa-fw fa-arrow-up"></i></span><span class="ml-1">10%</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
						<div class="card border-3 border-top border-top-primary">
							<div class="card-body">
								<h5 class="text-muted">Today's Number of Personal
									Counselling Appointment</h5>
								<div class="metric-value d-inline-block">
									<h1 class="mb-1">13000</h1>
								</div>
								<div
									class="metric-label d-inline-block float-right text-success font-weight-bold">
									<span
										class="icon-circle-small icon-box-xs text-success bg-success-light"><i
										class="fa fa-fw fa-arrow-up"></i></span><span class="ml-1">5%</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
						<div class="card border-3 border-top border-top-primary">
							<div class="card-body">
								<h5 class="text-muted">New Presentation Making Request
									Pending</h5>
								<div class="metric-value d-inline-block">
									<h1 class="mb-1">1340</h1>
								</div>
								<div
									class="metric-label d-inline-block float-right text-danger font-weight-bold">
									<span
										class="icon-circle-small icon-box-xs text-danger bg-danger-light bg-danger-light "><i
										class="fa fa-fw fa-arrow-down"></i></span><span class="ml-1">4%</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="page-section" id="overview">
							 <div class="row">
							 	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
							 		<h2 class="lead">New User Registration From Past Week</h2>
							 		<hr>
							 	<div class="card">
                                    <h5 class="card-header">Registered User</h5>
                                    <div class="card-body p-0">
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead class="bg-light">
                                                    <tr class="border-0">
                                                        <th class="border-0">#</th>
                                                        <th class="border-0">Image</th>
                                                        <th class="border-0">First Name</th>
                                                        <th class="border-0">Last Name</th>
                                                        <th class="border-0">Email ID</th>
                                                        <th class="border-0">Phone Number</th>
                                                        <th class="border-0">User ID</th>
                                                        <th class="border-0">Registered Date</th>
                                                        <th class="border-0">Standard</th>
                                                        <th class="border-0">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>1</td>
                                                        <td>
                                                            <div class="m-r-10"><img src="assets/images/product-pic.jpg" alt="user" class="rounded" width="45"></div>
                                                        </td>
                                                        <td>Jap</td>
                                                        <td>Purohit</td>
                                                        <td>pjap041@gmail.com</td>
                                                        <td>999999999</td>
                                                        
                                                        <td>1</td>
                                                        <td>27-08-2018 01:22:12</td>
                                                        <td>College</td>
                                                        <td><a href="#" class="btn btn-small bg-primary">View Profile</a></td> 
                                                    </tr>
                                                    <tr>
                                                        <td>2</td>
                                                        <td>
                                                            <div class="m-r-10"><img src="assets/images/product-pic-2.jpg" alt="user" class="rounded" width="45"></div>
                                                        </td>
                                                        <td>Shail</td>
                                                        <td>Patel</td>
                                                        <td>shail.patel@gmail.com</td>
                                                        <td>999999999</td>
                                                        
                                                        <td>2</td>
                                                        <td>25-08-2018 21:12:56</td>
                                                        <td>College</td>
                                                        <td><a href="#" class="btn btn-small bg-primary">View Profile</a></td> 
                                                 
                                                    </tr>
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
		</div>
	</div>
	<%@include file="AdminFooter.jsp"%>
</body>
</html>
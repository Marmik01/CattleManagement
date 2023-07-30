<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<%@include file="HeaderFile.jsp"%>
<title>Template Management</title>
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
							<li class="nav-item ">
									<a class="nav-link" href="adminManagment"
									aria-expanded="false" data-target="#submenu-1"
									aria-controls="submenu-1"><i class="fa fa-fw fa-user-circle"></i>Admin Management</a> 
									<a class="nav-link" href="#"
									aria-expanded="false" data-target="#submenu-1"
									aria-controls="submenu-1"><i class="fas fa-address-card"></i>User
										Management<span class="badge badge-success">6</span></a> 
									<a class="nav-link" href="#" aria-expanded="false"
									data-target="#submenu-1" aria-controls="submenu-1"><i
										class="fas fa-diagnoses"></i>Seminar Management <span
										class="badge badge-success">6</span></a> 
									<a class="nav-link"
									href="#" aria-expanded="false" data-target="#submenu-1"
									aria-controls="submenu-1"><i class="fas fa-list"></i>Seminar
										Resources <span class="badge badge-success">6</span></a> 
									<a class="nav-link" href="#" aria-expanded="false"
									data-target="#submenu-1" aria-controls="submenu-1"><i
										class="fas fa-address-card"></i>Personal Counselling<span
										class="badge badge-success">6</span></a> 
									<a class="nav-link active"
									href="messageTemplates" aria-expanded="false" data-target="#submenu-1"
									aria-controls="submenu-1"><i class=" fas fa-newspaper"></i>Message Templates<span class="badge badge-success">6</span></a>
										<a class="nav-link" href="#" aria-expanded="false"
								data-target="#submenu-1" aria-controls="submenu-1"><i
								class="fas fa-video"></i>Video Management<span
								class="badge badge-success">6</span></a>		
							<a class="nav-link"
								href="#" aria-expanded="false"
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
			 <div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
			 		<div class="page-header">       
						<h2 class="pageheader-title">Message Templates</h2>
						  <p class="pageheader-text">Nulla euismod urna eros, sit amet scelerisque torton lectus vel mauris facilisis faucibus at enim quis massa lobortis rutrum.</p>
                                <div class="page-breadcrumb">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="adminDashboard" class="breadcrumb-link">Admin Dashboard</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">Message Template</li>
                                        </ol>
                                    </nav>
                           		</div>
						</div>
					</div>
				</div>
			</div>
			<%@include file="AdminFooter.jsp"%>
		</div>
	</div>
</body>
</html>
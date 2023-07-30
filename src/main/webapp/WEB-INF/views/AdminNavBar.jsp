
<!-- ============================================================== -->
<!-- navbar -->
<!-- ============================================================== -->
<div class="dashboard-header">
	<nav class="navbar navbar-expand-lg bg-white fixed-top">
		<a class="navbar-brand" href="adminManagment"><img
			src='/resources/assets/images/LOGO_COW.png' width='65px'><span style="color: maroon;" class="h5 font-weight-bold">Cattle Management</span></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse " id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto navbar-right-top">
				<li class="nav-item dropdown nav-user"><a
					class="nav-link nav-user-img" href="#" id="navbarDropdownMenuLink2"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img
						src="/resources/assets/images/avatar-1.jpg" alt=""
						class="user-avatar-md rounded-circle"></a>
					<div class="dropdown-menu dropdown-menu-right nav-user-dropdown"
						aria-labelledby="navbarDropdownMenuLink2">
						<div class="nav-user-info" style="background-color:maroon;">
							<h5 class="mb-0 text-white nav-user-name" >${sessionScope.adminObject.name}</h5>
						</div>
						<a class="dropdown-item" href="changePassword"><i class="fas fa-user mr-2"></i>Change
							Password</a> <a class="dropdown-item" href="logoutAdmin"><i
							class="fas fa-power-off mr-2"></i>Logout</a>
					</div></li>
			</ul>
		</div>
	</nav>
</div>
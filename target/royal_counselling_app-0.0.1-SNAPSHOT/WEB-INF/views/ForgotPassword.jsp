<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Forgot Password</title>
<link rel="stylesheet"
	href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css">
<link href="/resources/assets/vendor/fonts/circular-std/style.css"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/assets/libs/css/style.css">
<link rel="stylesheet"
	href="/resources/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
<style>
html, body {
	height: 100%;
}

body {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-align: center;
	align-items: center;
	padding-top: 40px;
	padding-bottom: 40px;
}
</style>
</head>

<body>
	<!-- ============================================================== -->
	<!-- forgot password  -->
	<!-- ============================================================== -->
	<div class="splash-container">
		<div class="card">
			<div class="card-header text-center">
				<img class="logo-img" src="/resources/assets/images/LOGO_ROYAL.png"
					alt="logo" width='128px'><span class="splash-description">Please
					enter your user information.</span>
			</div>
			<div class="card-body">
				<form action="">
					<p>Don't worry, we'll send you an email to reset your password.</p>
					<div class="form-group">
						<input class="form-control form-control-lg" type="email"
							name="email" placeholder="Your Email" autocomplete="off" required>
					</div>
					<div class="form-group pt-1">
						<input class="btn btn-block btn-primary btn-xl" type="submit"
							value="Reset Password" />
					</div>
				</form>
			</div>
				<div class="card-footer-item card-footer-item-bordered">
                    <a href="loginForm" class="footer-link">Login</a>
                </div>
		</div>

	</div>
	<!-- ============================================================== -->
	<!-- end forgot password  -->
	<!-- ============================================================== -->
	<!-- Optional JavaScript -->
	<script src="/resources/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
	<script src="/resources/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
</body>


</html>
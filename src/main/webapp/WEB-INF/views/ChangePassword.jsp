<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Change Password</title>
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
					enter your New Password</span>
			</div>
			<div class="card-body">
				<form action="changePassword" method="post">
						<div class="form-group">
							<input class="form-control form-control-lg" id="pass1"
								name="password" autocomplete="off" type="password"
								placeholder="Password" required>
						</div>
						<div class="form-group">
							<input class="form-control form-control-lg" placeholder="Confirm"
								autocomplete="off" oninput="check(this)" required>
						</div>
					<div class="form-group pt-1">
						<input class="btn btn-block btn-primary btn-xl" type="submit"
							value="Reset Password" />
					</div>
				</form>
			</div>

		</div>

	</div>
	<!-- ============================================================== -->
	<!-- end forgot password  -->
	<!-- ============================================================== -->
	<!-- Optional JavaScript -->
	<script src="/resources/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
	<script src="/resources/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
	<script>
		function check(input) {
			if (input.value != document.getElementById('pass1').value) {
				input.setCustomValidity('Password Must be Matching.');
			} else {
				// input is valid -- reset the error message
				input.setCustomValidity('');
			}
		}
	</script>
</body>


</html>
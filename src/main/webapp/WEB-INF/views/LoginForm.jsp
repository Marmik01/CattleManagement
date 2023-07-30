<!-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> -->
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login Form</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="/resources/assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/assets/libs/css/style.css">
    <link rel="stylesheet" href="/resources/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <style>
    html,
    body {
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
    <!-- login page  -->
    <!-- ============================================================== -->
    <div class="splash-container">
        <div class="card ">
            <div class="card-header text-center"><a href="loginForm"><img class="logo-img" src="/resources/assets/images/LOGO_COW.png" alt="logo" width='128px'><span class="h6  font-weight-bold" style="color: maroon;">Cattle Management</span></a><span class="splash-description">Please enter your user information.</span></div>
            <div class="card-body">
                <form action="loginForm" method="post">
                    <div class="form-group">
                        <input class="form-control form-control-lg" id="username" name="emailID" type="text" placeholder="Email ID" autocomplete="off" required>
                    </div>
                    <div class="form-group">
                        <input class="form-control form-control-lg" id="password" name="password" type="password" placeholder="Password" required>
                    </div>
					
                    <button type="submit" class="btn btn-lg btn-block" style="color: maroon;">Login</button>
                </form>
           		<br>
               <div class="text-danger"><p>${msg }</p></div>
            </div>
           
                 <div class="card-footer-item card-footer-item-bordered">
                    <a href="forgotPassword" class="footer-link">Forgot Password</a>
                </div>
           
        </div>
    </div>
  
    <!-- ============================================================== -->
    <!-- end login page  -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <script src="/resources/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="/resources/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
</body>
 
</html>
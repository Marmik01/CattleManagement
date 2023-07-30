<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css">
<link href="/resources/assets/vendor/fonts/circular-std/style.css"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/assets/libs/css/style.css">
<link rel="stylesheet"
	href="/resources/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
<link rel="stylesheet"
	href="/resources/assets/vendor/datepicker/tempusdominus-bootstrap-4.css" />
<link rel="stylesheet"
	href="/resources/assets/vendor/inputmask/css/inputmask.css" />

<link rel="stylesheet"
	href="/resources/assets/vendor/tagManagement/jquery.tagsinput.css" />
<%@include file="HeaderFile.jsp"%>
<title>Edit Power Point Keyword</title>
<style>
</style>
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
							<h2 class="pageheader-title">Power Point Management</h2>
							<h1></h1>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="adminDashboard"
											class="breadcrumb-link">Admin Dashboard </a></li>
										<li class="breadcrumb-item"><a href="seminarResources"
											class="breadcrumb-link">Power Point Management</a></li>
										<li class="breadcrumb-item active" aria-current="page">Edit
											Keyword</li>
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
				</div>
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="card">
							<h5 class="card-header">Power Point Keyword</h5>
							<div class="card-body">
							<div class="form-group row">
							
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Keyword
											</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<input type="hidden" id="pptID" value="${pptID}">
				
											<input type="text" name="tags" class="form-control" id="tags" value="" />
											
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
	<script src="/resources/assets/vendor/jquery/jquery-3.3.1.min.js"></script>

	<script
		src="/resources/assets/vendor/tagManagement/jquery.tagsinput.js"></script>
	<script>
	
	$('#tags').tagsInput({
		
		onAddTag : function(value){
			var pptID =  $("#pptID").val();
			var data = {
					pptID : parseInt(pptID),
					keyword : value
			}
			$.ajax({
				url: 'addKeyword',
				data : data,
				method: 'POST',
				success: function(data) {
					var statusCode = parseInt(data);
					document.getElementById("alert").style.display = "block";
					if(statusCode === 200){
						document.getElementById("msg").innerHTML= 'Added Keyword Successfully';
							
					}else{
						document.getElementById("msg").innerHTML= 'Some error occured';
					}
					setTimeout(()=>{
						  document.getElementById("alert").style.display = "none";
					},2000)
					
				},
				async: true,
				cache: false
			});
			
		},
		onRemoveTag: function(value){
			var pptID =  $("#pptID").val();
			var data = {
					pptID : parseInt(pptID),
					keyword : value
			}
			$.ajax({
				url: 'removeKeyword',
				data : data,
				method: 'POST',
				success: function(data) {
					var statusCode = parseInt(data);
					document.getElementById("alert").style.display = "block";
					if(statusCode === 200){
						document.getElementById("msg").innerHTML= 'Removed Keyword Successfully';
							
					}else{
						document.getElementById("msg").innerHTML= 'Some error occured';
					}
					setTimeout(()=>{
						  document.getElementById("alert").style.display = "none";
					},2000)
				},
				async: true,
				cache: false
			});

		}
	});
	$('#tags').importTags(loadKeywords());
	function loadKeywords(){
		var result = [];
		var pptID =  $("#pptID").val();
		var data = {
				pptID : parseInt(pptID),
		}
		$.ajax({
			url: 'getKeywords',
			data : data,
			method: 'GET',
			success: function(data) {
				result = data;
			},
			async: false,
			cache: false
		});
		return result.toString();
		
	}
	</script>	
</body>
</html>
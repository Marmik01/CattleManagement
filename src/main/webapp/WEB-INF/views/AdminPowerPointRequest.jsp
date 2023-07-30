<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	isELIgnored="false" pageEncoding="ISO-8859-1"%>
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
<link rel="stylesheet" type="text/css"
	href="/resources/assets/vendor/datatables/css/dataTables.bootstrap4.css">
<link rel="stylesheet" type="text/css"
	href="/resources/assets/vendor/datatables/css/buttons.bootstrap4.css">
<link rel="stylesheet" type="text/css"
	href="/resources/assets/vendor/datatables/css/select.bootstrap4.css">
<link rel="stylesheet" type="text/css"
	href="/resources/assets/vendor/datatables/css/fixedHeader.bootstrap4.css">
<%@include file="HeaderFile.jsp"%>

<title>Power Point Request Management</title>
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
							<h2 class="pageheader-title">Power Point Request Management</h2>
							<p class="pageheader-text">Nulla euismod urna eros, sit amet
								scelerisque torton lectus vel mauris facilisis faucibus at enim
								quis massa lobortis rutrum.</p>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="adminDashboard"
											class="breadcrumb-link">Admin Dashboard</a></li>
										<li class="breadcrumb-item active" aria-current="page">Power
											Point Request Management</li>
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
				<br>
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="card">
							<div class="card-header">Power Point Request Table</div>
							<div class="card-body">
								<div class="table-responsive">
									<table id="example"
										class="table table-striped table-bordered second"
										style="width: 100%">
										<thead>
											<tr>
												<th>Request ID</th>
												<th>Name</th>
												<th>Email ID</th>
												<th>Request Query</th>
												<th>Comment</th>
												<th>Query Finish Time</th>
												<th>Request At</th>
												<th>Query Over</th>

												<th>Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${requestList}" var="a">
												<tr>
													<th class="id" >${a.requestID }</th>
													<th>${a.firstName} ${a.lastName}</th>
													<th>${a.emailID}</th>
													<th>${a.requestQuery}</th>
													<th class="comment">${a.comment}</th>
													<th>${a.queryFinishTime }</th>
													<th>${a.requestAt}</th>
													<th>${a.queryOver ? 'Yes':'No' }</th>
													<th><c:if test="${!a.queryOver }">
															<a href="closePPTRequestQuery/${a.requestID }"
																class="btn bg-dark text-white open">Close Query</a>

															<button type="button"
																class="btn bg-dark text-white open use-address">
																Edit Comment</button>

														</c:if></th>
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
	<script
		src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script
		src="/resources/assets/vendor/datatables/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
	<script
		src="/resources/assets/vendor/datatables/js/buttons.bootstrap4.min.js"></script>
	<script src="/resources/assets/vendor/datatables/js/data-table.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
	<script src="/resources/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
	<script src="/resources/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
	<script
		src="/resources/assets/vendor/multi-select/js/jquery.multi-select.js"></script>
	<script src="/resources/assets/libs/js/main-js.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script
		src="/resources/assets/vendor/datatables/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
	<script
		src="/resources/assets/vendor/datatables/js/buttons.bootstrap4.min.js"></script>
	<script src="/resources/assets/vendor/datatables/js/data-table.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.colVis.min.js"></script>
	<script
		src="https://cdn.datatables.net/rowgroup/1.0.4/js/dataTables.rowGroup.min.js"></script>
	<script
		src="https://cdn.datatables.net/select/1.2.7/js/dataTables.select.min.js"></script>
	<script
		src="https://cdn.datatables.net/fixedheader/3.1.5/js/dataTables.fixedHeader.min.js"></script>
	<%@include file="AdminFooter.jsp"%>
	<script>
		$(".use-address").click(function() {
			var $row = $(this).closest("tr"); // Find the row
			var $text = $row.find(".id").text(); // Find the text
			var $comment = $row.find(".comment").text(); // Find the text

			// Let's test it out
			var commentValue = prompt(`Please enter the comment`, $comment);
			var data={
					requestID : parseInt($text),
					comment : commentValue
			}
			$.ajax({
				url: 'updateComment',
				data : data,
				method: 'POST',
				success: function(data) {
					var statusCode = parseInt(data);
					document.getElementById("alert").style.display = "block";
					if(statusCode === 200){
						document.getElementById("msg").innerHTML= 'Updated Comment Successfully';
						$row.find(".comment").html(commentValue);	
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
		//	console.log(data);
		});
	</script>

</body>
</html>
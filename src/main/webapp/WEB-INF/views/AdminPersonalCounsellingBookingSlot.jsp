<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Personal Counselling Booked Slot</title>
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
</head>
<%@include file="HeaderFile.jsp"%>

<body>
	<div class="dashboard-main-wrapper">
		<%@include file="AdminNavBar.jsp"%>
		<%@include file="AdminSideBar.jsp"%>
		<div class="dashboard-wrapper">
			<div class="container-fluid dashboard-content ">
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="page-header">
							<h2 class="pageheader-title">Personal Counselling Booked
								Slot</h2>
							<div class="page-breadcrumb">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="adminDashboard"
											class="breadcrumb-link">Admin Dashboard</a></li>
										<li class="breadcrumb-item"><a href="personalCounselling"
											class="breadcrumb-link">Personal Counselling Dashboard</a></li>

										<li class="breadcrumb-item active" aria-current="page">
											Personal Counselling Booking Request</li>
									</ol>
								</nav>
							</div>
						</div>
					</div>
				</div>
				<div class="col-6">
						<div id="alert" class="alert alert-primary">
							<span id="msg">${msg }</span>
						</div>
				</div>
				<br>
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">Booked Slots Table</h5>
						</div>
						<div class="card-body">
							<div class="table-responsive">

					
								<table id="example"    data-group-by="true"
									class="table table-striped table-bordered second"
									style="width: 100%">
									<thead>
										<tr>
											<th>Personal Counselling Booking ID</th>
											<th>Time Slot ID</th>
											<th>Start Time</th>
											<th>End Time</th>
											<th>Name</th>
											<th>Link</th>
											<th>Request At</th>
											<th>Counselling Type</th>
											<th>Email ID</th>
											<th>Phone Number</th>
											
											<th>Action</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach items="${bookingList}" var="a">
											<tr>
												<th>${a.personalCID }</th>
												<th>${a.timeSlotID }</th>
												<th>${a.startTime }</th>
												<th>${a.endTime }</th>
												<th>${a.firstName} ${a.lastName }</th>
												<th>${a.link }</th>
												<th>${a.requestedAt }</th>
												<th>${a.counsellingType}</th>
												<th>${a.emailID }</th>
												<th>${a.phoneNumber }</th>
											
												<th><a href="approveAppointment/${a.userID }/${a.personalCID}/${a.timeSlotID}"
													class=" btn  text-white open" style="background-color:#1a3f13;">Approve Appointment</a></th>
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
	<script src="/resources/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
	
	<script
		src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	
	<script
		src="/resources/assets/vendor/datatables/js/dataTables.bootstrap4.min.js"></script>
	
	<script
		src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
	<script
		src="/resources/assets/vendor/datatables/js/buttons.bootstrap4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
	<script src="/resources/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
	<script
		src="/resources/assets/vendor/multi-select/js/jquery.multi-select.js"></script>
	<script src="/resources/assets/libs/js/main-js.js"></script>
	<script
		src="/resources/assets/vendor/datatables/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
	<script
		src="/resources/assets/vendor/datatables/js/buttons.bootstrap4.min.js"></script>
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
	<%@include file="SideBarActive.jsp" %>
	<script>
	jQuery(document).ready(function($) {
		'use strict';
			var groupColumn= 1;
		    var table = $('table.second').DataTable({
                lengthChange: false,
                buttons: ['copy', 'excel', 'pdf', 'print', 'colvis'],
    	        rowGroup: {
    	            dataSrc: 2
    	        },
    	        "columnDefs": [
                    { "visible": true, "targets": groupColumn }
                ],
                "order": [
                    [1, 'asc']
                ],
                "drawCallback": function(settings) {
                    var api = this.api();
                    var rows = api.rows({ page: 'current' }).nodes();
                    var last = null;
                    api.column(groupColumn, { page: 'current' }).data().each(function(group, i) {
                    	
                        if (last !== group) {
                        	console.log('Data ',rows[i]);
                            $(rows).eq(i).before(
                                '<tr class="group"><td colspan="'+rows[i].cells.length+1+'"> Time Slot ID : ' + rows[i].cells[1].innerHTML + '&emsp;&emsp;&emsp;Start Time : '+rows[i].cells[2].innerHTML +'&emsp;&emsp;&emsp;End Time : '+rows[i].cells[3].innerHTML +'</td></tr>'
                            );

                            last = group;
                        }
                    });
                }
            });

            table.buttons().container()
                .appendTo('#example_wrapper .col-md-6:eq(0)');
            // Order by the grouping
             $('#example tbody').on('click', 'tr.group', function() {
                var currentOrder = table.order()[0];
                if (currentOrder[0] === groupColumn && currentOrder[1] === 'asc') {
                    table.order([groupColumn, 'desc']).draw();
                } else {
                    table.order([groupColumn, 'asc']).draw();
                }
            }); 
	});
	
	
	</script>	

</body>
</html>
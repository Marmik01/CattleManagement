document.addEventListener('DOMContentLoaded', function() {
	$('#calendar1').fullCalendar({
		eventClick: function(info) {
			document.getElementById('modal-title').innerHTML = `View Time Slot Details`
			document.querySelector('#modeDisplay').innerHTML = "Counselling Mode : " + "<b>" + info.counsellingType + "</b>";
			document.querySelector('#startTimePrint').innerHTML = "Counselling Start Time : " + "<b>" + info.start.toISOString() + "</b>";
			document.querySelector('#endTimePrint').innerHTML = "Counselling End Time  : " + "<b>" + info.end.toISOString() + "</b>";
			document.querySelector('#consuellingLink').innerHTML = "Counselling Link  : " + "<b>" + info.link + "</b>";
			document.querySelector('#counsellingTitle').innerHTML = "Counselling Title  : " + "<b>" + info.title + "</b>";
			document.querySelector('#cancelAppointment').style.display = "block";
			document.querySelector('#displayData').style.display = "block";
			document.querySelector('#timeSlotForm').style.display = "none";
			$("#cancelAppointment").attr('href', `cancelAppointment/${info.timeSlotID}`);
			if (info.isBooked) {
				document.querySelector("#bookingStatus").innerHTML = "<b>This Time Slot is booked Click on View User Button to see user profile</b>"
				document.querySelector('#viewUser').style.display = "block";
				$("#viewUser").attr('href', `viewUser/${info.userID}`);
			}
			else {
				$("#viewUser").attr('href', '#');
				document.querySelector('#viewUser').style.display = "none";
				document.querySelector("#bookingStatus").innerHTML = "<b>This Time Slot is not booked</b>"
			}
			document.querySelector('#submitButton').style.display = "none";
			$("#modalDemo").modal('show');
		},
		header: {
			left: 'prev,next today',
			center: 'title ',
			right: 'addEventButton month,agendaWeek,agendaDay,listWeek'
		},
		customButtons: {
			addEventButton: {
				text: 'Add Time Slot',
				click: function() {
					document.querySelector('#submitButton').style.display = "block";
					document.getElementById('modal-title').innerHTML = "Add Time Slot";
					document.querySelector('#displayData').style.display = "none";
					document.querySelector('#cancelAppointment').style.display = "none";
					document.querySelector('#timeSlotForm').style.display = "block";
					document.querySelector('#start').value = '';
					document.querySelector('#end').value = '';
					document.querySelector('#viewUser').style.display = "none";
					$(function() {
						var $radios = $('input:radio[name=counsellingType]');
						$radios.filter('[value=Online]').prop('checked', true);

					});
					$("#modalDemo").modal('show');
				}
			}
		},
		defaultDate: new Date(),
		events: getData()
	});
});

function getData() {
	var events = [];
	$.ajax({
		url: 'getAllCounsellingSlots',
		method: 'GET',
		success: function(data) {
				data.forEach((r)=>{
					console.log(r);	
					if (r.booked == true) {
						 r['backgroundColor']= '#ef172c',
                    	r['borderColor']= '#ef172c',
						r['title'] = `Personal Counselling of ${r.firstName} ${r.lastName}`;
					}
					else {
						r['title'] = 'Personal Counselling Appointment Not Booked'
					}
					events.push({	
						timeSlotID: r.timeSlotID,
						title: r.title,
						start: r.startTime,
						end: r.endTime,
						counsellingType: r.counsellingType,
						link: r.link,
						isBooked: r.booked,
						backgroundColor : r.backgroundColor,
						borderColor : r.borderColor,
						userID : r.userID
					});
				})
		},
		async: false,
		cache: false
	});
	return events;
}


<script type="text/javascript" >


	function checkSpace(input) {
		console.log(input.value.trim)
		if (input.value.trim() === '') {

			input.setCustomValidity("Please don't enter blank space");
		} else {
			// input is valid -- reset the error message
			input.setCustomValidity('');
		}
	}
	function check(input) {
		if (input.value != document.getElementById('pass1').value) {
			input.setCustomValidity('Password Must be Matching.');
		} else {
			// input is valid -- reset the error message
			input.setCustomValidity('');
		}
	}

	let con = true
	//appends an "active" class to .popup and .popup-content when the "Open" button is clicked
	$(".open").on("click", function() {
		if (con == true) {
		
			$(".popup-overlay, .popup-content").addClass("active");
			con = false
		} else {
			con = true
			$(".popup-overlay, .popup-content").removeClass("active");
			$("#addAdmin").trigger('reset');
		}

	});

	//removes the "active" class to .popup and .popup-content when the "Close" button is clicked 
	$(".close").on("click", function() {
		con = true
		$(".popup-overlay, .popup-content").removeClass("active");
		$("#addAdmin").trigger('reset');

	});
$(document).ready(function(){
	var cookieValue = document.getElementById("msg").innerHTML;
	if(cookieValue == ''){
		document.getElementById("alert").style.display = "none";
	}
	setTimeout(()=>{
		  document.getElementById("alert").style.display = "none";
	},4000)
});
	$(document).ready(function(){
		var ur= (window.location.pathname);
		//console.log('url',ur);
		//console.log(ur.includes("/adminManagment"))
		if (ur.includes("/adminManagment")){
			var a = document.getElementById("adminManagment");
			a.className = 'nav-link active'
		}else if(ur.includes("/userMangement") || ur.includes("/viewUserProfile")){
			var a = document.getElementById("userMangement");
			a.className = 'nav-link active'			
		}
		else if(ur.includes("/seminarManagement") || ur.includes("/addSeminar") || ur.includes("/editSeminar") || ur.includes("/viewSeminar")){
			var a = document.getElementById("seminarManagement");
			a.className = 'nav-link active'			
		}
		else if(ur.includes("/seminarResources") || ur.includes("/addPowerPointPresentation") || ur.includes("/editPPT")){
			var a = document.getElementById("seminarResources");
			a.className = 'nav-link active'			
		}
		else if(ur.includes("/personalCounselling") || ur.includes("/bookedSlots") || ur.includes("/viewBookingSlotRequest"))
		{
			var a = document.getElementById("personalCounselling");
			a.className = 'nav-link active'			
		}
		else if(ur.includes("/messageTemplates"))
		{
			var a = document.getElementById("messageTemplates");
			a.className = 'nav-link active'			
		}
		else if(ur.includes("/videoManagement") || ur.includes("/addVideo") || ur.includes("/editVideo"))
		{
			var a = document.getElementById("videoManagement");
			a.className = 'nav-link active'			
		}
		else if(ur.includes("/pptRequest"))
		{
			var a = document.getElementById("pptRequest");
			a.className = 'nav-link active'			
		}
		else if(ur.includes("/linkManagement")){
			var a = document.getElementById("linkManagement");
			a.className = 'nav-link active'			
		}
	});
	</script>
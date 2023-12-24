function register(){
	event.preventDefault()
	alert("Registered SuccesFully !!");
	// For Radio
	let radioselected = $('input[name=gender]:checked').val();
	// alert("Radio Selected " + radioselected );
	 
	// For Check-Box
	let values = []
	vehicleshtml = $('input[name=vehicle]:checked')
	Array.prototype.forEach.call(vehicleshtml, function (element) {
	    values.push(element.value)
	});
		let checkBxval = new Array();
	    checkBxval = values.toString();
	   // alert("ChecK Box " + checkBxval );    
	    
	var l = window.location;
	var base_url = l.protocol + "//" + l.host + "/" + l.pathname.split('/')[1];
	var serviceurl = base_url + '/addUser';

	// For Data to be Inserted
	$.ajax({
		type: 'POST',
		url: serviceurl,
		data: {
			'administrator': $('#administrator').val(),
			'username' : $('#username').val(),
			'email' : $('#email').val(),
			'password' : $('#password').val(),
			'birthday': $('#birthday').val(),
			'phone' : $('#phone').val(),
			'gender': radioselected,
			'country': $('#country').val(),
			'vehicle' : checkBxval
		},
		success: function() {
			location.reload();
		}
	});
	
}



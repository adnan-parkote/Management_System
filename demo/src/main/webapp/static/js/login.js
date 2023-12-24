var l = window.location;
var base_url = l.protocol + "//" + l.host + "/" + l.pathname.split('/')[1];

function login() {
	event.preventDefault();
	var serviceurl = base_url + '/login';

	$.ajax({
		type : 'POST',
		url : serviceurl,
		data : {
			'username' : $('#username').val(),
			'password' : $('#password').val()
		},
		success : function(response) {
			if (response == 'Success') {
				location.href = base_url + '/home';
			} else {
				alert(response);
			}
		}
	});

}

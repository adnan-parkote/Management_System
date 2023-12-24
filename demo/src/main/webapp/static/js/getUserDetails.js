window.onload = function() {
	var l = window.location;
	var base_url = l.protocol + "//" + l.host + "/" + l.pathname.split('/')[1];
	var serviceurl = base_url + '/getUserList';

	$
			.ajax({
				type : 'POST',
				url : serviceurl,
				dataType : 'JSON',
				success : function(response) {
					$('#usersTable')
							.DataTable(
									{
										data : response,
//										data : response[0],
//										columns : [
//												{
//													data : 'userrole',
//													title : 'Administrator'
//												},
//												{
//													data : 'username',
//													title : 'Username'
//												},
//												{
//													data : 'email',
//													title : 'Email'
//												},
//												{
//													data : 'birthday',
//													title : 'BirthDay'
//												},
//												{
//													data : 'telephone',
//													title : 'Contact'
//												},
//												{
//													data : 'country',
//													title : 'Country'
//												},
//												{
//													data : 'gender',
//													title : 'Gender'
//												},
//												{
//													data : 'vehicle',
//													title : 'Vehicle'
//												},
//												{
//													data : 'user_id',
//													title : 'Edit',
//													render : function(data) {
//														return "<button class='btn btn-primary' data-toggle='modal' data-target='#userEdit'onclick='editUser("
//																+ data
//																+ ");'>Edit</button>";
//													}
//												},
//												{
//													data : 'user_id',
//													title : 'Delete',
//													render : function(data) {
//														return "<button class='btn btn-danger' onclick='deleteUser("
//																+ data
//																+ ")'>Delete</button>";
//													}
//												} ]
									});
				}
			});
}

function editUser(id) {
	$('input[name=vehicle]').prop('checked', false);
	var l = window.location;
	var base_url = l.protocol + "//" + l.host + "/" + l.pathname.split('/')[1];
	var serviceurl = base_url + '/getUserDetails';

	$.ajax({
		type : 'POST',
		url : serviceurl,
		dataType : 'JSON',
		data : {
			id : id
		},
		success : function(response) {
			$('#srno').val(id);
			$('#administrator').val(response.administrator);
			$('#username').val(response.username);
			$('#email').val(response.email);
			$('#birthday').val(response.birthday);
			$('#password').val(response.password);
			$('#phone').val(response.phone);
			$('#country').val(response.country);
			$('input[name=gender][value=' + response.gender + ']').prop(
					'checked', true);
			let vehicles = response.vehicle.split(',');
			for (var i = 0; i < vehicles.length; i++) {
				$('input[name=vehicle][value=' + vehicles[i] + ']').prop(
						'checked', true);
			}
		}
	});
}

function deleteUser(id) {

	var l = window.location;
	var base_url = l.protocol + "//" + l.host + "/" + l.pathname.split('/')[1];
	var serviceurl = base_url + '/deleteUser';

	$.ajax({
		type : 'POST',
		url : serviceurl,
		data : {
			'srno' : id
		},
		success : function() {
			location.reload();
		}
	});
}

function updateUser() {
	// alert($('#srno').val());

	// For Radio
	let radioselected = $('input[name=gender]:checked').val();

	// For checkbox Selected
	let values = []
	vehicleshtml = $('input[name=vehicle]:checked')
	Array.prototype.forEach.call(vehicleshtml, function(element) {
		values.push(element.value)
	});
	let checkBxval = new Array();
	checkBxval = values.toString();

	var l = window.location;
	var base_url = l.protocol + "//" + l.host + "/" + l.pathname.split('/')[1];
	var serviceurl = base_url + '/updateUser';

	$.ajax({
		type : 'POST',
		url : serviceurl,
		data : {
			'srno' : $('#srno').val(),
			'administrator' : $('#administrator').val(),
			'username' : $('#username').val(),
			'email' : $('#email').val(),
			'password' : $('#password').val(),
			'birthday' : $('#birthday').val(),
			'phone' : $('#phone').val(),
			'gender' : radioselected,
			'country' : $('#country').val(),
			'vehicle' : checkBxval
		},
		success : function() {
			location.reload();
		}

	});

}

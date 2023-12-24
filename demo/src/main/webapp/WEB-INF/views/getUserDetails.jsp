<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Details</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.css" />

<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.js"></script>
</head>

<body>

	<jsp:include page="/WEB-INF/views/sidebar.jsp"></jsp:include>
	<br>

	<div class="container">

		<div class="row">
			<table id="usersTable" class="table ">
				<thead>
					<tr>
						<th scope="col">Administrator</th>
						<th scope="col">Name</th>
						<th scope="col">Email</th>
						<th scope="col">BirthDay</th>
						<th scope="col">Phone</th>
						<th scope="col">Country</th>
						<th scope="col">Gender</th>
						<th scope="col">Vehicle</th>
						<%
 							if (session.getAttribute("userrole").equals("Admin")) { 
			              		%>
						<th scope="col">Edit</th>
						<th scope="col">Delete</th>
						<% 
							} 
 						%>
					</tr>
				</thead>
			</table>
		</div>

		<!-- The Modal -->
		<div class="modal fade" id="userEdit">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title ">User Edit</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<form id="myForm" style="max-width: 500px; margin: auto">


							<input type="hidden" id="srno"> <label
								for="administrator">Select Administrator</label><br> <select
								name="administrator" id="administrator">
								<option value="Admin">Admin</option>
								<option value="User">User</option>
							</select><br> <label for="username">Enter Your Name</label><br>
							<input type="text" id="username" name="username"
								placeholder="username"><br> <label for="email">Enter
								Your ID</label><br> <input type="email" id="email" name="email"
								placeholder="email id"><br> <label for="password">Enter
								Your Password</label><br> <input type="password" id="password"
								name="password" placeholder="password"><br> <label
								for="birthday">Your Birth Date</label><br> <input
								type="date" id="birthday" name="birthday"> <br> <label
								for="phone">Mobile No.</label><br> <input type="tel"
								id="phone" name="phone" placeholder="123-45-678"><br>
							<br> <input type="radio" id="male" name="gender"
								value="Male"> <label for="male">Male</label> &nbsp; <input
								type="radio" id="female" name="gender" value="Female"> <label
								for="female">Female</label><br> <select name="country"
								id="country">
								<option value="USA">USA</option>
								<option value="India">India</option>
								<option value="Mexico">Mexico</option>
								<option value="Dubai">Dubai</option>
							</select><br> <input type="checkbox" id="vehicle1" name="vehicle"
								value="Bike"> <label for="vehicle1"> I have a
								Bike</label><br> <input type="checkbox" id="vehicle2"
								name="vehicle" value="Car"> <label for="vehicle2">
								I have a Car</label>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary"
							onclick="updateUser();">Save changes</button>
					</div>

				</div>
				</form>
			</div>

		</div>
	</div>
	</div>


	</div>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/static/js/getUserDetails.js"></script>
</body>
</html>
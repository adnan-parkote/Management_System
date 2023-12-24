<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,700">
<title>User Registration Form</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<!-- <script type="text/javascript" -->
<%-- 			src="<%=request.getContextPath()%>/static/css/loginUser.css"></script> --%>
<

<title>Insert title here</title>
<style>
body {
	color: #fff;
	background: #19aa8d;
	font-family: 'Roboto', sans-serif;
}

.form-control {
	font-size: 15px;
}

.form-control, .form-control:focus, .input-group-text {
	border-color: #e1e1e1;
}

.form-control, .btn {
	border-radius: 3px;
}

.signup-form {
	width: 425px;
	margin: 0 auto;
	padding: 0px 0;
}

.signup-form form {
	color: #999;
	border-radius: 3px;
	margin-bottom: 15px;
	background: #fff;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
}

.signup-form h2 {
	color: #333;
	font-weight: bold;
	margin-top: 0;
}

.signup-form hr {
	margin: 0 -30px 20px;
}

.signup-form .form-group {
	margin-bottom: 20px;
}

.signup-form label {
	font-weight: normal;
	font-size: 15px;
}

.signup-form .form-control {
	min-height: 38px;
	box-shadow: none !important;
}

.signup-form .input-group-addon {
	max-width: 42px;
	text-align: center;
}

.signup-form .btn, .signup-form .btn:active {
	font-size: 16px;
	font-weight: bold;
	background: #19aa8d !important;
	border: none;
	min-width: 140px;
}

.signup-form .btn:hover, .signup-form .btn:focus {
	background: #179b81 !important;
}

.signup-form a {
	color: #fff;
	text-decoration: underline;
}

.signup-form a:hover {
	text-decoration: none;
}

.signup-form form a {
	color: #19aa8d;
	text-decoration: none;
}

.signup-form form a:hover {
	text-decoration: underline;
}

.signup-form .fa {
	font-size: 21px;
}

.signup-form .fa-paper-plane {
	font-size: 18px;
}

.signup-form .fa-check {
	color: #fff;
	left: 17px;
	top: 18px;
	font-size: 7px;
	position: absolute;
}
</style>
</head>
<body>

	<div class="signup-form">
		<form>

            <div class="form-group">
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-user-o" aria-hidden="true"></i>
						</span>
					</div>
					<select name="administrator" class="form-control" id="administrator">
						<option value="Admin">Admin</option>
						<option value="User">User</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <span class="fa fa-user"></span>
						</span>
					</div>
					<input type="text" class="form-control" id="username"
						name="username" placeholder="Username" required="required">
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i
							class="fa fa-paper-plane"></i>
						</span>
					</div>
					<input type="email" class="form-control" id="email" name="email"
						placeholder="Email Address" required="required">
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-lock"></i>
						</span>
					</div>
					<input type="password" class="form-control" id="password"
						name="password" placeholder="Password" required="required">
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i
							class="fa fa-birthday-cake" aria-hidden="true"></i>
						</span>
					</div>
					<input type="date" class="for-control" id="birthday"
						name="birthday" required="required">
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-phone"
							aria-hidden="true"></i> <i class="fa fa-check"></i>
						</span>
					</div>
					<input type="tel" class="form-control" id="phone" name="phone"
						placeholder="123-45-678" required="required">
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-venus-mars"
							aria-hidden="true"></i>
						</span>
					</div>
					<input type="radio" class="form-control" id="male" name="gender"
						value="Male"> <label for="male">Male</label> <input
						type="radio" class="form-control" id="female" name="gender"
						value="Female"> <label for="female">Female</label>
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-globe"
							aria-hidden="true"></i>
						</span>
					</div>
					<select name="country" class="form-control" id="country">
						<option value="USA">USA</option>
						<option value="India" selected>India</option>
						<option value="Mexico">Mexico</option>
						<option value="Dubai">Dubai</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"> <i class="fa fa-car"
							aria-hidden="true"></i>
						</span>
					</div>
					<input type="checkbox" class="form-control" id="vehicle1"
						name="vehicle" value="Bike"> <label for="vehicle1">
						I have a Bike</label> <input type="checkbox" class="form-control"
						id="vehicle2" name="vehicle" value="Car"> <label
						for="vehicle2"> I have a Car</label>
				</div>
			</div>
				
			<div class="form-group">
				<button id="signup" class="btn btn-primary btn-lg"
					onclick="register()">Sign Up</button>
				&nbsp;&nbsp;&nbsp;
				<!--     <button id="reset" class="btn btn-primary btn-lg" value="reset" onclick="reset();">Reset</button>  -->
			</div>
			<div class="text-center">
				Already have an account? <a href="<%=request.getContextPath()%>/">Login
					here</a>
			</div>
		</form>

		<script type="text/javascript"
			src="<%=request.getContextPath()%>/static/js/loginUser.js"></script>
</body>
</html>
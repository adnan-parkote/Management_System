<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
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
<%-- <script src="<%=request.getContextPath()%>/static/css/signup.css"></script> --%>

<style>
body {
	font-family: "Lato", sans-serif;
}

.main-head {
	height: 150px;
	background: #FFF;
}

.sidenav {
	height: 100%;
	background-color: #000;
	overflow-x: hidden;
	padding-top: 20px;
}

.main {
	padding: 0px 10px;
}

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
}

@media screen and (max-width: 450px) {
	.login-form {
		margin-top: 10%;
	}
	.register-form {
		margin-top: 10%;
	}
}

@media screen and (min-width: 768px) {
	.main {
		margin-left: 40%;
	}
	.sidenav {
		width: 40%;
		position: fixed;
		z-index: 1;
		top: 0;
		left: 0;
	}
	.login-form {
		margin-top: 80%;
	}
	.register-form {
		margin-top: 20%;
	}
}

.login-main-text {
	margin-top: 20%;
	padding: 60px;
	color: #fff;
}

.login-main-text h2 {
	font-weight: 300;
}

.btn-black {
	background-color: #000 !important;
	color: #fff;
}
</style>

</head>
<body>

	<div class="sidenav">
		<div class="login-main-text">
			<h2>
				Application<br> Login Page
			</h2>
			<p>Login or register from here to access.</p>
		</div>
	</div>
	<div class="main">
		<div class="col-md-6 col-sm-12">
			<div class="login-form">
				<form>
					<div class="form-group">
						<label>User Name</label> <input type="text" class="form-control"
							id="username" placeholder="User Name">
					</div>
					<div class="form-group">
						<label>Password</label> <input type="password"
							class="form-control" id="password" placeholder="Password">
					</div>
					<button type="submit" class="btn btn-black" onclick="login()">Login</button>
					<p style="color: #393f81;">
						Don't have an account? <a
							href="<%=request.getContextPath()%>/loginUser">Register
							here</a>
					</p>

				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/static/js/login.js"></script>
</body>
</html>
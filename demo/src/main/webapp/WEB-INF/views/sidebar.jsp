
<nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark">

	<a class="navbar-brand" href="<%=request.getContextPath()%>/home">Home</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse " id="navbarNavDropdown">
		<ul class="navbar-nav">
			<li class="nav-item active"><a class="nav-link"
				href="<%=request.getContextPath()%>/userDetails">User List <span
					class="sr-only">(current)</span>
			</a></li>
			<%
				if (session.getAttribute("userrole").equals("Admin")) {
			%>
			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/loginUser">Add User</a></li>
			<%
				}
			%>
			<!-- 			<li class="nav-item"><a class="nav-link" href="#">Else</a></li> -->
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#"
				id="navbarDropdownMenuLink" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> <%=session.getAttribute("username")%>
			</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item"
						href="<%=request.getContextPath()%>/logout">Logout</a>
					<!-- 					<a class="dropdown-item" href="#">Action</a>  -->
					<!-- 					<a class="dropdown-item" href="#">Something else here</a> -->
				</div></li>
		</ul>
	</div>
</nav>
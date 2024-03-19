<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>servlet pagination</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
</head>
<body style="background-image: url('image.webp'); background-size: cover;">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container">
		<a class="navbar-brand" href="#">Servlet Pagination</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link"
					aria-current="page" href="home.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link"
					aria-current="page" href="contact.jsp">Contact</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="LoginController?action=login">Login</a></li>
				<li class="nav-item"><a class="nav-link"
					href="LoginController?action=register">Register</a></li>
			</ul>
		</div>
	</div>
	</nav>
<form action="LoginHomeController" method="post">
	
	<center><h2>Login</h2>
	<center><span style="color: red">${msg}</span></center>
	<div style="padding-left:539px;padding-right: 539px;">
			<label style="font-weight: bold;">UserId</label>
			<input class="form-control" type="text" name="uname" placeholder="enter user name" required autofocus></input>
			<br><label style="font-weight: bold;">Password</label>
			<input class="form-control" type="password" name="psw" placeholder="enter password" required></input>
			<br><input type="submit" value="submit" name="submit"></input>
			<a href="LoginHomeController?action=cancel"><button>Cancel</button></a>
	</div>
	</center>
</form>
<!-- Bootstrap core JS-->
	<script src="bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>
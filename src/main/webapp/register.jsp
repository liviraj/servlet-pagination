<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script type="text/javascript">
	function validation() {
		var uname1 = document.registerform.psw.value;
		var uname2 = document.registerform.psw1.value;

		if (uname1 == uname2) {
			return true;
		}

		else {
			document.write("Enter correct password");
			return false;
		}

	}
</script>
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
				<li class="nav-item"><a class="nav-link"
					href="LoginController?action=login">Login</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="LoginController?action=register">Register</a></li>
			</ul>
		</div>
	</div>
	</nav>
	<form name="registerform" action="LoginRegisterController"
		method="post">
		<div class="container">
			<center>
				<h2>Register</h2>
			</center>
			<div style="padding-left: 415px; padding-right: 374px;">
				<div class="form-group">
					<label>UserId</label> <input class="form-control" type="text"
						name="uname" placeholder="enter user name" required></input> <br>
					<label>Password</label> <input class="form-control" type="password"
						name="psw" placeholder="enter password" required></input> <br>
					<label>Re-enter password</label><br> <span style="color: red">${msg}</span>
					<input type="password" class="form-control" name="psw1"
						placeholder="re-enter password" required></input> <br>
					<div class="row">
						<div class="col-md-2">
							<input type="submit" value="Register" name="register"
								class="btn btn-info"></input>
						</div>
						<div class="col-md-2">
							<a href="LoginRegisterController?action=cancel"><button
									class="btn btn-danger" class="btn btn-info">Cancel</button></a>
						</div>

					</div>
				</div>
			</div>
		</div>
	</form>

</body>
</html>
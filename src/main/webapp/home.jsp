<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
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
	<!-- Responsive navbar-->
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
			<ul class="navbar-nav ms-auto mb-4 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="home.jsp">Home</a></li>
				<li class="nav-item"><a class="nav-link"
					aria-current="page" href="contact.jsp">Contact</a></li>
				<li class="nav-item"><a class="nav-link"
					href="LoginController?action=login">Login</a></li>
				<li class="nav-item"><a class="nav-link"
					href="LoginController?action=register">Register</a></li>
			</ul>
		</div>
	</div>
	</nav>
	<!-- Page content-->
	<div class="container">
		<div class="text-center mt-5">
			<h1>Servlet - Pagination</h1>
			<p class="lead">To divide large number of records into multiple
				parts</p>
			<p>Servlet-Pagination v1.0.0. Copyright@2024</p>
		</div>
	</div>
	<!-- Bootstrap core JS-->
	<script src="bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>

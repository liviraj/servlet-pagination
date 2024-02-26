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

<style type="text/css">
h1 {
	background-color: floralwhite;
}
</style>
<script src="jquery.min.js"></script>
<script>
	var val1 = $("#sel1").val();
	if (val1 == '' || val1 == 0) {
		$(document).ready(function() {
			$('#sel1').val("---select---");
			$('#sel2').val("---select---");
		});
	} else {
		$(document).ready(function() {
			$('#sel1').val('${details.gender}');
			$('#sel2').val('${details.department}');
		});
	}
</script>
</head>

<body>
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
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="#">Home</a></li>
				<li class="nav-item">
					<form action="LogoutController">
						<input type="submit" name="submit" value="logout"
							class="btn btn-danger">
					</form>
				</li>
			</ul>
		</div>
	</div>
	</nav>
	<form action="StudentController" method="post" name="rform">
		<div class="container">
			<input type="hidden" name="regId" value="${details.regId}">
			<center>
				<h2>Student Registration</h2>
			</center>


			<div class="col-md-9">
				<div>
					<label>Name<span style="color: red">*</span></label><br> <input
						id="name" class="form-control" type="text" name="name"
						value="${details.name}" placeholder="Enter name"> <br>

					<label>Mobile No<span style="color: red">*</span></label><br>
					<input id="mobileNo" class="form-control" type="text"
						name="mobileNo" value="${details.mobileNo}"
						placeholder="Enter mobile no"> <br> <label>Email
						Id<span style="color: red">*</span>
					</label><br> <input id="emailId" class="form-control" type="text"
						name="emailId" value="${details.emailId}"
						placeholder="Enter email id"> <br> <label>Date
						Of Birth<span style="color: red">*</span>
					</label><br> <input id="dob" class="form-control" type="date"
						path="dob" class="date" name="dob" pattern="dd-MM-yyyy"
						value="${details.dob}" /> <br> <label>Gender<span
						style="color: red">*</span></label>

					<div class="form-group">
						<div id="errteam">
							<span style="color: red" id="steam"></span>
						</div>
						<select class="form-control" name="gender" id="sel1"
							value="${details.gender}">
							<option value="" hidden>---select---</option>
							<option value="Male">Male</option>
							<option value="Female">Female</option>
						</select>
					</div>
					<br>
					<label>Department<span style="color: red">*</span></label> <select
						class="form-control" name="department" id="sel2"
						value="${details.department}">
						<option value="" hidden>---select---</option>
						<option value="B.A. TAMIL">B.A. TAMIL</option>
						<option value="BCA">BCA</option>
						<option value="B.Sc Computer Science">B.Sc Computer
							Science</option>
						<option value="BBA">BBA</option>
						<option value="B.Com">B.Com</option>
						<option value="B.A. ENGLISH">B.A. ENGLISH</option>
						<option value="B.SC. PHYSICS">B.SC. PHYSICS</option>
						<option value="B.A. ECONOMICS">B.A. ECONOMICS</option>
						<option value="B.SC. MATHEMATICS">B.SC. MATHEMATICS</option>
						<option value="B.SC. CHEMISTRY">B.SC. CHEMISTRY</option>
					</select>
				</div>
	<br>
				<label>Address<span style="color: red">*</span></label><br> <input
					id="address" class="form-control" type="text" name="address"
					value="${details.address}" placeholder="Enter address"> <br>
				<div class="row">
					<div class="col-md-1">
						<input class="btn btn-primary" type="submit" name="submit"
							value="${name}"></input>
					</div>
					<div class="col-md-1">
						<button class="btn btn-danger" type="submit" value="Cancel"
							name="submit">Cancel</button>
					</div>
				</div>


			</div>
		</div>
		</div>
	</form>
	<!-- Bootstrap core JS-->
	<script src="bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>
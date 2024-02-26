<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
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
<script>
function msg1(id){
	var idValue = id;
	var c=confirm("Are You Sure");
	if(c==true)
		{
			location.href="StudentController?action=delete&regId="+idValue; 
		}/* else{
			location.reload();
		} */
	
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
				<form action="LogoutController">
				<input type="submit" name="submit" value="logout" class="btn btn-danger">
				</form>
			</ul>
		</div>
	</div>
	</nav>
	<br>
	<br>
	<div class="container">
		<center>
			<p class="h2">Student Information With Pagination</p>
		</center>
		<table border="3" cellpadding="5" cellspacing="5"
			class="table table-striped table-bordered">
			<tr>
				<th>Student ID</th>
				<th>Student Name</th>
				<th>Mobile No</th>
				<th>Email Id</th>
				<th>Gender</th>
				<th>Date Of Birth</th>
				<th>Department</th>
				<th>Address</th>
				<th colspan="1"><a href="StudentController?action=add">Add
						New</a></th>
			</tr>

			<c:forEach var="student" items="${studentList}">
				<tr>
					<td>${student.regId}</td>
					<td>${student.name}</td>
					<td>${student.mobileNo}</td>
					<td>${student.emailId}</td>
					<td>${student.gender}</td>
					<td>${student.dob}</td>
					<td>${student.department}</td>
					<td>${student.address}</td>
					<td><a href="StudentController?action=update&regId=<c:out value="${student.regId}"/>"><button>Update</button></a>
						<a><button onclick="msg1(${student.regId})">Delete</button></a>
					</td>
				</tr>
			</c:forEach>
		</table>

		<%--For displaying Previous link except for the 1st page --%>
		<c:if test="${currentPage != 1}">
			<td><a href="student.do?page=${currentPage - 1}">Previous</a></td>
		</c:if>

		<%--For displaying Page numbers. 
    The when condition does not display a link for the current page--%>
		<table border="3" cellpadding="5" cellspacing="5"
			class="table-bordered">
			<tr>
				<c:forEach begin="1" end="${noOfPages}" var="i">
					<c:choose>
						<c:when test="${currentPage eq i}">
							<td>${i}</td>
						</c:when>
						<c:otherwise>
							<td><a href="student.do?page=${i}">${i}</a></td>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</tr>
		</table>

		<%--For displaying Next link --%>
		<c:if test="${currentPage lt noOfPages}">
			<td><a href="student.do?page=${currentPage + 1}">Next</a></td>
		</c:if>


		<!-- Bootstrap core JS-->
		<script src="bootstrap.bundle.min.js"></script>
		<!-- Core theme JS-->
		<script src="js/scripts.js"></script>
	</div>
</body>
</html>
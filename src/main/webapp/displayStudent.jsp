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

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<!-- Include DataTables CSS files -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/fixedheader/3.2.3/css/fixedHeader.dataTables.min.css">

<!-- Include DataTables JS files -->
<script type="text/javascript"
	src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/fixedheader/3.2.3/js/dataTables.fixedHeader.min.js"></script>
	
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
<script type="text/javascript">
$(document).ready(function () {
	
    // Setup - add a text input to each footer cell
    $('#example thead tr')
        .clone(true)
        .addClass('filters')
        .appendTo('#example thead');
 
    var table = $('#example').DataTable({
    	"searching": false,   // Search Box will Be Disabled

    	"ordering": false,    // Ordering (Sorting on Each Column)will Be Disabled

    	"info": false,         // Will show "1 to n of n entries" Text at bottom

    	"lengthChange": false,
    	 "paging": false,
        orderCellsTop: true,
        fixedHeader: true,
        initComplete: function () {
            var api = this.api();
 
            // For each column
            api
                .columns()
                .eq(0)
                .each(function (colIdx) {
                    // Set the header cell to contain the input element
                    var cell = $('.filters th').eq(
                        $(api.column(colIdx).header()).index()
                    );
                    var title = $(cell).text();
                    $(cell).html('<input type="text" placeholder="' + title + '" />');
 
                    // On every keypress in this input
                    $(
                        'input',
                        $('.filters th').eq($(api.column(colIdx).header()).index())
                    )
                        .off('keyup change')
                        .on('change', function (e) {
                            // Get the search value
                            $(this).attr('title', $(this).val());
                            var regexr = '({search})'; //$(this).parents('th').find('select').val();
 
                            var cursorPosition = this.selectionStart;
                            // Search the column for that value
                            api
                                .column(colIdx)
                                .search(
                                    this.value != ''
                                        ? regexr.replace('{search}', '(((' + this.value + ')))')
                                        : '',
                                    this.value != '',
                                    this.value == ''
                                )
                                .draw();
                        })
                        .on('keyup', function (e) {
                            e.stopPropagation();
 
                            $(this).trigger('change');
                            $(this)
                                .focus()[0]
                                .setSelectionRange(cursorPosition, cursorPosition);
                        });
                });
        },
    });

});

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
    <div class="d-flex justify-content-center">
        <table id="example" border="3" cellpadding="5" cellspacing="5" class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>Student ID</th>
                    <th>Student Name</th>
                    <th>Mobile No</th>
                    <th>Email Id</th>
                    <th>Gender</th>
                    <th>Date Of Birth</th>
                    <th>Department</th>
                    <th>Address</th>
                    <th colspan="1"><a href="StudentController?action=add">Add New</a></th>
                </tr>
            </thead>
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
                    <td>
                        <a href="StudentController?action=update&regId=<c:out value="${student.regId}"/>"><button>Update</button></a>
                        <a><button onclick="msg1(${student.regId})">Delete</button></a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <!-- Pagination -->
    <!-- Previous link -->
    <c:if test="${currentPage != 1}">
    <br>
        <a href="student.do?page=${currentPage - 1}" class="btn btn-primary">Previous</a>
    </c:if>

    <!-- Page numbers -->
    <div >
        <div>
            <c:forEach begin="1" end="${noOfPages}" var="i">
                <c:choose>
                    <c:when test="${currentPage eq i}">
                        <span>${i}</span>
                    </c:when>
                    <c:otherwise>
                        <a href="student.do?page=${i}" class="btn btn-primary">${i}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
    </div>
    <!-- Next link -->
    <c:if test="${currentPage lt noOfPages}">
    <br>
        <a href="student.do?page=${currentPage + 1}" class="btn btn-primary">Next</a>
    </c:if>

    <!-- Bootstrap core JS-->
    <script src="bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
</div>

</body>
</html>
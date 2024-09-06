<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Available Courses</title>
<!-- Bootstrap CSS for styling -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.table-container {
	margin-top: 50px;
}

.center-text {
	text-align: center;
}

.action-buttons a {
	margin-right: 5px;
}
</style>
</head>
<body>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container">
			<a class="navbar-brand" href="#">Dashboard</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link"
						href="registeredPerson">Registered Person</a></li>
					<li class="nav-item"><a class="nav-link"
						href="personPurchased">Purchased Course</a></li>
					<li class="nav-item"><a class="nav-link"
						href="coursesAvailable">Available Courses</a></li>
					<li class="nav-item"><a class="nav-link" href="addCourse">Add
							Course</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container table-container">
		<c:choose>
			<c:when test="${!empty courses}">
				<h2 class="text-center">Available Courses</h2>
				<table class="table table-bordered table-striped table-hover">
					<thead class="table-dark">
						<tr>
							<th>Course ID</th>
							<th>Course Name</th>
							<th>Course Price</th>
							<th>Operations</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="course" items="${courses}">
							<tr>
								<td>${course.cid}</td>
								<td>${course.name}</td>
								<td>${course.price}</td>
								<td class="action-buttons"><a
									href="editCourse?cid=${course.cid}"
									class="btn btn-warning btn-sm">Edit</a> <a
									href="deleteCourse?cid=${course.cid}"
									class="btn btn-danger btn-sm"
									onclick="return confirm('Are you sure you want to delete this course?')">Delete</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:when>
			<c:otherwise>
				<h1 class="text-danger center-text">No courses available</h1>
			</c:otherwise>
		</c:choose>
		
		<c:if test="${!empty msg}">
		<div class="alert alert-success mt-3">${msg}</div>
	    </c:if>
	</div>
	
	<!-- Bootstrap JS for functionality -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

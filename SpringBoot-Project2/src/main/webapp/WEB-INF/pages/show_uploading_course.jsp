<%@ page isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="frm"%>

<!DOCTYPE html>
<html>
<head>
    <title>Add Course</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
 <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="#">Dashboard</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="registeredPerson">Registered Person</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="personPurchased">Purchased Course</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="coursesAvailable">Available Courses</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="addCourse">Add Course</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
<div class="container mt-5">
    <h1 class="text-center text-primary">Add Course</h1>
    
    <!-- Form with Bootstrap styling -->
    <frm:form modelAttribute="js" enctype="multipart/form-data" class="border p-4 bg-light rounded">
        <div class="form-group row">
            <label for="courseId" class="col-sm-2 col-form-label">Course Id:</label>
            <div class="col-sm-10">
                <frm:input path="id" class="form-control" id="courseId" />
            </div>
        </div>
        <div class="form-group row">
            <label for="courseName" class="col-sm-2 col-form-label">Course Name:</label>
            <div class="col-sm-10">
                <frm:input path="name" class="form-control" id="courseName" />
            </div>
        </div>
        <div class="form-group row">
            <label for="coursePrice" class="col-sm-2 col-form-label">Course Price:</label>
            <div class="col-sm-10">
                <frm:input path="price" class="form-control" id="coursePrice" />
            </div>
        </div>
        <div class="form-group row">
            <label for="coursePhoto" class="col-sm-2 col-form-label">Course Photo:</label>
            <div class="col-sm-10">
                <frm:input type="file" path="photoContent" class="form-control-file" id="coursePhoto" />
            </div>
        </div>
        <div class="form-group row">
            <label for="courseFile" class="col-sm-2 col-form-label">Course File:</label>
            <div class="col-sm-10">
                <frm:input type="file" path="pdfContent" class="form-control-file" id="courseFile" />
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm-10 offset-sm-2">
                <button type="submit" class="btn btn-primary">Add</button>
            </div>
        </div>
    </frm:form>
</div>
<!-- Success Message -->
        <h1 class="text-center text-success">${msg}</h1>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>

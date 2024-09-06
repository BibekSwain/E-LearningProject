<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
    <!-- Main Content -->
    <div class="container mt-5">
        <h1 class="text-center mb-4">Welcome to the Admin Dashboard</h1>
        
        

        <div class="row">
            <div class="col-md-3">
                <div class="card text-center">
                    <div class="card-body">
                        <h5 class="card-title">Registered Person</h5>
                        <p class="card-text">View all registered persons.</p>
                        <a href="registeredPerson" class="btn btn-primary">View Details</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-center">
                    <div class="card-body">
                        <h5 class="card-title">Purchased Course</h5>
                        <p class="card-text">See all courses purchased.</p>
                        <a href="personPurchased" class="btn btn-primary">View Details</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-center">
                    <div class="card-body">
                        <h5 class="card-title">Available Courses</h5>
                        <p class="card-text">Explore available courses.</p>
                        <a href="coursesAvailable" class="btn btn-primary">View Details</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-center">
                    <div class="card-body">
                        <h5 class="card-title">Add Course</h5>
                        <p class="card-text">Add new courses to the list.</p>
                        <a href="addCourse" class="btn btn-primary">Add Now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

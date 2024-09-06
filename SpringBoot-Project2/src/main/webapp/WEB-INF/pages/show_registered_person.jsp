<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registered Persons</title>
    <!-- Bootstrap CSS for styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .table-container {
            margin-top: 50px;
        }
        .center-text {
            text-align: center;
        }
    </style>
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
    <div class="container table-container">
        <c:choose>
            <c:when test="${!empty personsList}">
                <table class="table table-bordered table-striped table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>PERSON ID</th>
                            <th>NAME</th>
                            <th>MAIL ID</th>
                            <th>GENDER</th>
                            <th>PHONE NUMBER</th>
                            <th>OPERATIONS</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="per" items="${personsList}">
                            <tr>
                                <td>${per.pid}</td>
                                <td>${per.name}</td>
                                <td>${per.mail}</td>
                                <td>${per.gender}</td>
                                <td>${per.phone}</td>
                                <td>
                                    <a href="deletePerson?no=${per.pid}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure to delete the record?')">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <h1 class="text-danger center-text">Records not found</h1>
            </c:otherwise>
        </c:choose>
        <h2 class="text-success center-text">${resultMsg}</h2>
    </div>

    <!-- Bootstrap JS for functionality -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

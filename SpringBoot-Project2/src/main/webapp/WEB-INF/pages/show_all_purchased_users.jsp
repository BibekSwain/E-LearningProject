<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Purchased Users and Books</title>
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
            <c:when test="${!empty purchasedUsers}">
                <h2 class="text-center">Users and Their Purchased Books</h2>
                <table class="table table-bordered table-striped table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>Person ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Gender</th>
                            <th>Phone Number</th>
                            <th>Books Purchased</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${purchasedUsers}">
                            <tr>
                                <td>${user.unid}</td>
                                <td>${user.uname}</td>
                                <td>${user.umail}</td>
                                <td>${user.ugender}</td>
                                <td>${user.uphone}</td>
                                <td>
                                    <table class="table table-bordered table-sm">
                                        <thead class="table-secondary">
                                            <tr>
                                                <th>Book ID</th>
                                                <th>Book Name</th>
                                                <th>Book Price</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="book" items="${user.books}">
                                                <tr>
                                                    <td>${book.bid}</td>
                                                    <td>${book.bname}</td>
                                                    <td>${book.bprice}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <h1 class="text-danger center-text">No records found</h1>
            </c:otherwise>
        </c:choose>
    </div>

    <!-- Bootstrap JS for functionality -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

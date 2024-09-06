<%@ page isErrorPage="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Listings</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .sidebar {
            background-color: #003366;
            padding: 15px;
            height: 100vh;
            position: fixed;
            width: 250px;
            top: 0;
            left: 0;
        }
        .sidebar a {
            color: white;
            display: block;
            padding: 10px;
            text-decoration: none;
        }
        .sidebar a:hover {
            background-color: #0056b3;
            text-decoration: none;
        }
        .content {
            margin-left: 270px;
            padding: 20px;
        }
        .course-card {
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            border-radius: 8px;
            overflow: hidden;
            background-color: white;
            margin-bottom: 30px;
        }
        .course-card img {
            width: 100%;
            height: 200px; /* Fixed height for uniformity */
            object-fit: cover; /* Ensures images fill the area without distortion */
        }
        .course-card .card-body {
            padding: 15px;
        }
        .course-card .btn-preview {
            background-color: #003366;
            color: white;
            border: none;
        }
        .course-card .btn-details {
            background-color: #dc3545;
            color: white;
            border: none;
        }
        .welcome-message {
            color: green;
            font-size: 1.5rem;
            font-weight: bold;
        }
        .top-bar {
            margin-left: 270px;
            padding: 10px;
            background-color: #e9ecef;
            display: flex;
            align-items: center; /* Align items vertically centered */
            justify-content: space-between; /* Space out items equally */
        }
        .top-bar .dashboard-btn {
            padding: 10px 20px;
            font-size: 1rem;
            border-radius: 5px;
            text-align: center;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            text-decoration: none;
            margin: 0;
        }
        .top-bar .dashboard-btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <!-- Top Bar with Welcome Message and Dashboard Link -->
    <div class="top-bar">
        <c:choose>
            <c:when test="${not empty sessionScope.pname}">
                <div class="welcome-message">Welcome, ${sessionScope.pname}!</div>
            </c:when>
            <c:otherwise>
                <div class="welcome-message">Welcome, Guest!</div>
            </c:otherwise>
        </c:choose>
        <a href="yourDashboard?pid=${pid}" class="btn btn-primary dashboard-btn">Dashboard</a>
    </div>

    <!-- Sidebar -->
    <div class="sidebar">
        <a href="java">Java Fullstack</a>
        <a href="ui">UI Fullstack</a>
        <a href="python">Python Fullstack</a>
        <a href="datastructure">Data Structures &amp; Algorithms</a>
        <a href="design">System Design</a>
        <a href="#">DevOps with AWS</a>
        <a href="#">Cloud Computing</a>
        <a href="#">Software Testing</a>
        <a href="#">Data Science</a>
        <a href="#">Mulesoft</a>
        <a href="#">Power BI</a>
        <a href="#">Linux</a>
        <a href="c">C - Language</a>
        <a href="#">Database</a>
    </div>

    <!-- Content -->
    <div class="content">
        <div class="row">
            <!-- Each course card takes 4 columns, making sure that only 3 cards fit in one row -->
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="course-card">
                    <img src="images/Core-Java.png" alt="Core Java">
                    <div class="card-body">
                        <h5 class="card-title">Core Java</h5>
                        <p class="card-text">Duration: 2 Months</p>
                        <p class="card-text"><span class="text-success">&#8377;5000</span> <del>&#8377;6000</del></p>
                        <div class="d-flex justify-content-between">
                            <button class="btn btn-preview">Preview</button>
                            <button class="btn btn-details">View Details</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Add other course cards similarly -->
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

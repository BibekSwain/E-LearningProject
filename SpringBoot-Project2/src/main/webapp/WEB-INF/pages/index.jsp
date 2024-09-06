<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hyscaler Styled Home Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        .navbar-brand {
            font-size: 2.5rem;
            color: #00f;
            font-weight: bold;
            text-decoration: none;
        }
        .hero-section {
            background-color: #a8e5e5;
            color: #333;
            padding: 50px 0;
        }
        .hero-section h1 {
            font-size: 2.5rem;
            font-weight: bold;
        }
        .hero-section p {
            font-size: 1.2rem;
        }
        .illustration {
            max-width: 100%;
            height: auto;
        }
        .navbar-nav .nav-item {
            margin-left: 10px;
        }
        .btn-outline-dark {
            margin-left: 10px;
        }
        .navbar-toggler {
            margin-left: auto;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Hyscaler</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link" href="about">About</a></li>
                    <li class="nav-item"><a class="nav-link" href="contact">Contact Us</a></li>
                    <li class="nav-item"><a class="nav-link" href="help">Help</a></li>
                    <li class="nav-item"><a class="btn btn-outline-dark" href="login">Log in</a></li>
                    <li class="nav-item"><a class="btn btn-outline-dark" href="register">Sign up</a></li>
                    <!-- Corrected modal trigger -->
                    <li class="nav-item"><a class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#adminModal">Admin</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero-section text-center">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6 text-start">
                    <h1>Skills for everyone &amp; everything</h1>
                    <p>Our big sale is on. Get courses for your career &amp; your life. Sale ends August 29.</p>
                </div>
                <div class="col-md-6">
                    <img src="images/e-learning_app.jpg" alt="Illustration" class="illustration">
                </div>
            </div>
        </div>
    </section>

    <!-- Admin Login Modal -->
    <div class="modal fade" id="adminModal" tabindex="-1" aria-labelledby="adminModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="adminModalLabel">Admin Login</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- Error message display -->
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger">${error}</div>
                    </c:if>
                    <form action="${pageContext.request.contextPath}/adminLogin" method="post">
                        <div class="mb-3">
                            <label for="adminEmail" class="form-label">Email ID</label>
                            <input type="email" class="form-control" id="adminEmail" name="email" placeholder="Enter your email" required>
                        </div>
                        <div class="mb-3">
                            <label for="adminPassword" class="form-label">Password</label>
                            <input type="password" class="form-control" id="adminPassword" name="password" placeholder="Enter your password" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Login</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Check if there's an error message and show the modal
        <% if (request.getAttribute("error") != null) { %>
            var myModal = new bootstrap.Modal(document.getElementById('adminModal'));
            myModal.show();
        <% } %>
    </script>
</body>
</html>

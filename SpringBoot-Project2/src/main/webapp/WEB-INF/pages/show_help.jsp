<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Help - Hyscaler</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .navbar-brand {
            color: blue;
            font-size: 38px;
            font-weight: bold; 
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                Hyscaler
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <button class="btn btn-outline-dark me-2" onclick="history.back()">Back</button>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-outline-dark me-2" href="login.html">Log in</a>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-outline-dark" href="register.html">Sign up</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Help Section -->
    <section class="py-5">
        <div class="container">
            <h1 class="text-center mb-4">Help</h1>
            <p>If you need help, please check out our FAQ section or reach out to our support team:</p>
            <ul>
                <li><a href="#">Frequently Asked Questions</a></li>
                <li><a href="#">Technical Support</a></li>
                <li><a href="#">Community Forums</a></li>
            </ul>
        </div>
    </section>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

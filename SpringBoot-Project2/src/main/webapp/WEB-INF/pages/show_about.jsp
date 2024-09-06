<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Hyscaler</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .header {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            padding: 10px;
            background-color: #f8f9fa;
            text-align: left;
            font-size: 38px;
            font-weight: bold;
            color: #00f; 
        }
        .logo-only {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 60vh;
        }
        .btn-back {
            display: block;
            margin: 20px auto;
        }
        .about-text {
            text-align: center;
            margin: 20px auto;
            max-width: 800px;
        }
        .highlight {
            background-color: #ffeb3b;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="header">
        Hyscaler
    </div>

    <div class="logo-only">
        <div class="text-center">
            <a class="btn btn-primary btn-back" href="./">Back to Home</a>
        </div>
    </div>

    <!-- About Us Text Section -->
    <div class="about-text">
        <p>
             Hyscaler has been at the forefront of online education. Our platform provides a vast array of courses aimed at helping individuals across the globe achieve their personal and professional goals.
        </p>
        <p>
            We are committed to making education accessible and affordable. Whether you're looking to advance your career, explore a new hobby, or gain new skills, Hyscaler has a course for you. Our mission is to empower individuals through learning and to create a world where education is accessible to all.
        </p>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

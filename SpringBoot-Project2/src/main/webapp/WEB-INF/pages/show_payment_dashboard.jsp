<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Successful</title>
    <!-- Bootstrap CSS for styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f8ff;
            font-family: 'Arial', sans-serif;
            text-align: center;
            padding-top: 50px;
        }
        .container {
            position: relative;
            display: inline-block;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
            background-color: white;
            max-width: 600px;
            margin: auto;
        }
        h1 {
            color: #28a745;
            font-size: 2.5rem;
            margin-bottom: 20px;
        }
        p {
            font-size: 1.25rem;
            color: #555;
            margin-bottom: 30px;
        }
        .btn {
            background-color: #28a745;
            color: white;
            border-radius: 50px;
            padding: 10px 25px;
            font-size: 1rem;
            font-weight: bold;
            text-transform: uppercase;
            text-decoration: none;
        }
        .btn:hover {
            background-color: #218838;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Payment Successful!</h1>
        <p>Thank you for your payment. Your transaction was completed successfully.</p>
        <a href="login" class="btn">Go to Home</a>
    </div>

    <!-- Bootstrap JS for interactivity -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

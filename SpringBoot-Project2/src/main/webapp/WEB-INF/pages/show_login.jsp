<%@ page isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="frm" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <!-- Display resultMsg in red using text-danger class -->
    <h2 class="text-center text-danger mb-4">${resultMsg}</h2>
    <!-- Display resultMsg1 and resultMsg2 in green using text-success class -->
    <h2 class="text-center text-success mb-4">${resultMsg1}</h2>
    <h2 class="text-center text-success mb-4">${resultMsg2}</h2>

    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card p-4 shadow-sm">
                <h4 class="card-title text-center mb-4">Login</h4>
                <frm:form modelAttribute="person">
                    <div class="mb-3">
                        <label for="email" class="form-label">Email ID:</label>
                        <frm:input path="mail" class="form-control" />
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password:</label>
                        <frm:input path="password" type="password" class="form-control" />
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Login</button>
                </frm:form>
                <div class="text-center mt-4">
                    <a href="register" class="btn btn-outline-secondary me-2">New User?</a>
                    <a href="forgotPassword" class="btn btn-outline-secondary">Forgot Password</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

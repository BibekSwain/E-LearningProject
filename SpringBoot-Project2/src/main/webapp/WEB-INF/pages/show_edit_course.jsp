<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="frm"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Course</title>
    <!-- Bootstrap CSS for styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
            border-radius: 10px;
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #007bff;
        }
        .form-container .btn-primary {
            width: 100%;
        }
        .form-group {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<div class="container form-container">
    <h2>Edit Course</h2>
    <frm:form modelAttribute="course" class="form-horizontal">
        <div class="form-group row">
            <label for="cid" class="col-sm-4 col-form-label">Course ID:</label>
            <div class="col-sm-8">
                <frm:input path="cid" id="cid" readonly="true" class="form-control"/>
            </div>
        </div>

        <div class="form-group row">
            <label for="name" class="col-sm-4 col-form-label">Course Name:</label>
            <div class="col-sm-8">
                <frm:input path="name" id="name" class="form-control"/>
            </div>
        </div>

        <div class="form-group row">
            <label for="price" class="col-sm-4 col-form-label">Course Price:</label>
            <div class="col-sm-8">
                <frm:input path="price" id="price" class="form-control"/>
            </div>
        </div>

        <div class="form-group">
            <input type="submit" value="Update" class="btn btn-primary">
        </div>
    </frm:form>
    
</div>

<!-- Bootstrap JS for functionality -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

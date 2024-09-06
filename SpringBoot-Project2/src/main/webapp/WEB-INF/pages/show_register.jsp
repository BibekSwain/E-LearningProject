<%@page isELIgnored="false" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="frm"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Form</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" >
    <link rel="stylesheet" type="text/css" href="css/style.css" />
   
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center text-primary mb-4">User Registration Form</h1>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card p-4 shadow-sm">
                    <frm:form modelAttribute="person">
                        <div class="row mb-3">
                            <label for="name" class="col-sm-4 col-form-label">Name:</label>
                            <div class="col-sm-8">
                                <frm:input path="name" class="form-control" />
                                <frm:errors path="name" cssClass="text-danger" />
                                <span id="nameErr" class="text-danger"></span>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="mail" class="col-sm-4 col-form-label">Email ID:</label>
                            <div class="col-sm-8">
                                <frm:input path="mail" class="form-control" />
                                <frm:errors path="mail" cssClass="text-danger" />
                                <span id="mailErr" class="text-danger"></span>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="gender" class="col-sm-4 col-form-label">Gender:</label>
                            <div class="col-sm-8">
                                <frm:select path="gender" class="form-control">
                                    <frm:options items="${genderList}" />
                                </frm:select>
                                <frm:errors path="gender" cssClass="text-danger" />
                                <span id="genderErr" class="text-danger"></span>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="phone" class="col-sm-4 col-form-label">Phone Number:</label>
                            <div class="col-sm-8">
                                <frm:input path="phone" class="form-control" />
                                <frm:errors path="phone" cssClass="text-danger" />
                                <span id="phoneErr" class="text-danger"></span>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="password" class="col-sm-4 col-form-label">Password:</label>
                            <div class="col-sm-8">
                                <frm:input path="password"  class="form-control" />
                                <frm:errors path="password" cssClass="text-danger" />
                                <span id="passErr" class="text-danger"></span>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Register</button>
                    </frm:form>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" ></script>
</body>
</html>

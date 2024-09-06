<%@ taglib uri="http://www.springframework.org/tags/form" prefix="frm" %>
<!DOCTYPE html>
<html>
<head>
    <title>OTP Verification</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<h2 style="color:red; text-align:center">${flash.errorMsg}</h2>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h2 class="text-center mt-5">Enter the OTP sent to your email</h2>
                <frm:form modelAttribute="user" action="submitOtp" method="post" class="mt-4">
                    <div class="form-group">
                        <label for="otp">OTP:</label>
                        <frm:input path="otp" cssClass="form-control" id="otp" placeholder="Enter OTP"/>
                    </div>
                    <div class="form-group text-center">
                        <input type="submit" value="Submit" class="btn btn-primary"/>
                    </div>
                </frm:form>
            </div>
        </div>
    </div>

    <!-- Include Bootstrap JS and dependencies (Optional, for any Bootstrap JS components) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

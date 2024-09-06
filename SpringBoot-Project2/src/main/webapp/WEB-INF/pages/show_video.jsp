<%@ page isELIgnored="false"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

<div class="container mt-5">
    <c:choose>
        <c:when test="${!empty videoPath}">
            <h1 class="text-center text-danger mb-4">Video Player</h1>
            <div class="d-flex justify-content-center align-items-center" style="min-height: 60vh;">
                <div class="embed-responsive embed-responsive-16by9" style="max-width: 640px;">
                    <video class="embed-responsive-item" controls>
                        <source src="${videoPath}" type="video/mp4">
                        Your browser does not support the video tag.
                    </video>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <h1 class="text-center text-warning">Video not found</h1>
        </c:otherwise>
    </c:choose>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<%@ page isELIgnored="false"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

<div class="container mt-5">
    <c:choose>
        <c:when test="${!empty allSection}">
            <h1 class="text-center text-danger">All Videos</h1>
            <table class="table table-bordered table-hover table-striped text-center mt-4">
                <thead class="thead-dark">
                    <tr>
                        <th>Video Section</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="eachVideo" items="${allSection}">
                        <tr>
                            <td>
                                <a href="display?day=${eachVideo.days}&id=${eachVideo.nid}" class="btn btn-primary">
                                    ${eachVideo.days}
                                </a>
                            </td>
                        </tr>
                    </c:forEach>  
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <h1 class="text-center text-warning">Records not found</h1>
        </c:otherwise>
    </c:choose>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

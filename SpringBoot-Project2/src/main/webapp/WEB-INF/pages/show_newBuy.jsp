<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Courses Bought</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .content {
            padding: 20px;
        }
        .btn-buy-more, .btn-pay {
            margin-top: 20px;
        }
        .total-price {
            margin-top: 20px;
            font-weight: bold;
        }
        h2{
        color: Green;
        }
    </style>
    
    <script>
        function confirmDeletion(event) {
            if (!confirm("Are you sure you want to delete this course?")) {
                event.preventDefault(); 
            }
        }
    </script>
</head>
<body>
    <div class="container content">
        <h2>Courses Buying</h2>

        <!-- JSTL choose structure to handle the display logic -->
        <c:choose>
            <c:when test="${not empty courses}">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Course ID</th>
                            <th>Course Name</th>
                            <th>Price</th>
                            <th>Operations</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="course" items="${courses}">
                            <tr>
                                <td>${course.cid}</td>
                                <td>${course.name}</td>
                                <td>&#8377;${course.price}</td>
                                <td>
                                    <!-- Delete Link -->
                                    <a href="delete?cno=${course.cid}" class="btn btn-danger btn-sm" onclick="confirmDeletion(event)">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                
                <div class="total-price">
                    Total Price: &#8377;${totalPrice}
                </div>

                
                <div>
                    <a href="java" class="btn btn-primary btn-buy-more">Buy More</a>
                    <a href="paymentDashboard" class="btn btn-success btn-pay">Pay</a>
                </div>
            </c:when>
            <c:otherwise>
                <h3 class="text-danger">No courses bought yet!</h3>
            </c:otherwise>
        </c:choose>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

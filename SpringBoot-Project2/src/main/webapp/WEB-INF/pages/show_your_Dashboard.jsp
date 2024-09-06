<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Dashboard</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f8ff;
        }
        header {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background-color: #f8f9fa;
            padding: 20px;
            position: relative;
        }
        .header-title {
            color: #00f; /* Shining blue */
            font-size: 36px; /* Increased font size */
            font-weight: bold;
            position: absolute;
            top: 10px;
            left: 10px;
        }
        .header h1 {
            margin: 0;
            color: #008000; 
            font-size: 32px;
        }
        .card-container {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    justify-content: center;
    padding: 20px;
}

.card {
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    width: 400px; /* Increased width */
    text-align: center;
    background-color: #f9f9f9;
    margin: 20px;
    padding: 10px;
}

.card img {
    width: 100%;
    height: 200px; /* Maintain aspect ratio */
    object-fit: cover;
    border-radius: 8px 8px 0 0;
}

.card button {
    margin-top: 10px;
    padding: 10px 20px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.card button:hover {
    background-color: #45a049;
}


    </style>
</head>
<body>
    <header>
        <div class="header-title">Hyscaler</div>
        <h1 style="color:green">Your Dashboard</h1>
    </header>

    <div class="card-container">
        <c:forEach var="note" items="${notes}">
            <div class="card">
                <!-- Display the photo -->
                <img src="data:image/png;base64,${note.base64Image}" alt="Note Image">
                
                 <!-- Display the note name below the image -->
                <p class="note-name">${note.name}</p>
            <a href="displayVideo?id=${note.vid}">Videos</a>
                <!-- View Button to display PDF file -->
                <form action="viewNote" method="get">
                    <input type="hidden" name="noteId" value="${note.vid}" />
                    <button type="submit">View PDF</button>
                </form>
            </div>
        </c:forEach>
    </div>
</body>
</html>

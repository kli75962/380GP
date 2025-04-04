<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error - Course Portal</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #333;
            max-width: 900px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f5f8fa;
        }
        .error-container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin: 50px auto;
            text-align: center;
        }
        h1 {
            color: #e74c3c;
            margin-bottom: 20px;
        }
        .error-message {
            color: #7f8c8d;
            margin-bottom: 20px;
        }
        .back-link {
            color: #3498db;
            text-decoration: none;
            font-weight: 600;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h1>Oops! Something went wrong</h1>
        <div class="error-message">
            ${error}
        </div>
        <a href="<c:url value='/'/>" class="back-link">Return to Home Page</a>
    </div>
</body>
</html> 
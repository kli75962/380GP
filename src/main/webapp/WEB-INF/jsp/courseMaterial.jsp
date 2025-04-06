<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>COMPS 380F - Web Applications</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #333;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f5f8fa;
        }
        .header {
            background-color: #2c3e50;
            color: white;
            padding: 20px;
            border-radius: 5px;
            margin-bottom: 30px;
        }
        h1 {
            margin: 0;
            font-size: 2em;
        }
        .course-code {
            font-size: 1.2em;
            opacity: 0.8;
        }
        .nav {
            display: flex;
            gap: 15px;
            margin: 20px 0;
        }
        .nav a {
            color: #3498db;
            text-decoration: none;
            font-weight: 600;
        }
        .nav a:hover {
            text-decoration: underline;
        }
        .section {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            margin-bottom: 30px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        h2 {
            color: #2980b9;
            margin-top: 0;
            border-bottom: 2px solid #3498db;
            padding-bottom: 10px;
        }
        .lecture-list, .poll-list {
            list-style-type: none;
            padding: 0;
        }
        .lecture-item, .poll-item {
            padding: 15px;
            border-left: 4px solid #3498db;
            margin-bottom: 15px;
            background-color: #f8f9fa;
            transition: all 0.3s;
        }
        .lecture-item:hover, .poll-item:hover {
            background-color: #e1f0fa;
            transform: translateX(5px);
        }
        .lecture-title, .poll-question {
            font-weight: 600;
            margin-bottom: 5px;
            color: #2c3e50;
        }
        .lecture-date, .poll-status {
            font-size: 0.9em;
            color: #7f8c8d;
        }
        .login-status {
            text-align: right;
            margin-bottom: 20px;
        }
        .login-status a {
            color: #3498db;
            text-decoration: none;
        }
        .lecture-item a {
            text-decoration: none; /* Disable the underline */
        }
    </style>
</head>
<body>
<div class="login-status">
    <c:choose>
        <c:when test="${not empty user}">
            Welcome, ${user.username} | <a href="<c:url value='/logout'/>">Logout</a>
        </c:when>
        <c:otherwise>
            <a href="<c:url value='/login'/>">Sign In</a> | <a href="<c:url value='/register'/>">Register</a>
        </c:otherwise>
    </c:choose>
</div>


<div class="header">
    <h1>Lecture Material: ${lectureTitle}</h1>
</div>

<div class="nav">
    <a href="index.jsp">Home</a>
    <a href="#">Lectures</a>
    <a href="#">Polls</a>
</div>

<div class="section">
    <h2>lecture notes</h2>
    <!-- Display download links -->
    <c:if test="${not empty downloadLinks}">
        <h3>Download Links:</h3>
        <ul class="download-links">
            <c:forEach var="link" items="${downloadLinks}">
                <li><a href="${link}" target="_blank">${link}</a></li>
            </c:forEach>
        </ul>
    </c:if>

    <!-- If no download links, show a message -->
    <c:if test="${empty downloadLinks}">
        <p>No download links available for this lecture.</p>
    </c:if>
</div>

<div class="section">
    <h2>Comments</h2>
    <!-- Display comments -->
    <c:if test="${not empty comments}">
        <ul class="comments">
            <c:forEach var="comment" items="${comments}">
                <li>${comment}</li> <!-- Display the content of each comment -->
            </c:forEach>
        </ul>
    </c:if>

    <!-- If no comments, show a message -->
    <c:if test="${empty comments}">
        <p>No comments for this lecture.</p>
    </c:if>
</div>

</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Comment History - COMPS 380F</title>
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
        .header {
            background-color: #2c3e50;
            color: white;
            padding: 20px;
            border-radius: 5px;
            margin-bottom: 30px;
        }
        h1 {
            margin: 0;
            font-size: 1.8em;
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
        .history-container {
            background-color: white;
            padding: 25px;
            border-radius: 5px;
            margin-bottom: 30px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        h2, h3 {
            font-size: 1.3em;
            color: #2c3e50;
            margin-bottom: 20px;
            font-weight: 600;
        }
        .history-item {
            border-left: 3px solid #3498db;
            padding: 15px;
            margin-bottom: 20px;
            background-color: #f8f9fa;
        }
        .history-meta {
            font-size: 0.9em;
            color: #7f8c8d;
            margin-bottom: 5px;
        }
        .login-status {
            text-align: right;
            margin-bottom: 20px;
        }
        .login-status a {
            color: #3498db;
            text-decoration: none;
        }
    </style>
</head>
<body>
<div class="login-status">
    <c:choose>
        <c:when test="${not empty pageContext.request.userPrincipal}">
            Welcome, ${pageContext.request.userPrincipal.name} | <a href="<c:url value='/logout'/>">Logout</a>
        </c:when>
        <c:otherwise>
            <a href="<c:url value='/login'/>">Sign In</a> | <a href="<c:url value='/register'/>">Register</a>
        </c:otherwise>
    </c:choose>
</div>

<div class="header">
    <h1>Web Applications: Design and Development</h1>
</div>

<div class="nav">
    <a href="<c:url value='/'/>">Home</a>
    <a href="<c:url value='/courseMaterials'/>">Course Materials</a>
    <a href="<c:url value='/polls'/>">Polls</a>
</div>

<div class="history-container">
    <h2>Your Comment History</h2>

    <h3>Poll Comments</h3>
    <c:forEach var="comment" items="${pollComments}">
        <div class="history-item">
            <div class="history-meta" data-timestamp="${comment.timestamp}"></div>
            <div><strong>Poll:</strong> <c:out value="${comment.poll.question}" /></div>
            <div><strong>Comment:</strong> <c:out value="${comment.content}" /></div>
        </div>
    </c:forEach>
    <c:if test="${empty pollComments}">
        <div class="history-item">
            No poll comments found.
        </div>
    </c:if>

    <h3>Lecture Comments</h3>
    <c:forEach var="comment" items="${lectureComments}">
        <div class="history-item">
            <div class="history-meta" data-timestamp="${comment.timestamp}"></div>
            <div><strong>Lecture:</strong> <c:out value="${comment.lecture.title}" /></div>
            <div><strong>Comment:</strong> <c:out value="${comment.content}" /></div>
        </div>
    </c:forEach>
    <c:if test="${empty lectureComments}">
        <div class="history-item">
            No lecture comments found.
        </div>
    </c:if>
</div>

<script>
    function formatDateTime(dateStr) {
        const date = new Date(dateStr);
        const options = {
            year: 'numeric',
            month: 'short',
            day: 'numeric',
            hour: '2-digit',
            minute: '2-digit'
        };
        return date.toLocaleString(undefined, options);
    }

    document.addEventListener('DOMContentLoaded', function() {
        document.querySelectorAll('.history-meta').forEach(el => {
            const timestamp = el.getAttribute('data-timestamp');
            if (timestamp) {
                el.textContent = formatDateTime(timestamp);
            }
        });
    });
</script>
</body>
</html>
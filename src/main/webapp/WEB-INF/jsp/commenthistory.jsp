<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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

<div class="header">
    <h1><spring:message code="title"/></h1>
</div>

<div class="nav">
  <a href="<c:url value='/'/>" class="nav-link"><spring:message code="index.homepage" /></a>

    <a href="<c:url value='/commenthistory'/>" class="nav-link"><spring:message code="index.commentHistory" /></a>

    <a href="<c:url value='/votinghistory'/>" class="nav-link"><spring:message code="index.pollsHistory" /></a>
    <!--------origin/main----------->
    <c:if test="${not empty user && user.role eq 'TEACHER'}">
        <a href="<c:url value='/userManagement'/>" class="nav-link"><spring:message code="admin.title"/></a>
    </c:if>
            <row style="right: 0">
            <a> <spring:message code="index.language" /> : </a>
            <a href="?lang=en"> Eng</a>
            <a href="?lang=zh_HK"> 繁中</a>
        </row>

</div>

<div class="history-container">
    <h2><spring:message code="index.commentHistory"/></h2>

    <h3><spring:message code="commentHist.titlePoll"/></h3>
    <c:forEach var="comment" items="${pollComments}">
        <div class="history-item">
            <div class="history-meta" data-timestamp="${comment.timestamp}"></div>
            <div><strong><spring:message code="index.polls"/>:</strong> <c:out value="${comment.poll.question}" /></div>
            <div><strong><spring:message code="material.comments"/>:</strong> <c:out value="${comment.content}" /></div>
        </div>
    </c:forEach>
    <c:if test="${empty pollComments}">
        <div class="history-item">
            <spring:message code="commentHist.messageVote"/>
        </div>
    </c:if>

    <h3><spring:message code="commentHist.titleLecture"/></h3>
    <c:forEach var="comment" items="${lectureComments}">
        <div class="history-item">
            <div class="history-meta" data-timestamp="${comment.timestamp}"></div>
            <div><strong><spring:message code="lecture"/>:</strong> <c:out value="${comment.lecture.title}" /></div>
            <div><strong><spring:message code="material.comments"/>:</strong> <c:out value="${comment.content}" /></div>
        </div>
    </c:forEach>
    <c:if test="${empty lectureComments}">
        <div class="history-item">
            <spring:message code="commentHist.messageLecture"/>
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

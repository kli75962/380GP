<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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

        button {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 10px;
        }
        button:hover {
            background-color: #2980b9;
        }
        .comment-section {
            margin-top: 40px;
        }
        .comment-form {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 5px;
            margin-bottom: 30px;
        }
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-bottom: 10px;
            min-height: 100px;
        }
        .comment {
            border-left: 3px solid #3498db;
            padding: 15px;
            margin-bottom: 20px;
            background-color: #f8f9fa;
        }
        .comment-header {
            font-weight: bold;
            margin-bottom: 10px;
            color: #2c3e50;
        }
        .comment-meta {
            font-size: 0.9em;
            color: #7f8c8d;
            margin-bottom: 5px;
        }
        .role-teacher {
            color: #e74c3c;
        }
        .role-ta {
            color: #f39c12;
        }
        .role-student {
            color: #27ae60;
        }
        .login-prompt {
            text-align: center;
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 5px;
            margin-top: 20px;
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
            <spring:message code="welcome" /> , ${user.username} | <a href="<c:url value='/logout'/>"><spring:message code="index.logout" /></a>
        </c:when>
        <c:otherwise>
            <a href="<c:url value='/login'/>">Sign In</a> | <a href="<c:url value='/register'/>"><spring:message code="index.register" /></a>
        </c:otherwise>
    </c:choose>
</div>


<div class="header">
    <h1><spring:message code="material.title"/> : ${lectureTitle}</h1>
</div>

<div class="nav">
    <a href="<c:url value='/'/>"><spring:message code="index.homepage" /></a>
    <a href="#"><spring:message code="index.lectures" /></a>
    <a href="#"><spring:message code="index.polls" /></a>
</div>

<div class="section">
    <h2><spring:message code="material.title" /></h2>
    <!-- Display download links -->
    <c:if test="${not empty materials}">
        <ul class="download-links">
            <c:forEach var="material" items="${materials}">
                <li>
                    <a href="/downloadMaterial/${material.id}">${material.fileName}</a>

                    <!-- Show delete if user is a teacher -->
                    <c:if test="${user.role == 'TEACHER'}">
                        <form method="post" action="deleteMaterial" style="display:inline;">
                            <input type="hidden" name="lectureTitle" value="${lectureTitle}" />
                            <input type="hidden" name="lectureId" value="${lectureId}" />
                            <input type="hidden" name="materialId" value="${material.id}" />
                          <button type="submit" class="delete-btn"><spring:message code="delete" /></button>
                        </form>
                    </c:if>
                </li>
            </c:forEach>

        </ul>
    </c:if>

    <div class="course-material-form" id="course-material-form">
        <form method="post" action="addMaterial" enctype="multipart/form-data">
            <input type="hidden" name="lectureTitle" value="${lectureTitle}" />
            <input type="hidden" name="lectureId" value="${lectureId}" />
            <input type="file" name="file" id="fileUpload" required />
            <button type="submit"><spring:message code="material.addMaterial" /></button>
        </form>

    </div>
    <!-- If no download links, show a message -->
    <c:if test="${empty materials}">
      <p><spring:message code="material.noLink" /></p>
    </c:if>
</div>

<div class="comment-section">
    <h2><spring:message code="material.discussion"/></h2>
    <!-- Hidden comment input box -->
    <div class="comment-form" id="comment-form">
        <form method="post" action="submitComment">
            <input type="hidden" name="lectureTitle" value="${lectureTitle}" />
            <input type="hidden" name="lectureId" value="${lectureId}" />
            <textarea name="comment" placeholder="<spring:message code="material.placeholder"
                text="Share your thoughts about this lecture..."/>">
            </textarea>
            <button type="submit"><spring:message code="submit" text="Post Comment"/></button>
        </form>
    </div>

    <h3><spring:message code="material.previous" text="Previous Comments"/></h3>
    <!-- Display comments -->
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
        <c:if test="${not empty comments}">
            <!-- Display comments with delete for owner -->
            <c:forEach var="comment" items="${comments}" varStatus="status">
                <div class="comment">
                    <div class="comment-item">
                        <div class="comment-header">
                            <span class="role-student">${comment.username}</span>
                        </div>
                        <div class="comment-meta">${formattedTimestamps[status.index]}</div>
                        <div class="comment-body">${comment.content}</div>
                        <!-- Show delete button if current user is comment owner -->
                        <c:if test="${user.role eq 'TEACHER'}">
                            <form method="post" action="deleteComment" style="display:inline;">
                                <input type="hidden" name="lectureTitle" value="${lectureTitle}" />
                                <input type="hidden" name="lectureId" value="${lectureId}" />
                                <input type="hidden" name="commentId" value="${comment.id}" />
                               <button type="submit" class="delete-btn"><spring:message code="delete"/></button>
                            </form>
                        </c:if>
                    </div>
                </div>
            </c:forEach>
        </c:if>


        <c:if test="${empty comments}">
            <p>No comments for this lecture.</p>
        </c:if>
</div>


</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Poll - COMPS 380F</title>
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
        .poll-container {
            background-color: white;
            padding: 25px;
            border-radius: 5px;
            margin-bottom: 30px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .poll-question {
            font-size: 1.3em;
            color: #2c3e50;
            margin-bottom: 20px;
            font-weight: 600;
        }
        .poll-option {
            display: block;
            margin: 15px 0;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            background-color: #f8f9fa;
            cursor: pointer;
            transition: all 0.3s;
        }
            .poll-option {
                display: block;
                margin: 15px 0;
                padding: 12px;
                border: 1px solid #ddd;
                border-radius: 4px;
                background-color: #f8f9fa;
                cursor: pointer;
                transition: all 0.3s;
            }

            .poll-option:hover {
                background-color: #e1f0fa;
                border-color: #3498db;
            }

            .poll-option.selected {
                background-color: #e1f0fa;
                border-left: 4px solid #3498db;
                font-weight: 600;
            }
        .vote-count {
            font-size: 0.9em;
            color: #7f8c8d;
            margin-top: 5px;
        }
        .poll-actions {
            margin-top: 20px;
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
    </style>
</head>
<body>
    <div class="header">
        <h1><spring:message code="title" /></h1>
    </div>

    <div class="nav">
        <!------------- Head ------------------------------- Head --------------------------------- Head ----------------------------------------------->
        <a href="<c:url value='/'/>" class="nav-link"><spring:message code="index.homepage" /></a>

        <c:if test="${not empty user}">
            <a href="<c:url value='/commenthistory'/>" class="nav-link"><spring:message code="index.commentHistory" /></a>
        </c:if>

        <c:if test="${not empty user}">
            <a href="<c:url value='/votinghistory'/>" class="nav-link"><spring:message code="index.pollsHistory" /></a>
        </c:if>
        <!--------origin/main----------->
        <c:if test="${not empty user && user.role eq 'TEACHER'}">
            <a href="<c:url value='/userManagement'/>" class="nav-link"><spring:message code="admin.title" /></a>
        </c:if>

    </div>

    <div class="poll-container">
        <div class="poll-question">${poll.question}</div>
        
        <form action="<c:url value='/polls/vote'/>" method="post">
            <input type="hidden" name="pollId" value="${poll.id}" />
            <c:forEach var="entry" items="${poll.options}">
                <div class="poll-option ${userVoteOptionId eq entry.key ? 'selected' : ''}">
                    <input type="radio" name="optionId" value="${entry.key}" id="option${entry.key}" 
                           ${userVoteOptionId eq entry.key ? 'checked' : ''} required>
                    <label for="option${entry.key}">${entry.value.optionText}</label>
                    <div class="vote-count"><spring:message code="vote" text="votes"/>: ${entry.value.voteCount} </div>
                </div>
            </c:forEach>
            <div class="poll-actions">
                <button type="submit">
                    <c:choose>
                        <c:when test="${userVoteOptionId != null}">
                            <spring:message code="poll.changeVote" text="Change Vote"/>
                        </c:when>
                        <c:otherwise>
                            <spring:message code="poll.submitVote" text="Submit Vote"/>
                        </c:otherwise>
                    </c:choose>
                </button>
            </div>
        </form>
    </div>

    <div class="comment-section">
        <h2><spring:message code="material.discussion" text="Discussion"/></h2>
        
        <c:if test="${not empty user}">
            <div class="comment-form">
                <form action="<c:url value='/polls/PollComment'/>" method="post">
                    <input type="hidden" name="pollId" value="${poll.id}">
                    <textarea name="comment" placeholder="<spring:message code="poll.placeholder"/>"></textarea>
                    <div>
                        <button type="submit"><spring:message code="submit" text="Post Comment"/></button>
                    </div>
                </form>
            </div>
        </c:if>

        <h3><spring:message code="material.previous" text="Previous Comments"/></h3>

        <div class="comments-section">
            <c:forEach var="comment" items="${poll.comments}" varStatus="status">
                <c:if test="${status.index % 5 == 0}">
                    <div class="comment">
                        <div class="comment-header">
                    <span class="comment-user role-${comment.userRole.toLowerCase()}">
                        ${comment.userName} (${comment.userRole})
                    </span>
                            <br>
                            <span class="comment-meta" data-timestamp="${comment.timestamp}"></span>
                        </div>
                        <div class="comment-body">${comment.content}</div>
                        <c:if test="${user.role eq 'TEACHER'}">
                            <form method="post" action="deletePollComment" style="display:inline;">
                                <input type="hidden" name="commentId" value="${comment.id}">
                                <input type="hidden" name="pollId" value="${poll.id}">
                                <button type="submit" class="delete-btn" onclick="return confirm('Are you sure you want to delete this comment?')">
                                    <spring:message code="delete"/>
                                </button>
                            </form>
                        </c:if>
                    </div>
                </c:if>
            </c:forEach>
        </div>

    </div>
</body>
</html>

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
        document.querySelectorAll('.comment-meta').forEach(el => {
            const timestamp = el.getAttribute('data-timestamp');
            if (timestamp) {
                el.textContent = formatDateTime(timestamp);
            }
        });
    });

    document.querySelectorAll('.poll-option').forEach(option => {
        option.addEventListener('click', function() {
            document.querySelectorAll('.poll-option').forEach(o => o.classList.remove('selected'));
            this.classList.add('selected');
        });
    });
</script>
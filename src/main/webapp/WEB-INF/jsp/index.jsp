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
            display: flex;
            justify-content: space-between;
            align-items: center;
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
        .username-link {
            font-weight: bold;
            color: #3498db;
            text-decoration: none;
        }
        .username-link:hover {
            text-decoration: underline;
        }
        .nav-link {
            margin-right: 15px;
            text-decoration: none;
            color: #333;
        }
        .nav-link:hover {
            text-decoration: underline;
        }
        /* 添加按钮样式 */
        .action-btn {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 0.9em;
            transition: all 0.3s ease;
            margin-bottom: 10px;
        }

        .action-btn:hover {
            background-color: #2980b9;
            transform: translateY(-1px);
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .delete-btn {
            background-color: #e74c3c;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 0.9em;
            transition: all 0.3s ease;
        }

        .delete-btn:hover {
            background-color: #c0392b;
            transform: translateY(-1px);
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group input {
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            width: 100%;
            box-sizing: border-box;
        }

        .form-group input:focus {
            outline: none;
            border-color: #3498db;
            box-shadow: 0 0 5px rgba(52,152,219,0.3);
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #2c3e50;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.4);
        }

        .modal-content {
            background-color: #fefefe;
            margin: 10% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 50%;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            position: relative;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
            position: absolute;
            right: 20px;
            top: 10px;
        }

        .close:hover {
            color: black;
        }

        .item-content {
            flex-grow: 1;
        }
    </style>
</head>
<body>
<div class="login-status">
    <c:choose>
        <c:when test="${not empty user}">
            <spring:message code="welcome"/>, <a href="<c:url value='/userEdit'/>" class="username-link">${user.username}</a> | <a href="<c:url value='/logout'/>"><spring:message code="index.logout" /></a>
        </c:when>
        <c:otherwise>
            <a href="<c:url value='/login'/>"><spring:message code="signIn" /></a> | <a href="<c:url value='/register'/>"><spring:message code="index.register" /></a>
        </c:otherwise>
    </c:choose>
</div>

<div class="header">
    <h1><spring:message code="title" /></h1>
    <div class="course-code">COMP 3820SEF / S380F / S380W</div>
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


    <row style="right: 0">
        <a> <spring:message code="index.language" /> : </a>
        <a href="?lang=en"> Eng</a>
        <a href="?lang=zh_HK"> 繁中</a>
    </row>

</div>

<div class="section">
    <h2><spring:message code="index.lectures" /></h2>

    <c:if test="${user.role eq 'TEACHER'}">
        <button class="action-btn" onclick="toggleLectureInput()"><spring:message code="addNew" /></button>
    </c:if>

    <ul class="lecture-list">
        <c:forEach var="lecture" items="${lectures}">
            <li class="lecture-item">
                <div class="item-content">
                    <c:choose>
                    <c:when test="${not empty user}">
                    <a href="<c:url value='/courseMaterial?title=${lecture.title}&id=${lecture.id}'/>">
                        </c:when>
                        <c:otherwise>
                        <a href="#" onclick="alertLoginRequired(event);">
                            </c:otherwise>
                            </c:choose>
                            <div class="lecture-title">${lecture.title}</div>
                        </a>

                </div>
                <c:if test="${user.role eq 'TEACHER'}">
                    <form action="<c:url value='/deleteLecture'/>" method="post" style="display:inline;">
                        <input type="hidden" name="lectureId" value="${lecture.id}" />
                        <button type="submit" class="delete-btn" onclick="return confirm('Are you sure you want to delete this lecture?')">
                            <spring:message code="delete"/>
                        </button>
                    </form>
                </c:if>
            </li>
        </c:forEach>
    </ul>

</div>


<div class="section">
    <h2><spring:message code="index.currentPools" /></h2>

    <c:if test="${user.role eq 'TEACHER'}">
        <button class="action-btn" onclick="togglePollInput()"><spring:message code="addNew" /></button>
    </c:if>

    <ul class="poll-list">
        <c:forEach var="poll" items="${polls}">
            <li class="poll-item">
                <div class="item-content">
                    <c:choose>
                    <c:when test="${not empty user}">
                    <a href="<c:url value='/polls/${poll.id}'/>">
                        </c:when>
                        <c:otherwise>
                        <a href="#" onclick="alertLoginRequired(event);">
                            </c:otherwise>
                            </c:choose>

                            <div class="poll-question">${poll.question}</div>
                            <div class="poll-status">
                                <spring:message code="index.voteUntil" />:
                                <span class="comment-meta" data-timestamp="${poll.endDate}"></span>
                            </div>
                        </a>
                </div>
                <c:if test="${user.role eq 'TEACHER'}">
                    <form action="<c:url value='/polls/delete'/>" method="post" style="display:inline;">
                        <input type="hidden" name="pollId" value="${poll.id}" />
                        <button type="submit" class="delete-btn" onclick="return confirm('Are you sure you want to delete this poll?')">
                            <spring:message code="delete"/>
                        </button>
                    </form>
                </c:if>
            </li>
        </c:forEach>
    </ul>
</div>

<div id="lectureModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal('lectureModal')">&times;</span>
        <h2><spring:message code="addNew" /></h2>
        <form action="<c:url value='/addLecture'/>" method="post">
            <div class="form-group">
                <input type="text" name="title" placeholder="Enter lecture title" required />
            </div>
            <button type="submit" class="action-btn"><spring:message code="submit" /></button>
        </form>
    </div>
</div>

<div id="pollModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal('pollModal')">&times;</span>
        <h2><spring:message code="addNew" /></h2>
        <form action="<c:url value='/polls/add'/>" method="post">
            <div class="form-group">
                <input type="text" name="question" placeholder="Enter poll question" required />
            </div>
            <div class="form-group">
                <input type="text" name="option1" placeholder="Option 1" required />
                <input type="text" name="option2" placeholder="Option 2" required />
                <input type="text" name="option3" placeholder="Option 3" required />
                <input type="text" name="option4" placeholder="Option 4" required />
            </div>
            <div class="form-group">
                <label for="endDate"><spring:message code="endDate" />:</label>
                <input type="datetime-local" name="endDate" id="endDate" required />
            </div>
            <button type="submit" class="action-btn"><spring:message code="submit" /></button>
        </form>
    </div>
</div>

</body>
<script>
    function alertLoginRequired(event) {
        event.preventDefault();
        alert("You need to login to poll.");
    }
    function toggleLectureInput() {
        const modal = document.getElementById('lectureModal');
        modal.style.display = 'block';
        modal.style.position = 'fixed';
        modal.style.top = '0';
        modal.style.left = '0';
    }

    function togglePollInput() {
        const modal = document.getElementById('pollModal');
        modal.style.display = 'block';
        modal.style.position = 'fixed';
        modal.style.top = '0';
        modal.style.left = '0';
    }

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

    function closeModal(modalId) {
        const modal = document.getElementById(modalId);
        modal.style.display = 'none';
    }

    window.onclick = function(event) {
        if (event.target.className === 'modal') {
            event.target.style.display = 'none';
        }
    }
</script>

</html>
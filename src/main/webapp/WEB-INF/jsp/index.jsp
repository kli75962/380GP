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
        <!----- course material and polls <a> tag does not work ------->
        <a href="<c:url value='/courseMaterials'/>" class="nav-link"><spring:message code="index.courseMaterial" /></a>
        <a href="<c:url value='/polls'/>" class="nav-link"><spring:message code="index.polls" /></a>

        <c:if test="${not empty user}">
            <a href="<c:url value='/commenthistory'/>" class="nav-link"><spring:message code="index.commentHistory" /></a>
        </c:if>

        <c:if test="${not empty user}">
            <a href="<c:url value='/votinghistory'/>" class="nav-link"><spring:message code="index.pollsHistory" /></a>
        </c:if>

<!--------origin/main----------->
        <c:if test="${not empty user && user.role eq 'TEACHER'}">
            <a href="<c:url value='/userManagement'/>" class="nav-link">User Management</a>
        </c:if>
        
        <c:if test="${empty user}">
             <a href="<c:url value='/login'/>" class="nav-link"><spring:message code="index.login" /></a>
            <a href="<c:url value='/register'/>" class="nav-link"><spring:message code="index.register" /></a>
        </c:if>
        <c:if test="${not empty user}">
           <a href="<c:url value='/logout'/>" class="nav-link"><spring:message code="index.logout" /></a>
        </c:if>
        //for choosing eng or 繁中
        <row style="right: 0">
            <a> <spring:message code="index.language" /> : </a>
            <a href="?lang=en"> Eng</a>
            <a href="?lang=zh_HK"> 繁中</a>
        </row>

    </div>

    <div class="section">
       <h2><spring:message code="index.lectures" /></h2>

        <c:if test="${user.role eq 'TEACHER'}">
            <button onclick="toggleLectureInput()"><spring:message code="addNew" /></button>
            <form id="lectureForm" action="<c:url value='/addLecture'/>" method="post" style="display: none; margin-top: 5px;">
                <input type="text" name="title" placeholder="Enter lecture title" required />
                <button type="submit" style="margin-left: 10px; color: red;"><spring:message code="delete" /></button>
            </form>
        </c:if>

        <ul class="lecture-list">
            <c:forEach var="lecture" items="${lectures}">
                <li class="lecture-item">
                    <a href="<c:url value='/courseMaterial?title=${lecture.title}&id=${lecture.id}'/>">
                        <div class="lecture-title">${lecture.title}</div>
                    </a>

                    <c:if test="${user.role eq 'TEACHER'}">
                        <form action="<c:url value='/deleteLecture'/>" method="post" style="display:inline;">
                            <input type="hidden" name="lectureId" value="${lecture.id}" />
                            <button type="submit" style="margin-left: 10px; color: red;"><spring:message code="delete" /></button>
                        </form>
                    </c:if>
                </li>
            </c:forEach>
        </ul>

    </div>


    <div class="section">
        <h2><spring:message code="index.currentPools" /></h2>

        <c:if test="${user.role eq 'TEACHER'}">
            <button onclick="togglePollInput()"><spring:message code="addNew" /></button>
            <form id="pollForm" action="<c:url value='/polls/add'/>" method="post" style="display: none; margin-top: 5px;">
                <div class="form-group">
                    <input type="text" name="question" placeholder="Enter poll question" required style="width: 100%; margin-bottom: 10px;"/>
                </div>
                <div class="form-group">
                    <input type="text" name="option1" placeholder="Option 1" required style="width: 100%; margin-bottom: 5px;"/>
                    <input type="text" name="option2" placeholder="Option 2" required style="width: 100%; margin-bottom: 5px;"/>
                    <input type="text" name="option3" placeholder="Option 3" required style="width: 100%; margin-bottom: 5px;"/>
                    <input type="text" name="option4" placeholder="Option 4" required style="width: 100%; margin-bottom: 10px;"/>
                </div>
                <div class="form-group">
                    <label for="endDate"><spring:message code="endDate" />:</label>
                    <input type="datetime-local" name="endDate" id="endDate" required style="width: 100%; margin-bottom: 10px;"/>
                </div>
                <button type="submit"><spring:message code="submit" /></button>
            </form>
        </c:if>

        <ul class="poll-list">
            <c:forEach var="poll" items="${polls}">
                <li class="poll-item">
                    <a href="<c:url value='/polls/${poll.id}'/>">
                        <div class="poll-question">${poll.question}</div>
                       <div class="poll-status"><spring:message code="index.voteUntil" />: ${poll.endDate}</div>
                    </a>

                    <c:if test="${user.role eq 'TEACHER'}">
                        <form action="<c:url value='/polls/delete'/>" method="post" style="display:inline;">
                            <input type="hidden" name="pollId" value="${poll.id}" />
                             <button type="submit" style="margin-left: 10px; color: red;"><spring:message code="delete" /></button>
                        </form>
                    </c:if>
                </li>
            </c:forEach>
        </ul>
    </div>
</body>
<script>
    function toggleLectureInput() {
        const form = document.getElementById('lectureForm');
        form.style.display = (form.style.display === 'none' || form.style.display === '') ? 'block' : 'none';
    }

    function togglePollInput() {
        const form = document.getElementById('pollForm');
        form.style.display = (form.style.display === 'none' || form.style.display === '') ? 'block' : 'none';
    }
    
</script>

</html>

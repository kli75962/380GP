<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Profile</title>
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
        .profile-container {
            background-color: white;
            padding: 25px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #2c3e50;
        }
        input[type="text"],
        input[type="email"],
        input[type="tel"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            box-sizing: border-box;
        }
        input:focus {
            border-color: #3498db;
            outline: none;
            box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.2);
        }
        .form-row {
            display: flex;
            gap: 15px;
        }
        .form-row .form-group {
            flex: 1;
        }
        .btn {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #2980b9;
        }
        .btn-danger {
            background-color: #e74c3c;
        }
        .btn-danger:hover {
            background-color: #c0392b;
        }
        .alert {
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 4px;
        }
        .alert-success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        .alert-danger {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1> <spring:message code="edit.title"/></h1>
    </div>

    <div class="nav">
        <a href="<c:url value='/'/>"> <spring:message code="index.homepage"/></a>

    </div>

    <div class="profile-container">
        <c:if test="${not empty successMessage}">
            <div class="alert alert-success">
                ${successMessage}
            </div>
        </c:if>
        
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger">
                ${errorMessage}
            </div>
        </c:if>
        
        <form action="/updateProfile" method="post">
            <div class="form-row">
                <div class="form-group">
                    <label for="firstName"><spring:message code="firstName"/></label>
                    <input type="text" id="firstName" name="firstName" value="${user.name.split(' ')[0]}" required>
                </div>
                <div class="form-group">
                    <label for="lastName"><spring:message code="lastName"/></label>
                    <input type="text" id="lastName" name="lastName" value="${user.name.split(' ')[1]}" required>
                </div>
            </div>

            <div class="form-group">
                <label for="email"><spring:message code="register.email"/></label>
                <input type="email" id="email" name="email" value="${user.email}" required>
            </div>

            <div class="form-group">
                <label for="phone"><spring:message code="register.phone"/></label>
                <input type="tel" id="phone" name="phone" value="${user.phoneNumber}">
            </div>

            <div class="form-group">
                <label for="password"><spring:message code="newPassword"/> </label>
                <input type="password" id="password" name="password">
                <span class="password-toggle" onclick="togglePasswordVisibility('password')">👁️</span>

            </div>

            <div class="form-group">
                <label for="confirmPassword"><spring:message code="confirm"/></label>
                <input type="password" id="confirmPassword" name="confirmPassword">
                <span class="password-toggle" onclick="togglePasswordVisibility('confirmPassword')">👁️</span>
            </div>

            <button type="submit" class="btn"><spring:message code="save"/></button>
        </form>
    </div>

     <script>
        function togglePasswordVisibility(inputId) {
            const passwordInput = document.getElementById(inputId);
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
            } else {
                passwordInput.type = 'password';
            }
        }
        
    </script>
</body>
</html>
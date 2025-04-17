<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign In - Course Portal</title>
        <style>
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
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                line-height: 1.6;
                color: #333;
                max-width: 900px;
                margin: 0 auto;
                padding: 20px;
                background-color: #f5f8fa;
            }

            .login-container {
                background-color: #ffff;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                max-width: 500px;
                margin: 50px auto;
            }

            h1 {
                color: #2c3e50;
                border-bottom: 2px solid #3498db;
                padding-bottom: 10px;
                text-align: center;
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
            input[type="password"],
            input[type="email"] {
                width: 100%;
                padding: 12px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 16px;
                box-sizing: border-box;
            }

            input[type="text"]:focus,
            input[type="password"]:focus,
            input[type="email"]:focus {
                border-color: #3498db;
                outline: none;
                box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.2);
            }

            .login-btn {
                background-color: #3498db;
                color: white;
                border: none;
                padding: 12px 20px;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                width: 100%;
                transition: background-color 0.3s;
            }

            .login-btn:hover {
                background-color: #2980b9;
            }

            .secondary-actions {
                display: flex;
                justify-content: space-between;
                margin-top: 15px;
                font-size: 14px;
            }

            .secondary-actions a {
                color: #3498db;
                text-decoration: none;
            }

            .secondary-actions a:hover {
                text-decoration: underline;
            }

            .role-selector {
                margin-bottom: 20px;
            }

            .role-options {
                display: flex;
                gap: 15px;
            }

            .role-option {
                flex: 1;
            }

            .role-option input {
                display: none;
            }

            .role-option label {
                display: block;
                padding: 10px;
                text-align: center;
                border: 1px solid #ddd;
                border-radius: 4px;
                cursor: pointer;
                transition: all 0.3s;
            }

            .role-option input:checked+label {
                border-color: #3498db;
                background-color: #e1f0fa;
                font-weight: bold;
            }

            .divider {
                text-align: center;
                margin: 25px 0;
                position: relative;
                color: #7f8c8d;
            }

            .divider::before {
                content: "";
                position: absolute;
                top: 50%;
                left: 0;
                right: 0;
                height: 1px;
                background-color: #ddd;
                z-index: -1;
            }

            .divider span {
                background-color: white;
                padding: 0 15px;
            }
        </style>
        <script>
            function showForgotPasswordAlert() {
                alert("Please contact the IT Department at it-support@university.edu or call (123) 456-7890 for password assistance.");
                return false;
            }
        </script>
    </head>

    <body>

        <div class="nav">
            <a href="<c:url value='/'/>"><spring:message code="index.homepage"/></a>
        </div>

        <div class="login-container">
            <h1><spring:message code="signin.message"/></h1>

            <c:if test="${not empty error}">
                <div class="error-message" style="color: #e74c3c; margin-bottom: 15px; text-align: center;">
                    ${error}
                </div>
            </c:if>

            <form action="<c:url value='/loginAc'/>" method="post">
                <div class="form-group">
                    <label for="email"><spring:message code="register.email"/></label>
                    <input type="email" id="email" name="email" required placeholder="your.email@university.edu">
                </div>

                <div class="form-group">
                    <label for="password"><spring:message code="password"/></label>
                    <input type="password" id="password" name="password" required placeholder="Enter your password">
                </div>

                <button type="submit" class="login-btn"><spring:message code="signin"/></button>

                <div class="secondary-actions">
                    <a href="#" onclick="return showForgotPasswordAlert()"><spring:message code="forget"/></a>
                    <a href="<c:url value='/register'/>"><spring:message code="createAccount"/></a>
                </div>

                <div class="divider">
                    <span>or</span>
                </div>

                <button type="button" class="login-btn" style="background-color: #4285F4;">
                    <spring:message code="signin.message2"/>
                </button>
            </form>
        </div>
    </body>

    </html>
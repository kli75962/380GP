<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><spring:message code="register.title"/></title>
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
        .register-container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            margin: 30px auto;
        }
        h1 {
            color: #2c3e50;
            border-bottom: 2px solid #3498db;
            padding-bottom: 10px;
            text-align: center;
            margin-bottom: 25px;
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
        input[type="email"],
        input[type="tel"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            box-sizing: border-box;
        }
        input[type="text"]:focus,
        input[type="password"]:focus,
        input[type="email"]:focus,
        input[type="tel"]:focus {
            border-color: #3498db;
            outline: none;
            box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.2);
        }
        .password-requirements {
            font-size: 0.85em;
            color: #7f8c8d;
            margin-top: 5px;
        }
        .register-btn {
            background-color: #27ae60;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            transition: background-color 0.3s;
            margin-top: 10px;
        }
        .register-btn:hover {
            background-color: #219653;
        }
        .login-link {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
        }
        .login-link a {
            color: #3498db;
            text-decoration: none;
        }
        .login-link a:hover {
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
        .role-option input:checked + label {
            border-color: #3498db;
            background-color: #e1f0fa;
            font-weight: bold;
        }
        .error {
            color: #e74c3c;
            font-size: 0.85em;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <div class="nav">
        <a href="<c:url value='/'/>"><spring:message code="index.homepage"/></a>
        <a href="<c:url value='/login'/>"><spring:message code="signIn"/></a>
    </div>

    <div class="register-container">
        <h1><spring:message code="register.create" text="Create Your Account"/>t</h1>
        
        <%--@elvariable id="user" type=""--%>
        <form:form action="${pageContext.request.contextPath}/register" method="post" modelAttribute="user">
            <div class="form-group">
                <form:label path="username"><spring:message code="register.username"/></form:label>
                <form:input path="username" type="text" placeholder="keithlee123"/>
                <form:errors path="username" cssClass="error"/>
            </div>
            
            <div class="form-group">
                <form:label path="name"><spring:message code="register.fullName"/></form:label>
                <form:input path="name" type="text" placeholder="Keith Lee"/>
                <form:errors path="name" cssClass="error"/>
            </div>
            
            <div class="form-group">
                <form:label path="email"><spring:message code="register.email"/></form:label>
                <form:input path="email" type="email" placeholder="keithlee@live.hkmu.edu.hk"/>
                <form:errors path="email" cssClass="error"/>
            </div>
            
            <div class="form-group">
                <form:label path="phoneNumber"><spring:message code="register.phone"/></form:label>
                <form:input path="phoneNumber" type="tel" placeholder="27112100"/>
                <form:errors path="phoneNumber" cssClass="error"/>
            </div>
            
            <div class="form-group">
                <form:label path="password"><spring:message code="password"/></form:label>
                <form:password path="password" placeholder="********"/>
                <div class="password-requirements">
                    <spring:message code="register.requirment"/>
                </div>
                <form:errors path="password" cssClass="error"/>
            </div>
            
            <div class="form-group role-selector">
                <form:hidden path="role" value="student"/>
            </div>
            
            <button type="submit" class="register-btn"><spring:message code="createAccount"/></button>
            
            <div class="login-link">
                <spring:message code="register.message"/><a href="<c:url value='/login'/>"><spring:message code="register.signinHere"/>
            </div>
        </form:form>
    </div>
</body>
</html>

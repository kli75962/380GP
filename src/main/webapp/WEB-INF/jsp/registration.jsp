<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Course Portal</title>
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
        <a href="<c:url value='/'/>">Home</a>
        <a href="<c:url value='/login'/>">Sign In</a>
    </div>

    <div class="register-container">
        <h1>Create Your Account</h1>
        
        <form:form action="${pageContext.request.contextPath}/register" method="post" modelAttribute="user">
            <div class="form-group">
                <form:label path="username">Username</form:label>
                <form:input path="username" type="text" placeholder="keithlee123"/>
                <form:errors path="username" cssClass="error"/>
            </div>
            
            <div class="form-group">
                <form:label path="name">Full Name</form:label>
                <form:input path="name" type="text" placeholder="Keith Lee"/>
                <form:errors path="name" cssClass="error"/>
            </div>
            
            <div class="form-group">
                <form:label path="email">Email Address</form:label>
                <form:input path="email" type="email" placeholder="keithlee@live.hkmu.edu.hk"/>
                <form:errors path="email" cssClass="error"/>
            </div>
            
            <div class="form-group">
                <form:label path="phone">Phone Number</form:label>
                <form:input path="phone" type="tel" placeholder="27112100"/>
                <form:errors path="phone" cssClass="error"/>
            </div>
            
            <div class="form-group">
                <form:label path="password">Password</form:label>
                <form:password path="password" placeholder="********"/>
                <div class="password-requirements">
                    Must be at least 8 characters with one number and one special character
                </div>
                <form:errors path="password" cssClass="error"/>
            </div>
            
            <div class="form-group role-selector">
                <label>I am a:</label>
                <div class="role-options">
                    <div class="role-option">
                        <form:radiobutton path="role" value="student" id="student"/>
                        <label for="student">Student</label>
                    </div>
                    <div class="role-option">
                        <form:radiobutton path="role" value="teacher" id="teacher"/>
                        <label for="teacher">Teacher</label>
                    </div>
                    <div class="role-option">
                        <form:radiobutton path="role" value="admin" id="admin"/>
                        <label for="admin">Admin</label>
                    </div>
                </div>
                <form:errors path="role" cssClass="error"/>
            </div>
            
            <button type="submit" class="register-btn">Create Account</button>
            
            <div class="login-link">
                Already have an account? <a href="<c:url value='/login'/>">Sign in here</a>
            </div>
        </form:form>
    </div>
</body>
</html>
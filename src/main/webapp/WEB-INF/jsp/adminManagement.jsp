<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management</title>
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
        .management-container {
            background-color: white;
            padding: 25px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .action-bar {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .search-bar {
            display: flex;
            gap: 10px;
        }
        input[type="text"] {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }
        .btn {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #2980b9;
        }
        .btn-success {
            background-color: #27ae60;
        }
        .btn-success:hover {
            background-color: #219653;
        }
        .btn-danger {
            background-color: #e74c3c;
        }
        .btn-danger:hover {
            background-color: #c0392b;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f8f9fa;
            font-weight: 600;
            color: #2c3e50;
        }
        tr:hover {
            background-color: #f1f7fd;
        }
        .role-badge {
            display: inline-block;
            padding: 3px 8px;
            border-radius: 12px;
            font-size: 0.8em;
            font-weight: 600;
        }
        .role-teacher {
            background-color: #fde8e8;
            color: #e74c3c;
        }
        .role-student {
            background-color: #e8f5e9;
            color: #27ae60;
        }
        .role-admin {
            background-color: #e8eaf6;
            color: #3f51b5;
        }
        .action-icons {
            display: flex;
            gap: 10px;
        }
        .action-icons a {
            color: #3498db;
            text-decoration: none;
        }
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.4);
        }
        .modal-content {
            background-color: white;
            margin: 10% auto;
            padding: 20px;
            border-radius: 5px;
            width: 50%;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: 600;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .modal-footer {
            text-align: right;
            margin-top: 20px;
            text-align: right;
        }
        .alert {
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid transparent;
            border-radius: 4px;
        }
        .alert-success {
            color: #3c763d;
            background-color: #dff0d8;
            border-color: #d6e9c6;
        }
        .alert-danger {
            color: #a94442;
            background-color: #f2dede;
            border-color: #ebccd1;
        }
        .user-role {
            padding: 3px 8px;
            border-radius: 3px;
            font-size: 12px;
        }
        .role-admin {
            background-color: #337ab7;
            color: white;
        }
        .role-student {
            background-color: #5cb85c;
            color: white;
        }
        .action-icons {
            display: flex;
            gap: 10px;
        }
        .action-icons i {
            cursor: pointer;
        }
        .search-bar {
            margin-bottom: 20px;
        }
        .search-bar input {
            padding: 8px;
            width: 300px;
        }
        .password-container {
            position: relative;
            display: flex;
        }
        .password-container input {
            flex: 1;
        }
        .password-toggle {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #666;
        }
        .password-toggle:hover {
            color: #333;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1><spring:message code="admin.title" text="User Management"/></h1>
    </div>

    <div class="nav">
        <a href="<c:url value='/'/>" class="nav-link"><spring:message code="index.homepage" /></a>
        <a href="<c:url value='/commenthistory'/>" class="nav-link"><spring:message code="index.commentHistory" /></a>
        <a href="<c:url value='/votinghistory'/>" class="nav-link"><spring:message code="index.pollsHistory" /></a>
        <c:if test="${not empty user && user.role eq 'TEACHER'}">
            <a href="<c:url value='/userManagement'/>" class="nav-link"><spring:message code="admin.title"/></a>
        </c:if>
        <row style="right: 0">
            <a> <spring:message code="index.language" /> : </a>
            <a href="?lang=en"> Eng</a>
            <a href="?lang=zh_HK"> 繁中</a>
        </row>
    </div>

    <div class="management-container">
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

        <div class="action-bar">
            <div class="search-bar">
                <input type="text" id="searchInput" placeholder=" <spring:message code="search"/>">
            </div>
            <button class="btn btn-success" onclick="openModal('addUserModal')"><spring:message code="admin.add"/></button>
        </div>

        <table>
            <thead>
                <tr>
                    <th><spring:message code="register.username" /></th>
                    <th><spring:message code="admin.name"/></th>
                    <th><spring:message code="register.email"/></th>
                    <th><spring:message code="register.phone" /></th>
                    <th><spring:message code="admin.role" /></th>
                    <th><spring:message code="admin.action" /></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${users}" var="user">
                    <tr>
                        <td>${user.username}</td>
                        <td>${user.name}</td>
                        <td>${user.email}</td>
                        <td>${user.phoneNumber}</td>
                        <td>
                            <span class="user-role role-${user.role.toLowerCase()}">
                                 <c:choose >
                                     <c:when test="${user.role == 'ADMIN'}">
                                       <spring:message code="admin.admin"/>
                                     </c:when>
                                     <c:otherwise>
                                         <spring:message code="admin.student"/>
                                     </c:otherwise>
                                 </c:choose>
                            </span>
                        </td>
                        <td class="action-icons">
                            <i onclick="openEditModal('${user.id}', '${user.username}', '${user.name}', '${user.email}', '${user.phoneNumber}', '${user.role}')" style="color: #3498db"><spring:message code="edit"/></i>
                            <i onclick="confirmDelete('${user.id}', '${user.username}')" style="color: #e74c3c"><spring:message code="delete"/></i>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <div id="addUserModal" class="modal">
        <div class="modal-content">
            <h2><spring:message code="admin.add"/></h2>
            <form id="addUserForm" action="<c:url value='/userManagement/add'/>" method="post">
                <div class="form-group">
                    <label for="newUsername"><spring:message code="register.username"/></label>
                    <input type="text" id="newUsername" name="username" required>
                </div>
                <div class="form-group">
                    <label for="newPassword"><spring:message code="password"/></label>
                    <div class="password-container">
                        <input type="password" id="newPassword" name="password" required>
                        <span class="password-toggle" onclick="togglePasswordVisibility('newPassword')">👁️</span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="newName"><spring:message code="register.fullName"/></label>
                    <input type="text" id="newName" name="name" required>
                </div>
                <div class="form-group">
                    <label for="newEmail"><spring:message code="register.email"/></label>
                    <input type="email" id="newEmail" name="email" required>
                </div>
                <div class="form-group">
                    <label for="newPhone"><spring:message code="register.phone"/></label>
                    <input type="text" id="newPhone" name="phone">
                </div>
                <div class="form-group">
                    <label for="newRole"><spring:message code="admin.role"/></label>
                    <input type="text" id="newRole" name="role" value="<spring:message code="admin.student"/>" readonly>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn" onclick="closeModal('addUserModal')"><spring:message code="cancel"/></button>
                    <button type="submit" class="btn btn-success"><spring:message code="admin.add"/></button>
                </div>
            </form>
        </div>
    </div>

    <div id="editUserModal" class="modal">
        <div class="modal-content">
            <h2><spring:message code="admin.editUser"/></h2>
            <form id="editUserForm" action="<c:url value='/userManagement/update'/>" method="post">
                <input type="hidden" id="editUserId" name="id">
                <div class="form-group">
                    <label for="editUsername"><spring:message code="register.username"/></label>
                    <input type="text" id="editUsername" readonly>
                </div>
                <div class="form-group">
                    <label for="editName"><spring:message code="register.fullName"/></label>
                    <input type="text" id="editName" name="name" required>
                </div>
                <div class="form-group">
                    <label for="editEmail"><spring:message code="register.email"/></label>
                    <input type="email" id="editEmail" name="email" required>
                </div>
                <div class="form-group">
                    <label for="editPhone"><spring:message code="register.phone"/></label>
                    <input type="text" id="editPhone" name="phone">
                </div>
                <div class="form-group">
                    <label for="editRole"><spring:message code="admin.role"/></label>
                    <input type="text" id="editRole" name="role" value="STUDENT" readonly>
                </div>
                <div class="form-group">
                        <label><spring:message code="resetPassword"/></label>
                        <input  type="checkbox" id="resetPassword" name="resetPassword"/>
                </div>
                <div class="form-group" id="newPasswordGroup" style="display: none;">
                    <label for="nPassword"><spring:message code="admin.newPassword"/></label>
                    <div class="password-container">
                        <input type="password" id="nPassword" name="newPassword">
                        <span class="password-toggle" onclick="togglePasswordVisibility('nPassword')">👁️</span>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn" onclick="closeModal('editUserModal')"><spring:message code="cancel"/></button>
                    <button type="submit" class="btn"><spring:message code="save"/></button>
                </div>
            </form>
        </div>
    </div>

    <div id="deleteModal" class="modal">
        <div class="modal-content">
            <h2><spring:message code="admin.confirmDelete"/></h2>
            <p><spring:message code="admin.deleteMessage"/>: <span id="deleteUsername"></span>?</p>
            <div class="modal-footer">
                <button class="btn" onclick="closeModal('deleteModal')"><spring:message code="cancel"/></button>
                <form id="deleteForm" action="<c:url value='/userManagement/delete'/>" method="post" style="display: inline;">
                    <input type="hidden" id="deleteUserId" name="id">
                    <button type="submit" class="btn btn-danger"><spring:message code="delete"/></button>
                </form>
            </div>
        </div>
    </div>

    <script>
        function openModal(modalId) {
            document.getElementById(modalId).style.display = "block";
        }
        
        function closeModal(modalId) {
            document.getElementById(modalId).style.display = "none";
        }
        
        function openEditModal(id, username, name, email, phone, role) {
            document.getElementById('editUserId').value = id;
            document.getElementById('editUsername').value = username;
            document.getElementById('editName').value = name;
            document.getElementById('editEmail').value = email;
            document.getElementById('editPhone').value = phone;
            document.getElementById('editRole').value = role;
            openModal('editUserModal');
        }
        
        function confirmDelete(id, username) {
            document.getElementById('deleteUserId').value = id;
            document.getElementById('deleteUsername').textContent = username;
            openModal('deleteModal');
        }

        document.getElementById('searchInput').addEventListener('keyup', function() {
            const searchText = this.value.toLowerCase();
            const tableRows = document.querySelectorAll('tbody tr');
            
            tableRows.forEach(row => {
                const text = row.textContent.toLowerCase();
                row.style.display = text.includes(searchText) ? '' : 'none';
            });
        });
        

        document.getElementById('resetPassword').addEventListener('change', function() {
            const newPasswordGroup = document.getElementById('newPasswordGroup');
            const newPasswordInput = document.getElementById('nPassword');
            
            if (this.checked) {
                newPasswordGroup.style.display = '';
                newPasswordInput.required = true;
            } else {
                newPasswordGroup.style.display = 'none';
                newPasswordInput.required = false;
                newPasswordInput.value = '';
            }
        });
        
        function togglePasswordVisibility(inputId) {
            const passwordInput = document.getElementById(inputId);
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
            } else {
                passwordInput.type = 'password';
            }
        }
        
        window.onclick = function(event) {
            if (event.target.className === 'modal') {
                event.target.style.display = "none";
                if (event.target.id === 'addUserModal') {
                    document.getElementById('addUserForm').reset();
                } else if (event.target.id === 'editUserModal') {
                    document.getElementById('editUserForm').reset();
                    document.getElementById('newPasswordGroup').style.display = 'none';
                }
            }
        }
    </script>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <h1>User Management</h1>
    </div>

    <div class="nav">
        <a href="index.jsp">Home</a>
        <a href="courseManagement.jsp">Course Materials</a>
        <a href="pollManagement.jsp">Poll Management</a>
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
                <input type="text" id="searchInput" placeholder="Search users...">
            </div>
            <button class="btn btn-success" onclick="openModal('addUserModal')">Add New User</button>
        </div>

        <table>
            <thead>
                <tr>
                    <th>Username</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Role</th>
                    <th>Actions</th>
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
                            <span class="user-role role-${user.role.toLowerCase()}">${user.role}</span>
                        </td>
                        <td class="action-icons">
                            <i onclick="openEditModal('${user.id}', '${user.username}', '${user.name}', '${user.email}', '${user.phoneNumber}', '${user.role}')" style="color: #3498db">Edit</i>
                            <i onclick="confirmDelete('${user.id}', '${user.username}')" style="color: #e74c3c">Delete</i>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <div id="addUserModal" class="modal">
        <div class="modal-content">
            <h2>Add New User</h2>
            <form id="addUserForm" action="<c:url value='/userManagement/add'/>" method="post">
                <div class="form-group">
                    <label for="newUsername">Username</label>
                    <input type="text" id="newUsername" name="username" required>
                </div>
                <div class="form-group">
                    <label for="newPassword">Password</label>
                    <div class="password-container">
                        <input type="password" id="newPassword" name="password" required>
                        <span class="password-toggle" onclick="togglePasswordVisibility('newPassword')">👁️</span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="newName">Full Name</label>
                    <input type="text" id="newName" name="name" required>
                </div>
                <div class="form-group">
                    <label for="newEmail">Email</label>
                    <input type="email" id="newEmail" name="email" required>
                </div>
                <div class="form-group">
                    <label for="newPhone">Phone</label>
                    <input type="text" id="newPhone" name="phone">
                </div>
                <div class="form-group">
                    <label for="newRole">Role</label>
                    <input type="text" id="newRole" name="role" value="STUDENT" readonly>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn" onclick="closeModal('addUserModal')">Cancel</button>
                    <button type="submit" class="btn btn-success">Add User</button>
                </div>
            </form>
        </div>
    </div>

    <div id="editUserModal" class="modal">
        <div class="modal-content">
            <h2>Edit User</h2>
            <form id="editUserForm" action="<c:url value='/userManagement/update'/>" method="post">
                <input type="hidden" id="editUserId" name="id">
                <div class="form-group">
                    <label for="editUsername">Username</label>
                    <input type="text" id="editUsername" readonly>
                </div>
                <div class="form-group">
                    <label for="editName">Full Name</label>
                    <input type="text" id="editName" name="name" required>
                </div>
                <div class="form-group">
                    <label for="editEmail">Email</label>
                    <input type="email" id="editEmail" name="email" required>
                </div>
                <div class="form-group">
                    <label for="editPhone">Phone</label>
                    <input type="text" id="editPhone" name="phone">
                </div>
                <div class="form-group">
                    <label for="editRole">Role</label>
                    <input type="text" id="editRole" name="role" value="STUDENT" readonly>
                </div>
                <div class="form-group">
                    <label>
                        <input type="checkbox" id="resetPassword" name="resetPassword"> Reset Password
                    </label>
                </div>
                <div class="form-group" id="newPasswordGroup" style="display: none;">
                    <label for="nPassword">New Password</label>
                    <div class="password-container">
                        <input type="password" id="nPassword" name="newPassword">
                        <span class="password-toggle" onclick="togglePasswordVisibility('nPassword')">👁️</span>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn" onclick="closeModal('editUserModal')">Cancel</button>
                    <button type="submit" class="btn">Save Changes</button>
                </div>
            </form>
        </div>
    </div>

    <div id="deleteModal" class="modal">
        <div class="modal-content">
            <h2>Confirm Delete</h2>
            <p>Are you sure you want to delete user: <span id="deleteUsername"></span>?</p>
            <div class="modal-footer">
                <button class="btn" onclick="closeModal('deleteModal')">Cancel</button>
                <form id="deleteForm" action="<c:url value='/userManagement/delete'/>" method="post" style="display: inline;">
                    <input type="hidden" id="deleteUserId" name="id">
                    <button type="submit" class="btn btn-danger">Delete</button>
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
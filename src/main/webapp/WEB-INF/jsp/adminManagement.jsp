<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
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
        <div class="action-bar">
            <div class="search-bar">
                <input type="text" placeholder="Search users...">
                <button class="btn">Search</button>
            </div>
            <button class="btn btn-success" onclick="openAddUserModal()">Add New User</button>
        </div>

        <table>
            <thead>
                <tr>
                    <th>Username</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Last Active</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>admin1</td>
                    <td>Prof. Johnson</td>
                    <td>johnson@university.edu</td>
                    <td><span class="role-badge role-admin">Admin</span></td>
                    <td>2025-03-28</td>
                    <td class="action-icons">
                        <a href="#" onclick="openEditUserModal('admin1')">Edit</a>
                        <a href="#" style="color: #e74c3c">Delete</a>
                    </td>
                </tr>
                <tr>
                    <td>teacher1</td>
                    <td>Dr. Smith</td>
                    <td>smith@university.edu</td>
                    <td><span class="role-badge role-teacher">Teacher</span></td>
                    <td>2025-03-27</td>
                    <td class="action-icons">
                        <a href="#" onclick="openEditUserModal('teacher1')">Edit</a>
                        <a href="#" style="color: #e74c3c">Delete</a>
                    </td>
                </tr>

                <tr>
                    <td>student101</td>
                    <td>Sarah Miller</td>
                    <td>miller@university.edu</td>
                    <td><span class="role-badge role-student">Student</span></td>
                    <td>2025-03-29</td>
                    <td class="action-icons">
                        <a href="#" onclick="openEditUserModal('student101')">Edit</a>
                        <a href="#" style="color: #e74c3c">Delete</a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- Add User Modal -->
    <div id="addUserModal" class="modal">
        <div class="modal-content">
            <h2>Add New User</h2>
            <form id="addUserForm">
                <div class="form-group">
                    <label for="newUsername">Username</label>
                    <input type="text" id="newUsername" required>
                </div>
                <div class="form-group">
                    <label for="newPassword">Password</label>
                    <input type="password" id="newPassword" required>
                </div>
                <div class="form-group">
                    <label for="newName">Full Name</label>
                    <input type="text" id="newName" required>
                </div>
                <div class="form-group">
                    <label for="newEmail">Email</label>
                    <input type="email" id="newEmail" required>
                </div>
                <div class="form-group">
                    <label for="newRole">Role</label>
                    <select id="newRole" required>
                        <option value="student">Student</option>
                        <option value="teacher">Teacher</option>
                        <option value="admin">Admin</option>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn" onclick="closeModal('addUserModal')">Cancel</button>
                    <button type="submit" class="btn btn-success">Add User</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Edit User Modal -->
    <div id="editUserModal" class="modal">
        <div class="modal-content">
            <h2>Edit User</h2>
            <form id="editUserForm">
                <div class="form-group">
                    <label for="editUsername">Username</label>
                    <input type="text" id="editUsername" readonly>
                </div>
                <div class="form-group">
                    <label for="editName">Full Name</label>
                    <input type="text" id="editName" required>
                </div>
                <div class="form-group">
                    <label for="editEmail">Email</label>
                    <input type="email" id="editEmail" required>
                </div>
                <div class="form-group">
                    <label for="editRole">Role</label>
                    <select id="editRole" required>
                        <option value="student">Student</option>
                        <option value="teacher">Teacher</option>
                        <option value="admin">Admin</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>
                        <input type="checkbox" id="resetPassword"> Reset Password
                    </label>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn" onclick="closeModal('editUserModal')">Cancel</button>
                    <button type="submit" class="btn">Save Changes</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        // Modal functions
        function openAddUserModal() {
            document.getElementById('addUserModal').style.display = 'block';
        }

        function openEditUserModal(username) {
            // In a real app, you would fetch user data here
            document.getElementById('editUsername').value = username;
            document.getElementById('editName').value = "Sample Name";
            document.getElementById('editEmail').value = "user@example.com";
            document.getElementById('editRole').value = "student";
            document.getElementById('editUserModal').style.display = 'block';
        }

        function closeModal(modalId) {
            document.getElementById(modalId).style.display = 'none';
        }

        // Close modals when clicking outside
        window.onclick = function(event) {
            if (event.target.className === 'modal') {
                event.target.style.display = 'none';
            }
        }

        // Form submissions
        document.getElementById('addUserForm').onsubmit = function(e) {
            e.preventDefault();
            alert('User added successfully!');
            closeModal('addUserModal');
            // In real app, would submit to server here
        };

        document.getElementById('editUserForm').onsubmit = function(e) {
            e.preventDefault();
            alert('User updated successfully!');
            closeModal('editUserModal');
            // In real app, would submit to server here
        };
    </script>
</body>
</html>
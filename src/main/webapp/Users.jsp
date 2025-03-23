<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, com.datapackage.dao.UserDAO, com.datapackage.models.User" %>
<jsp:include page="header.jsp" />

<%
    UserDAO userDAO = new UserDAO();
    List<User> userList = userDAO.getAllUsers();
    String message = request.getParameter("success") != null ? request.getParameter("success") : request.getParameter("error");
    String messageType = request.getParameter("success") != null ? "success" : "danger";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css">
    <style>
        .alert { position: fixed; top: 20px; right: 20px; z-index: 1000; }
    </style>
</head>
<body>
    <% if (message != null) { %>
        <div class="alert alert-<%= messageType %> alert-dismissible fade show">
            <%= message %>
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    <% } %>

    <div class="container mt-4">
        <h2>Manage Users</h2>
        <button class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#addUserModal">
            Add New User
        </button>

        <table id="usersTable" class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Role</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% for (User user : userList) { %>
                <tr>
                    <td><%= user.getRegNumber() %></td>
                    <td><%= user.getName() %></td>
                    <td><%= user.getEmail() %></td>
                    <td><%= user.getPhone() %></td>
                    <td>
                        <span class="badge bg-<%= "admin".equals(user.getRole()) ? "danger" : "success" %>">
                            <%= user.getRole() %>
                        </span>
                    </td>
                    <td>
                        <button class="btn btn-warning btn-sm edit-btn" 
                                data-bs-toggle="modal" 
                                data-bs-target="#editUserModal"
                                data-regnumber="<%= user.getRegNumber() %>"
                                data-name="<%= user.getName() %>"
                                data-address="<%= user.getAddress() %>"
                                data-nic="<%= user.getNic() %>"
                                data-email="<%= user.getEmail() %>"
                                data-phone="<%= user.getPhone() %>"
                                data-role="<%= user.getRole() %>">
                            Edit
                        </button>
                        <a href="UserController?action=delete&userId=<%= user.getRegNumber() %>" 
                           class="btn btn-danger btn-sm"
                           onclick="return confirm('Are you sure?')">
                            Delete
                        </a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <!-- Add User Modal -->
    <div class="modal fade" id="addUserModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="UserController" method="post">
                    <input type="hidden" name="action" value="register">
                    <div class="modal-header">
                        <h5 class="modal-title">Add New User</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label class="form-label">Full Name *</label>
                            <input type="text" name="name" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Email *</label>
                            <input type="email" name="email" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Password *</label>
                            <input type="password" name="password" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Confirm Password *</label>
                            <input type="password" name="confirmPassword" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Address</label>
                            <input type="text" name="address" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">NIC Number</label>
                            <input type="text" name="nic" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Phone Number</label>
                            <input type="tel" name="phone" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Role *</label>
                            <select name="role" class="form-select" required>
                                <option value="user">User</option>
                                <option value="admin">Admin</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Add User</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Edit User Modal -->
    <div class="modal fade" id="editUserModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="UserController" method="post">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="userId" id="editRegNumber">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit User</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label class="form-label">Full Name *</label>
                            <input type="text" name="name" id="editName" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Email *</label>
                            <input type="email" name="email" id="editEmail" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Address</label>
                            <input type="text" name="address" id="editAddress" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">NIC Number</label>
                            <input type="text" name="nic" id="editNic" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Phone Number</label>
                            <input type="tel" name="phone" id="editPhone" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Role *</label>
                            <select name="role" id="editRole" class="form-select" required>
                                <option value="user">User</option>
                                <option value="admin">Admin</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Update User</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#usersTable').DataTable();
            
            $('.edit-btn').click(function() {
                const userData = $(this).data();
                $('#editRegNumber').val(userData.regnumber);
                $('#editName').val(userData.name);
                $('#editAddress').val(userData.address);
                $('#editNic').val(userData.nic);
                $('#editEmail').val(userData.email);
                $('#editPhone').val(userData.phone);
                $('#editRole').val(userData.role);
            });

            setTimeout(() => {
                $('.alert').alert('close');
            }, 5000);
        });
    </script>
</body>
</html>
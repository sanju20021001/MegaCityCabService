<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, com.datapackage.dao.UserDAO, com.datapackage.models.User" %>

<%
    UserDAO userDAO = new UserDAO();
    List<User> userList = userDAO.getAllUsers();
    System.out.println("Number of users fetched: " + userList.size()); // Debug log
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users - Mega City Cab</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <style>
        /* Your existing styles */
    </style>
</head>
<body>

    <!-- Main Content -->
    <div class="container">
        <h2 class="text-center mb-4 animate__animated animate__fadeInDown">Manage Users</h2>

        <!-- Display Success and Error Messages -->
        <% if (request.getParameter("success") != null) { %>
            <div class="alert alert-success" role="alert">
                <%= request.getParameter("success") %>
            </div>
        <% } %>
        <% if (request.getParameter("error") != null) { %>
            <div class="alert alert-danger" role="alert">
                <%= request.getParameter("error") %>
            </div>
        <% } %>

        <!-- Users Table -->
        <table id="usersTable" class="table animate__animated animate__fadeInUp animate-delay-1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Name</th>
                    <th>Address</th>
                    <th>NIC</th>
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
                    <td><%= user.getUsername() %></td>
                    <td><%= user.getName() %></td>
                    <td><%= user.getAddress() %></td>
                    <td><%= user.getNic() %></td>
                    <td><%= user.getEmail() %></td>
                    <td><%= user.getPhone() %></td>
                    <td><%= user.getRole() %></td>
                    <td>
                        <button class="btn btn-warning btn-sm editBtn"
                                data-bs-toggle="modal"
                                data-bs-target="#editUserModal"
                                data-id="<%= user.getRegNumber() %>"
                                data-username="<%= user.getUsername() %>"
                                data-name="<%= user.getName() %>"
                                data-address="<%= user.getAddress() %>"
                                data-nic="<%= user.getNic() %>"
                                data-email="<%= user.getEmail() %>"
                                data-phone="<%= user.getPhone() %>"
                                data-role="<%= user.getRole() %>">
                            <i class="fas fa-edit"></i> Edit
                        </button>
                        <a href="<%= request.getContextPath() %>/UserController?action=delete&userId=<%= user.getRegNumber() %>"
                           class="btn btn-danger btn-sm">
                            <i class="fas fa-trash"></i> Delete
                        </a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <!-- Edit User Modal -->
    <div class="modal fade" id="editUserModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Edit User</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form id="editUserForm" action="<%= request.getContextPath() %>/UserController" method="post">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="userId" id="editUserId">
                        <div class="mb-3">
                            <label class="form-label">Username</label>
                            <input type="text" name="username" id="editUsername" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Name</label>
                            <input type="text" name="name" id="editName" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Address</label>
                            <input type="text" name="address" id="editAddress" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">NIC</label>
                            <input type="text" name="nic" id="editNic" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" name="email" id="editEmail" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Phone</label>
                            <input type="text" name="phone" id="editPhone" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Role</label>
                            <select name="role" id="editRole" class="form-control" required>
                                <option value="user">User</option>
                                <option value="admin">Admin</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Update User</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#usersTable').DataTable();

            $('.editBtn').click(function () {
                let userId = $(this).data('id');
                let username = $(this).data('username');
                let name = $(this).data('name');
                let address = $(this).data('address');
                let nic = $(this).data('nic');
                let email = $(this).data('email');
                let phone = $(this).data('phone');
                let role = $(this).data('role');

                $('#editUserId').val(userId);
                $('#editUsername').val(username);
                $('#editName').val(name);
                $('#editAddress').val(address);
                $('#editNic').val(nic);
                $('#editEmail').val(email);
                $('#editPhone').val(phone);
                $('#editRole').val(role);
            });
        });
    </script>
</body>
</html>
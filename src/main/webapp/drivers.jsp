<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List,com.datapackage.dao.DriverDAO,com.datapackage.models.Driver" %>
<jsp:include page="header.jsp" />

<%
    DriverDAO driverDAO = new DriverDAO();
    List<Driver> driverList = driverDAO.getAllDrivers();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Drivers - Mega City Cab</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <style>
        :root {
            --primary-blue: #002D62; /* Deep blue */
            --accent-orange: #EB6E1F; /* Vibrant orange */
            --light-blue: #0077C8; /* Light blue for accents */
            --background-light: #FFFFFF; /* White background */
            --text-dark: #000000; /* Black text */
            --text-muted: #666666; /* Dark gray for secondary text */
        }

        body {
            background: var(--background-light);
            font-family: 'Poppins', sans-serif;
            color: var(--text-dark);
            margin: 0;
            padding: 0;
            animation: fadeIn 1.5s ease-in;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        /* Table Styles */
        #driversTable {
            margin-top: 20px;
            color: var(--text-dark);
            border-collapse: separate;
            border-spacing: 0 10px;
        }

        #driversTable th {
            background: var(--primary-blue);
            color: var(--background-light); /* White text */
            font-weight: 600;
            padding: 15px;
            text-align: left;
            font-size: 1rem;
        }

        #driversTable td {
            background: rgba(0, 0, 0, 0.05);
            padding: 15px;
            vertical-align: middle;
            border: none;
            font-size: 0.95rem;
        }

        #driversTable tr {
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        #driversTable tr:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        /* Button Styles */
        .btn {
            font-weight: 600;
            padding: 8px 16px;
            border-radius: 8px;
            transition: all 0.3s ease;
            font-size: 0.9rem;
        }

        .btn-primary {
            background: var(--primary-blue);
            border: none;
        }

        .btn-primary:hover {
            background: var(--light-blue);
            transform: translateY(-2px);
        }

        .btn-warning {
            background: var(--accent-orange);
            border: none;
        }

        .btn-warning:hover {
            background: #D45A1A;
            transform: translateY(-2px);
        }

        .btn-danger {
            background: #DC3545;
            border: none;
        }

        .btn-danger:hover {
            background: #C82333;
            transform: translateY(-2px);
        }

        .btn-success {
            background: #28A745;
            border: none;
        }

        .btn-success:hover {
            background: #218838;
            transform: translateY(-2px);
        }

        /* Modal Styles */
        .modal-content {
            background: var(--background-light);
            border-radius: 12px;
            border: 1px solid rgba(0, 0, 0, 0.1);
        }

        .modal-header {
            background: var(--primary-blue);
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
            border-radius: 12px 12px 0 0;
        }

        .modal-title {
            color: var(--background-light); /* White text */
            font-weight: 700;
            font-size: 1.2rem;
        }

        .modal-body input,
        .modal-body select {
            background: rgba(255, 255, 255, 0.9);
            border: 1px solid rgba(0, 0, 0, 0.2);
            color: var(--text-dark);
            border-radius: 8px;
            padding: 10px;
            width: 100%;
            transition: border-color 0.3s ease;
            font-size: 0.95rem;
        }

        .modal-body input:focus,
        .modal-body select:focus {
            border-color: var(--accent-orange);
            outline: none;
        }

        /* Footer Styles */
        footer {
            background: var(--primary-blue);
            padding: 15px 0;
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
            font-size: 0.9rem;
            color: var(--background-light); /* White text */
            box-shadow: 0 -4px 6px rgba(0, 0, 0, 0.1);
        }

        footer p {
            margin: 0;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>

    <!-- Main Content -->
    <div class="container">
        <h2 class="text-center mb-4 animate__animated animate__fadeInDown">Manage Drivers</h2>

        <!-- Add Driver Button -->
        <button class="btn btn-primary mb-3 animate__animated animate__fadeInUp" data-bs-toggle="modal" data-bs-target="#addDriverModal">
            <i class="fas fa-plus"></i> Add Driver
        </button>

        <!-- Drivers Table -->
        <table id="driversTable" class="table animate__animated animate__fadeInUp animate-delay-1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>License Number</th>
                    <th>Phone Number</th>
                    <th>Email</th>
                    <th>Vehicle Type</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% for (Driver driver : driverList) { %>
                <tr>
                    <td><%= driver.getDriverID() %></td>
                    <td><%= driver.getName() %></td>
                    <td><%= driver.getLicenseNumber() %></td>
                    <td><%= driver.getPhoneNumber() %></td>
                    <td><%= driver.getEmail() %></td>
                    <td><%= driver.getVehicleType() %></td>
                    <td><span class="badge bg-<%= driver.getStatus().equals("Available") ? "success" : "warning" %>"><%= driver.getStatus() %></span></td>
                    <td>
                        <button class="btn btn-warning btn-sm editBtn"
                                data-bs-toggle="modal"
                                data-bs-target="#editDriverModal"
                                data-id="<%= driver.getDriverID() %>"
                                data-name="<%= driver.getName() %>"
                                data-license="<%= driver.getLicenseNumber() %>"
                                data-phone="<%= driver.getPhoneNumber() %>"
                                data-email="<%= driver.getEmail() %>"
                                data-vehicle="<%= driver.getVehicleType() %>"
                                data-status="<%= driver.getStatus() %>">
                            <i class="fas fa-edit"></i> Edit
                        </button>
                        <a href="<%= request.getContextPath() %>/DriverController?action=delete&id=<%= driver.getDriverID() %>"
                           class="btn btn-danger btn-sm">
                            <i class="fas fa-trash"></i> Delete
                        </a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 Mega City Cab. All Rights Reserved.</p>
    </footer>

    <!-- Add Driver Modal -->
    <div class="modal fade" id="addDriverModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add New Driver</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form action="<%= request.getContextPath() %>/DriverController" method="post">
                        <input type="hidden" name="action" value="add">
                        <div class="mb-3">
                            <label class="form-label">Name</label>
                            <input type="text" name="name" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">License Number</label>
                            <input type="text" name="license" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Phone Number</label>
                            <input type="text" name="phone" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" name="email" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Vehicle Type</label>
                            <input type="text" name="vehicle" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Status</label>
                            <select name="status" class="form-control">
                                <option value="Available">Available</option>
                                <option value="Booked">Booked</option>
                                <option value="Unavailable">Unavailable</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-success">Add Driver</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit Driver Modal -->
    <div class="modal fade" id="editDriverModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Edit Driver</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form id="editDriverForm" action="<%= request.getContextPath() %>/DriverController" method="post">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="driverID" id="editDriverID">
                        <div class="mb-3">
                            <label class="form-label">Name</label>
                            <input type="text" name="name" id="editName" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">License Number</label>
                            <input type="text" name="license" id="editLicense" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Phone Number</label>
                            <input type="text" name="phone" id="editPhone" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" name="email" id="editEmail" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Vehicle Type</label>
                            <input type="text" name="vehicle" id="editVehicle" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Status</label>
                            <select name="status" id="editStatus" class="form-control">
                                <option value="Available">Available</option>
                                <option value="Booked">Booked</option>
                                <option value="Unavailable">Unavailable</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Update Driver</button>
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
            $('#driversTable').DataTable();

            $('.editBtn').click(function () {
                let driverID = $(this).data('id');
                let name = $(this).data('name');
                let license = $(this).data('license');
                let phone = $(this).data('phone');
                let email = $(this).data('email');
                let vehicle = $(this).data('vehicle');
                let status = $(this).data('status');

                $('#editDriverID').val(driverID);
                $('#editName').val(name);
                $('#editLicense').val(license);
                $('#editPhone').val(phone);
                $('#editEmail').val(email);
                $('#editVehicle').val(vehicle);
                $('#editStatus').val(status);
            });
        });
    </script>
</body>
</html>
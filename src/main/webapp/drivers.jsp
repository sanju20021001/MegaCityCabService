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
        /* Your existing CSS styles remain unchanged */
    </style>
</head>
<body>

    <div class="container">
        <h2 class="text-center mb-4 animate__animated animate__fadeInDown">Manage Drivers</h2>

        <button class="btn btn-primary mb-3 animate__animated animate__fadeInUp" data-bs-toggle="modal" data-bs-target="#addDriverModal">
            <i class="fas fa-plus"></i> Add Driver
        </button>

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
                    <td>
                        <span class="badge bg-<%= driver.getStatus().equals("available") ? "success" : 
                                  driver.getStatus().equals("booked") ? "warning" : "danger" %>">
                            <%= driver.getStatus() %>
                        </span>
                    </td>
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
                        
                        <form action="<%= request.getContextPath() %>/DriverController" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="driverID" value="<%= driver.getDriverID() %>">
                            <button type="submit" class="btn btn-danger btn-sm">
                                <i class="fas fa-trash"></i> Delete
                            </button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

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
                                <option value="available">Available</option>
                                <option value="booked">Booked</option>
                                <option value="unavailable">Unavailable</option>
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
                                <option value="available">Available</option>
                                <option value="booked">Booked</option>
                                <option value="unavailable">Unavailable</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-success">Save Changes</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        const editDriverModal = document.getElementById('editDriverModal');
        editDriverModal.addEventListener('show.bs.modal', function (event) {
            const button = event.relatedTarget;
            const driverID = button.getAttribute('data-id');
            const name = button.getAttribute('data-name');
            const license = button.getAttribute('data-license');
            const phone = button.getAttribute('data-phone');
            const email = button.getAttribute('data-email');
            const vehicle = button.getAttribute('data-vehicle');
            const status = button.getAttribute('data-status').toLowerCase();

            document.getElementById('editDriverID').value = driverID;
            document.getElementById('editName').value = name;
            document.getElementById('editLicense').value = license;
            document.getElementById('editPhone').value = phone;
            document.getElementById('editEmail').value = email;
            document.getElementById('editVehicle').value = vehicle;
            document.getElementById('editStatus').value = status;
        });
    </script>

</body>
</html>
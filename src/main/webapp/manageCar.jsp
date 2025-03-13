<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, com.datapackage.dao.CarDAO, com.datapackage.models.Car" %>
<jsp:include page="header.jsp" />

<%
    CarDAO carDAO = new CarDAO();
    List<Car> carList = carDAO.getAllCars();
    String message = (String) session.getAttribute("message");
    String messageType = (String) session.getAttribute("messageType");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Cars</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css">
    <style>
        .alert { position: fixed; top: 20px; right: 20px; z-index: 1000; }
        img.car-thumbnail { max-width: 100px; height: auto; }
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
        <h2>Manage Cars</h2>
        <button class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#addCarModal">
            Add New Car
        </button>

        <table id="carsTable" class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Model</th>
                    <th>Brand</th>
                    <th>License Plate</th>
                    <th>Price/Day</th>
                    <th>Status</th>
                    <th>Image</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% for (Car car : carList) { %>
                <tr>
                    <td><%= car.getCarID() %></td>
                    <td><%= car.getModel() %></td>
                    <td><%= car.getBrand() %></td>
                    <td><%= car.getLicensePlate() %></td>
                    <td>$<%= String.format("%.2f", car.getPricePerDay()) %></td>
                    <td>
                        <span class="badge bg-<%= "available".equals(car.getStatus()) ? "success" : "danger" %>">
                            <%= car.getStatus() %>
                        </span>
                    </td>
                    <td>
                        <img src="<%= car.getImage() %>" class="car-thumbnail">
                    </td>
                    <td>
                        <button class="btn btn-warning btn-sm edit-btn" 
                                data-bs-toggle="modal" 
                                data-bs-target="#editCarModal"
                                data-carid="<%= car.getCarID() %>"
                                data-model="<%= car.getModel() %>"
                                data-brand="<%= car.getBrand() %>"
                                data-license="<%= car.getLicensePlate() %>"
                                data-price="<%= car.getPricePerDay() %>"
                                data-status="<%= car.getStatus() %>"
                                data-image="<%= car.getImage() %>">
                            Edit
                        </button>
                        <a href="CarController?action=delete&id=<%= car.getCarID() %>" 
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

    <!-- Modals -->
    <div class="modal fade" id="addCarModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="CarController" method="post" enctype="multipart/form-data" onsubmit="return validateForm(this)">
                    <input type="hidden" name="action" value="add">
                    <div class="modal-header">
                        <h5 class="modal-title">Add New Car</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label class="form-label">Model *</label>
                            <input type="text" name="model" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Brand *</label>
                            <input type="text" name="brand" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">License Plate *</label>
                            <input type="text" name="license" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Price/Day *</label>
                            <input type="number" name="price" step="0.01" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Status *</label>
                            <select name="status" class="form-select" required>
                                <option value="available">Available</option>
                                <option value="rented">Rented</option>
                                <option value="maintenance">Maintenance</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Car Image</label>
                            <input type="file" name="image" class="form-control" accept="image/*">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Add Car</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Edit Modal (similar structure with pre-filled data) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Edit modal population
        document.querySelectorAll('.edit-btn').forEach(btn => {
            btn.addEventListener('click', () => {
                document.getElementById('editCarID').value = btn.dataset.carid;
                document.getElementById('editModel').value = btn.dataset.model;
                document.getElementById('editBrand').value = btn.dataset.brand;
                document.getElementById('editLicense').value = btn.dataset.license;
                document.getElementById('editPrice').value = btn.dataset.price;
                document.getElementById('editStatus').value = btn.dataset.status;
            });
        });

        // Client-side validation
        function validateForm(form) {
            const price = form.price.value;
            if (isNaN(price) || price <= 0) {
                alert("Please enter a valid price");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
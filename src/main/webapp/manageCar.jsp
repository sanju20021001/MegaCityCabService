<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List,com.datapackage.dao.CarDAO,com.datapackage.models.Car" %>
<jsp:include page="header.jsp" />

<%
    CarDAO carDAO = new CarDAO();
    List<Car> carList = carDAO.getAllCars();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Cars - Mega City Cab</title>
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



        @keyframes fadeInUp {
            from { transform: translateY(30px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        /* Table Styles */
        #carsTable {
            margin-top: 20px;
            color: var(--text-dark);
            border-collapse: separate;
            border-spacing: 0 10px;
        }

        #carsTable th {
            background: var(--primary-blue);
            color: var(--background-light); /* White text */
            font-weight: 600;
            padding: 15px;
            text-align: left;
            font-size: 1rem;
        }

        #carsTable td {
            background: rgba(0, 0, 0, 0.05);
            padding: 15px;
            vertical-align: middle;
            border: none;
            font-size: 0.95rem;
        }

        #carsTable tr {
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        #carsTable tr:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        #carsTable img {
            border-radius: 8px;
            width: 80px;
            height: auto;
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
        <h2 class="text-center mb-4 animate__animated animate__fadeInDown">Manage Cars</h2>

        <!-- Add Car Button -->
        <button class="btn btn-primary mb-3 animate__animated animate__fadeInUp" data-bs-toggle="modal" data-bs-target="#addCarModal">
            <i class="fas fa-plus"></i> Add Car
        </button>

        <!-- Cars Table -->
        <table id="carsTable" class="table animate__animated animate__fadeInUp animate-delay-1">
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
                    <td>$<%= car.getPricePerDay() %></td>
                    <td><span class="badge bg-<%= car.getStatus().equals("Available") ? "success" : "warning" %>"><%= car.getStatus() %></span></td>
                    <td>
                        <img src="<%= car.getImage() %>" alt="Car Image" class="img-thumbnail">
                    </td>
                    <td>
                        <button class="btn btn-warning btn-sm editBtn"
                                data-bs-toggle="modal"
                                data-bs-target="#editCarModal"
                                data-id="<%= car.getCarID() %>"
                                data-model="<%= car.getModel() %>"
                                data-brand="<%= car.getBrand() %>"
                                data-license="<%= car.getLicensePlate() %>"
                                data-price="<%= car.getPricePerDay() %>"
                                data-status="<%= car.getStatus() %>"
                                data-image="<%= car.getImage() %>">
                            <i class="fas fa-edit"></i> Edit
                        </button>
                        <a href="<%= request.getContextPath() %>/CarController?action=delete&id=<%= car.getCarID() %>"
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

    <!-- Add Car Modal -->
    <div class="modal fade" id="addCarModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add New Car</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form action="<%= request.getContextPath() %>/CarController" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="action" value="add">
                        <div class="mb-3">
                            <label class="form-label">Model</label>
                            <input type="text" name="model" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Brand</label>
                            <input type="text" name="brand" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">License Plate</label>
                            <input type="text" name="license" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Price Per Day</label>
                            <input type="number" name="price" class="form-control" step="0.01" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Status</label>
                            <select name="status" class="form-control">
                                <option value="Available">Available</option>
                                <option value="Booked">Booked</option>
                                <option value="In Maintenance">In Maintenance</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Upload Image</label>
                            <input type="file" name="image" class="form-control">
                        </div>
                        <button type="submit" class="btn btn-success">Add Car</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit Car Modal -->
    <div class="modal fade" id="editCarModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Edit Car</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form id="editCarForm" action="<%= request.getContextPath() %>/CarController" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="carID" id="editCarID">
                        <div class="mb-3">
                            <label class="form-label">Model</label>
                            <input type="text" name="model" id="editModel" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Brand</label>
                            <input type="text" name="brand" id="editBrand" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">License Plate</label>
                            <input type="text" name="license" id="editLicense" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Price Per Day</label>
                            <input type="number" name="price" id="editPrice" class="form-control" step="0.01" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Status</label>
                            <select name="status" id="editStatus" class="form-control">
                                <option value="Available">Available</option>
                                <option value="Booked">Booked</option>
                                <option value="In Maintenance">In Maintenance</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Upload Image</label>
                            <input type="file" name="image" class="form-control">
                        </div>
                        <button type="submit" class="btn btn-primary">Update Car</button>
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
            $('#carsTable').DataTable();

            $('.editBtn').click(function () {
                let carID = $(this).data('id');
                let model = $(this).data('model');
                let brand = $(this).data('brand');
                let license = $(this).data('license');
                let price = $(this).data('price');
                let status = $(this).data('status');

                $('#editCarID').val(carID);
                $('#editModel').val(model);
                $('#editBrand').val(brand);
                $('#editLicense').val(license);
                $('#editPrice').val(price);
                $('#editStatus').val(status);
            });
        });
    </script>
</body>
</html>
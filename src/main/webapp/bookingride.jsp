<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book a Cab - Mega City Cab</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: url('images/home.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: Arial, sans-serif;
            color: white;
        }
        .form-container {
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            background: rgba(0, 0, 0, 0.8);
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #ff9800;
        }
        .form-control {
            margin-bottom: 15px;
        }
        .btn-custom {
            background: linear-gradient(to right, #ff9800, #ff5722);
            color: white;
            padding: 10px 20px;
            border-radius: 50px;
            border: none;
            width: 100%;
            font-size: 1.1rem;
            font-weight: 600;
        }
        .btn-custom:hover {
            background: linear-gradient(to right, #e68900, #d84315);
        }
        .alert {
            border-radius: 10px;
            margin-bottom: 15px;
            padding: 10px;
            text-align: center;
        }
        .alert-danger {
            background: rgba(255, 87, 34, 0.8);
            color: white;
        }
        .alert-success {
            background: rgba(76, 175, 80, 0.8);
            color: white;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Book a Cab</h2>

        <%-- Display error message if any --%>
        <% String errorMessage = request.getParameter("error"); %>
        <% if (errorMessage != null) { %>
            <div class="alert alert-danger"><%= errorMessage %></div>
        <% } %>

        <%-- Display success message if any --%>
        <% String successMessage = request.getParameter("success"); %>
        <% if (successMessage != null) { %>
            <div class="alert alert-success"><%= successMessage %></div>
        <% } %>

        <%-- Form to collect user input --%>
        <form action="BookingController" method="post">
            <div class="mb-3">
                <label for="customerName" class="form-label">Customer Name</label>
                <input type="text" class="form-control" id="customerName" name="customerName" placeholder="Enter your name" required>
            </div>
            <div class="mb-3">
                <label for="customerPhone" class="form-label">Customer Phone</label>
                <input type="text" class="form-control" id="customerPhone" name="customerPhone" placeholder="Enter your phone number" required>
            </div>
            <div class="mb-3">
                <label for="customerEmail" class="form-label">Customer Email</label>
                <input type="email" class="form-control" id="customerEmail" name="customerEmail" placeholder="Enter your email" required>
            </div>
            <div class="mb-3">
                <label for="pickupLocation" class="form-label">Pickup Location</label>
                <input type="text" class="form-control" id="pickupLocation" name="pickupLocation" placeholder="Enter pickup location" required>
            </div>
            <div class="mb-3">
                <label for="dropLocation" class="form-label">Drop Location</label>
                <input type="text" class="form-control" id="dropLocation" name="dropLocation" placeholder="Enter drop location" required>
            </div>
            <div class="mb-3">
                <label for="pickupTime" class="form-label">Pickup Time</label>
                <input type="datetime-local" class="form-control" id="pickupTime" name="pickupTime" required>
            </div>
            <div class="mb-3">
                <label for="cabType" class="form-label">Cab Type</label>
                <select class="form-select" id="cabType" name="cabType" required>
                    <option value="Mini">Mini</option>
                    <option value="Sedan">Sedan</option>
                    <option value="SUV">SUV</option>
                </select>
            </div>
            <input type="hidden" name="userId" value="1"> <!-- Replace with actual user ID -->
            <button type="submit" class="btn btn-custom">Book Now</button>
        </form>
    </div>
</body>
</html>
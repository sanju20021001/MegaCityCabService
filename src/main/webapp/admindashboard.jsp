<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Mega City Cab</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Poppins', sans-serif;
        }
        .sidebar {
            height: 100vh;
            background: #343a40;
            color: white;
            padding: 20px;
        }
        .sidebar a {
            color: white;
            text-decoration: none;
            display: block;
            padding: 10px;
            margin: 5px 0;
            border-radius: 5px;
            transition: background 0.3s;
        }
        .sidebar a:hover {
            background: #495057;
        }
        .sidebar .active {
            background: #002D62; /* Changed to Astros blue */
        }
        .main-content {
            padding: 20px;
        }
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }
        .card:hover {
            transform: translateY(-5px);
        }
        .stat-card {
            background: linear-gradient(135deg, #002D62, #0066b2); /* Changed to Astros blue gradient */
            color: white;
        }
        .stat-card i {
            font-size: 2rem;
        }
        .badge.bg-warning {
            background-color: #002D62 !important; /* Changed to Astros blue */
        }
        .alert-success {
            background: rgba(0, 200, 81, 0.8);
            border: none;
            border-radius: 10px;
            color: white;
            font-weight: 500;
            font-size: 1rem;
            padding: 10px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <!-- Display Welcome Message -->
    <% String message = request.getParameter("message"); %>
    <% if (message != null && !message.isEmpty()) { %>
        <div id="welcomeMessage" class="alert alert-success text-center animate__animated animate__fadeInDown">
            <%= message %>
        </div>
    <% } %>

    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3 col-lg-2 sidebar">
                <h3 class="text-center mb-4">Admin Panel</h3>
                <ul class="nav flex-column">
                    <li><a href="#" class="active"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                    <li><a href="Users.jsp"><i class="fas fa-users"></i> Manage Users</a></li>
                    <li><a href="manageCar.jsp"><i class="fas fa-car"></i> Manage Cabs</a></li>
                    <li><a href="drivers.jsp"><i class="fas fa-users"></i> Manage Drivers</a></li>
                    <li><a href="managebooking.jsp"><i class="fas fa-list"></i>Bookings</a></li>
                    <li><a href="#"><i class="fas fa-chart-line"></i> Analytics</a></li>
                    <li><a href="#"><i class="fas fa-cog"></i> Settings</a></li>
                    <li><a href="#"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
                </ul>
            </div>
            

            <!-- Main Content -->
            <div class="col-md-9 col-lg-10 main-content">
                <h2 class="mb-4">Dashboard Overview</h2>
                <div class="row">
                    <!-- Statistics Cards -->

					<div class="col-md-4 mb-4">
					    <div class="card stat-card text-center p-4">
					        <i class="fas fa-users mb-3"></i>
					        <h4>Total Users</h4>
					        <!-- Display total users dynamically -->
					        <h2><%= request.getAttribute("totalUsers") %></h2>
					    </div>
					</div>
					<div class="col-md-4 mb-4">
					    <div class="card stat-card text-center p-4">
					        <i class="fas fa-car mb-3"></i>
					        <h4>Total Cabs</h4>
					        <!-- Display total cabs dynamically -->
					        <h2><%= request.getAttribute("totalCars") %></h2>
					    </div>
					</div>
					<div class="col-md-4 mb-4">
					    <div class="card stat-card text-center p-4">
					        <i class="fas fa-list mb-3"></i>
					        <h4>Total Bookings</h4>
					        <!-- Display total bookings dynamically -->
					        <h2><%= request.getAttribute("totalBookings") %></h2>
					    </div>
					</div>


                <!-- Additional Functionalities -->
                <div class="row mt-4">
                    <div class="col-md-6">
                        <div class="card p-4">
                            <h4>Recent Bookings</h4>
                            <ul class="list-group">
                                <li class="list-group-item">Booking #123 - User: John Doe</li>
                                <li class="list-group-item">Booking #124 - User: Jane Smith</li>
                                <li class="list-group-item">Booking #125 - User: Alice Johnson</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card p-4">
                            <h4>System Notifications</h4>
                            <ul class="list-group">
                                <li class="list-group-item">New user registered: John Doe</li>
                                <li class="list-group-item">Cab #56 is now available</li>
                                <li class="list-group-item">Booking #123 completed</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    <!-- Custom JS -->
    <script>
        // Function to hide the welcome message after 1 second
        setTimeout(function() {
            var welcomeMessage = document.getElementById('welcomeMessage');
            if (welcomeMessage) {
                welcomeMessage.style.display = 'none';
            }
        }, 2000);
    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Services - Mega City Cab</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <style>
        body {
            background: url('images/services-bg.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Poppins', sans-serif;
            color: white;
            animation: fadeIn 1.5s ease-in;
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        /* Navbar Styles */
        .navbar {
            background: rgba(0, 0, 0, 0.8) !important;
            animation: slideDown 1.5s ease-in-out;
        }
        @keyframes slideDown {
            from { transform: translateY(-100px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        .navbar-brand {
            font-size: 1.8rem;
            font-weight: 700;
            color: #ff9800 !important;
        }
        .navbar-nav .nav-link {
            font-size: 1.1rem;
            font-weight: 500;
            color: white !important;
            transition: all 0.3s ease;
        }
        .navbar-nav .nav-link:hover {
            color: #ff9800 !important;
            transform: translateY(-3px);
        }
        .highlight-btn {
            font-weight: bold;
            padding: 10px 20px;
            border-radius: 8px;
            background: linear-gradient(to right, #ff9800, #ff5722);
            color: white !important;
            transition: transform 0.3s ease;
        }
        .highlight-btn:hover {
            background: linear-gradient(to right, #e68900, #d84315);
            transform: scale(1.05);
        }

        /* Services Section */
        .services {
            padding: 80px 0;
            background: rgba(0, 0, 0, 0.6);
        }
        .services h1 {
            font-size: 3.5rem;
            font-weight: 700;
            text-align: center;
            margin-bottom: 50px;
            animation: fadeIn 1.5s ease-in-out;
        }
        .service-card {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 12px;
            padding: 30px;
            margin-bottom: 30px;
            text-align: center;
            transition: all 0.3s ease-in-out;
            animation: fadeInUp 1s ease-in-out;
        }
        @keyframes fadeInUp {
            from { transform: translateY(30px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        .service-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }
        .service-card i {
            font-size: 3rem;
            color: #ff9800;
            margin-bottom: 20px;
        }
        .service-card h3 {
            font-size: 1.8rem;
            font-weight: 600;
            color: #333;
            margin-bottom: 15px;
        }
        .service-card p {
            font-size: 1.1rem;
            color: #666;
        }

        /* Footer Styles */
        .footer {
            background: rgba(0, 0, 0, 0.8);
            padding: 20px 0;
            text-align: center;
            font-size: 1rem;
            animation: fadeInUp 1.5s ease-in-out;
        }
        @keyframes fadeInUp {
            from { transform: translateY(30px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        .footer:hover {
            animation: glowEffect 1.5s infinite alternate;
        }
        @keyframes glowEffect {
            from { text-shadow: 0 0 10px rgba(255, 152, 0, 0.5); }
            to { text-shadow: 0 0 20px rgba(255, 87, 34, 0.8); }
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="#">Mega City Cab</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="home">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="about">About</a></li>
                    <li class="nav-item"><a class="nav-link" href="services">Services</a></li>
                    <li class="nav-item"><a class="nav-link" href="contact">Contact</a></li>
                    <li class="nav-item ms-4"><a class="nav-link highlight-btn" href="login">Login</a></li>
                    <li class="nav-item ms-4"><a class="nav-link highlight-btn" href="help">Help</a></li>
                </ul>
            </div>
        </div>
    </nav>
    
    <section class="services">
        <div class="container">
            <h1 class="animate__animated animate__fadeInDown">Our Services</h1>
            <div class="row">
                <div class="col-md-4 animate__animated animate__fadeInUp">
                    <div class="service-card">
                        <i class="fas fa-taxi"></i>
                        <h3>City Rides</h3>
                        <p>Quick and affordable rides within the city. Perfect for daily commutes and short trips.</p>
                    </div>
                </div>
                <div class="col-md-4 animate__animated animate__fadeInUp animate-delay-1">
                    <div class="service-card">
                        <i class="fas fa-plane"></i>
                        <h3>Airport Transfers</h3>
                        <p>Reliable and timely airport pickups and drop-offs. Never miss a flight again!</p>
                    </div>
                </div>
                <div class="col-md-4 animate__animated animate__fadeInUp animate-delay-2">
                    <div class="service-card">
                        <i class="fas fa-calendar-alt"></i>
                        <h3>Event Bookings</h3>
                        <p>Book cabs for events, parties, and special occasions. We’ve got you covered!</p>
                    </div>
                </div>
                <div class="col-md-4 animate__animated animate__fadeInUp">
                    <div class="service-card">
                        <i class="fas fa-briefcase"></i>
                        <h3>Corporate Rides</h3>
                        <p>Dedicated services for business travelers. Comfort and professionalism guaranteed.</p>
                    </div>
                </div>
                <div class="col-md-4 animate__animated animate__fadeInUp animate-delay-1">
                    <div class="service-card">
                        <i class="fas fa-car-side"></i>
                        <h3>Outstation Trips</h3>
                        <p>Explore nearby cities and towns with our outstation cab services.</p>
                    </div>
                </div>
                <div class="col-md-4 animate__animated animate__fadeInUp animate-delay-2">
                    <div class="service-card">
                        <i class="fas fa-hourglass-start"></i>
                        <h3>Hourly Rentals</h3>
                        <p>Need a cab for a few hours? We offer flexible hourly rental options.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <footer class="footer text-white">
        <p>&copy; 2025 Mega City Cab. All Rights Reserved.</p>
    </footer>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
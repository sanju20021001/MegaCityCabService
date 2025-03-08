<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mega City Cab - Online Reservation</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <!-- Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <style>
        /* Custom CSS */
        body {
            background: url('images/background.jpg') no-repeat center center fixed;
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
            background: rgba(0, 0, 0, 0.8) !important; /* Black */
            animation: slideDown 1.5s ease-in-out;
        }
        @keyframes slideDown {
            from { transform: translateY(-100px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        .navbar-brand {
            font-size: 1.8rem;
            font-weight: 700;
            color: white !important; 
        }
        .navbar-nav .nav-link {
            font-size: 1.1rem;
            font-weight: 500;
            color: white !important;
            transition: all 0.3s ease;
        }
        .navbar-nav .nav-link:hover {
            color: #808080 !important; /* Grey */
            transform: translateY(-3px);
        }
        .highlight-btn {
            font-weight: bold;
            padding: 10px 20px;
            border-radius: 8px;
            background: #002D62; /* Astros Blue */
            color: white !important;
            transition: transform 0.3s ease;
        }
        .highlight-btn:hover {
            background: #001F4A; /* Darker Astros Blue */
            transform: scale(1.05);
        }

        /* Hero Section */
        .hero {
            height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            background: rgba(0, 0, 0, 0.6); /* Black */
            padding: 20px;
            animation: slideIn 1.5s ease-in-out;
        }
        @keyframes slideIn {
            from { transform: translateY(-50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        .hero h1 {
            font-size: 4rem;
            font-weight: 700;
            text-transform: uppercase;
            animation: bounceIn 1.5s ease-in-out;
        }
        @keyframes bounceIn {
            0% { transform: scale(0.9); opacity: 0; }
            50% { transform: scale(1.1); opacity: 0.7; }
            100% { transform: scale(1); opacity: 1; }
        }
        .hero p {
            font-size: 1.5rem;
            margin-top: 20px;
            animation: fadeIn 2s ease-in-out 0.5s forwards;
            opacity: 0;
        }
        .btn-custom {
            background: #002D62; /* Astros Blue */
            color: white;
            padding: 15px 30px;
            border-radius: 50px;
            font-size: 1.3rem;
            font-weight: 600;
            transition: all 0.3s ease-in-out;
            margin-top: 30px;
        }
        .btn-custom:hover {
            background: #001F4A; /* Darker Astros Blue */
            transform: scale(1.08) translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 45, 98, 0.4); /* Astros Blue shadow */
        }

        /* Footer Styles */
        .footer {
            background: rgba(0, 0, 0, 0.8); /* Black */
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
            from { text-shadow: 0 0 10px rgba(0, 45, 98, 0.5); } /* Astros Blue glow */
            to { text-shadow: 0 0 20px rgba(128, 128, 128, 0.8); } /* Grey glow */
        }

        /* Animation Delays */
        .animate-delay-1 {
            animation-delay: 0.5s;
        }
        .animate-delay-2 {
            animation-delay: 1s;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="home.jsp">Mega City Cab</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="home.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="aboutUs.jsp">About</a></li>
                <li class="nav-item"><a class="nav-link" href="services.jsp">Services</a></li>
                <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
                <li class="nav-item ms-4"><a class="nav-link highlight-btn" href="login.jsp">Login</a></li>
                <li class="nav-item ms-4"><a class="nav-link highlight-btn" href="help.jsp">Help</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
// Session check (only addition)
HttpSession userSession = request.getSession(false);
boolean isLoggedIn = (userSession != null && userSession.getAttribute("username") != null);
%>

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
        /* EXACTLY THE SAME STYLES AS ORIGINAL */
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
            color: white !important; 
        }
        .navbar-nav .nav-link {
            font-size: 1.1rem;
            font-weight: 500;
            color: white !important;
            transition: all 0.3s ease;
        }
        .navbar-nav .nav-link:hover {
            color: #808080 !important;
            transform: translateY(-3px);
        }
        .highlight-btn {
            font-weight: bold;
            padding: 10px 20px;
            border-radius: 8px;
            background: #002D62;
            color: white !important;
            transition: transform 0.3s ease;
        }
        .highlight-btn:hover {
            background: #001F4A;
            transform: scale(1.05);
        }
        /* ... rest of original styles unchanged ... */
    </style>
</head>
<body>

<!-- Navbar - Only modified login button section -->
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
                
                <!-- Only changed element: Login/Logout toggle -->
                <li class="nav-item ms-4">
                    <% if(isLoggedIn) { %>
                        <a class="nav-link highlight-btn" href="UserController?action=logout">
                            Logout
                        </a>
                    <% } else { %>
                        <a class="nav-link highlight-btn" href="login.jsp">
                            Login
                        </a>
                    <% } %>
                </li>
                
                <!-- Unchanged help button -->
                <li class="nav-item ms-4"><a class="nav-link highlight-btn" href="help.jsp">Help</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Rest of the code remains EXACTLY THE SAME -->
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
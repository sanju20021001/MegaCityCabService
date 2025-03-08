<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Mega City Cab</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <style>
        body {
            background: url('images/home.jpg') no-repeat center center fixed;
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

        /* Hero Section */
        .hero {
            height: 20vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            background: rgba(0, 0, 0, 0.6);
            padding: 20px;
            animation: slideIn 1.5s ease-in-out;
        }
        @keyframes slideIn {
            from { transform: translateY(-50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        .hero h1 {
            font-size: 1.5rem;
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
            font-size: 0.5rem;
            margin-top: 20px;
            animation: fadeIn 2s ease-in-out 0.5s forwards;
            opacity: 0;
        }


        /* Login Section */
        .login {
            max-width: 400px;
            margin: 50px auto;
            padding: 30px;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 12px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            animation: fadeInUp 1.5s ease-in-out;
        }
        @keyframes fadeInUp {
            from { transform: translateY(30px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        .login h2 {
            font-size: 2rem;
            font-weight: 700;
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        .login input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
        }
        .login button {
            width: 100%;
            padding: 10px;
            background: #ff9800;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1.1rem;
            transition: all 0.3s ease;
        }
        .login button:hover {
            background: #e68900;
            transform: scale(1.05);
        }
        .login p {
            text-align: center;
            margin-top: 15px;
            color: #333;
        }
        .login a {
            color: #ff9800;
            text-decoration: none;
            font-weight: 600;
        }
        .login a:hover {
            text-decoration: underline;
        }

        /* Error Message */
        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 15px;
            font-weight: 500;
            animation: fadeIn 1s ease-in-out;
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
    <header class="bg-dark text-white p-3">
        <nav class="container d-flex justify-content-between">
            <div class="logo">Mega City Cab</div>
            <ul class="nav">
                <li class="nav-item"><a class="nav-link text-white" href="#home">Home</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="#about">About</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="#services">Services</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="#contact">Contact</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="#login">Login</a></li>
            </ul>
        </nav>
    </header>
    
    <section class="hero" id="home">
        <div class="container">
            <h1>Fast, Reliable, and Affordable Cab Services</h1>
            <p>Book your ride with us and enjoy a comfortable journey across Colombo.</p>
            <button class="btn btn-custom" onclick="bookNow()">Book Now</button>
        </div>
    </section>
    
    <section class="login" id="login">
        <h2 class="text-center">Login</h2>
        
        <!-- Error message section -->
        <c:if test="${not empty param.error}">
            <div class="error-message">
                <p>${param.error}</p>
            </div>
        </c:if>

        <form action="<%= request.getContextPath() %>/LoginServlet" method="post">
            <div class="mb-3">
                <input type="text" class="form-control" name="username" placeholder="Username" required>
            </div>
            <div class="mb-3">
                <input type="password" class="form-control" name="password" placeholder="Password" required>
            </div>
            <button type="submit" class="btn btn-custom w-100">Login</button>
        </form>
        <p class="text-center mt-3">Don't have an account? <a href="register.html">Register here</a></p>
    </section>
    
    <footer class="text-center text-white bg-dark p-3">
        <p>&copy; 2024 Mega City Cab. All Rights Reserved.</p>
    </footer>
    
    <script>
        function bookNow() {
            alert("Booking feature coming soon!");
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
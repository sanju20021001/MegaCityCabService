<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="header.jsp" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Mega City Cab</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <!-- Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <style>
        /* Hero Section */
        .hero {
            height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            background: rgba(0, 0, 0, 0.6); /* Semi-transparent black overlay */
            padding: 20px;
            animation: fadeIn 1.5s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        /* Login Form Styles */
        .login-form {
            background: white; /* White background */
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
            padding: 40px;
            max-width: 500px;
            margin: 0 auto;
            animation: slideIn 1s ease-in-out;
        }
        @keyframes slideIn {
            from { transform: translateY(-50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        .login-form h5 {
            font-size: 2rem;
            font-weight: 700;
            color: #002D62; /* Astros Blue */
            margin-bottom: 20px;
        }
        .login-form input {
            background: rgba(255, 255, 255, 0.9); /* Light white background for inputs */
            border: 1px solid #ddd; /* Light gray border */
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 20px;
            color: #333; /* Dark text color */
            font-size: 1rem;
            transition: all 0.3s ease;
        }
        .login-form input:focus {
            background: white; /* White background on focus */
            border-color: #002D62; /* Astros Blue */
            box-shadow: 0 0 10px rgba(0, 45, 98, 0.5); /* Astros Blue shadow */
        }
        .login-form input::placeholder {
            color: rgba(0, 0, 0, 0.6); /* Darker placeholder text */
        }
        .btn-custom {
            background: #002D62; /* Astros Blue */
            color: white;
            padding: 15px 30px;
            border-radius: 50px;
            font-size: 1.1rem;
            font-weight: 600;
            transition: all 0.3s ease-in-out;
            border: none;
            width: 100%;
        }
        .btn-custom:hover {
            background: #001F4A; /* Darker Astros Blue */
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(0, 45, 98, 0.4); /* Astros Blue shadow */
        }
        .alert-danger {
            background: rgba(255, 87, 34, 0.8);
            border: none;
            border-radius: 10px;
            color: white;
            font-weight: 500;
            font-size: 1rem;
            padding: 10px;
            margin-bottom: 20px;
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
        .register-link {
            color: #002D62; /* Astros Blue */
            font-weight: 600;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        .register-link:hover {
            color: #001F4A; /* Darker Astros Blue */
        }
    </style>
</head>
<body>
    <!-- Hero Section -->
    <section class="hero">
        <div class="login-form">
            <h5>Login - Mega City Cab</h5>

            <!-- Display Error Message -->
            <% String error = request.getParameter("error"); %>
            <% if (error != null && !error.isEmpty()) { %>
                <div class="alert alert-danger"><%= error %></div>
            <% } %>

            <!-- Display Success Message -->
            <% String success = request.getParameter("success"); %>
            <% if (success != null && !success.isEmpty()) { %>
                <div class="alert alert-success"><%= success %></div>
            <% } %>

            <!-- Display General Message -->
            <% String message = request.getParameter("message"); %>
            <% if (message != null && !message.isEmpty()) { %>
                <div class="alert alert-success"><%= message %></div>
            <% } %>

            <!-- Login Form -->
            <form action="UserController" method="post" onsubmit="return validateLogin()">
                <input type="hidden" name="action" value="login">
                <div class="mb-3">
                    <input type="text" class="form-control" name="email" id="email" placeholder="Email" required>
                </div>
                <div class="mb-3">
                    <input type="password" class="form-control" name="password" id="password" placeholder="Password" required>
                </div>
                <button type="submit" class="btn btn-custom">Login</button>
            </form>
            <p class="text-center mt-3">Don't have an account? <a href="register.jsp" class="register-link">Register here</a></p>
        </div>
    </section>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    <!-- Form Validation -->
    <script>
        function validateLogin() {
            var email = document.getElementById("email").value;
            var password = document.getElementById("password").value;
            if (email.trim() === "" || password.trim() === "") {
                alert("All fields are required!");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
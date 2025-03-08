<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Mega City Cab</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <!-- Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <style>
        body {
             background: url('images/background.jpg') no-repeat center center fixed;
            font-family: 'Poppins', sans-serif;
            color: black; /* Changed to black for better readability */
            animation: fadeIn 1.5s ease-in;
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        .modal-content {
            background: white; /* Changed to white */
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            animation: slideIn 1s ease-in-out;
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            color: black; /* Ensure text is readable */
        }
        @keyframes slideIn {
            from { transform: translateY(-50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        .modal-title {
            font-size: 1.8rem;
            font-weight: 700;
            color: #002D62; /* Astros blue */
        }
        .btn-custom {
            background: linear-gradient(to right, #002D62, #004080); /* Astros blue gradient */
            color: white;
            padding: 12px 25px;
            border-radius: 50px;
            font-size: 1.1rem;
            font-weight: 600;
            transition: all 0.3s ease-in-out;
            border: none;
        }
        .btn-custom:hover {
            background: linear-gradient(to right, #001F4D, #002D62); /* Darker shade of Astros blue */
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(0, 45, 98, 0.4); /* Astros blue */
        }
        .alert {
            border-radius: 10px;
            font-weight: 500;
            font-size: 1rem;
            padding: 10px;
        }
        .alert-danger {
            background: rgba(255, 87, 34, 0.8);
            color: white;
        }
        .alert-success {
            background: rgba(76, 175, 80, 0.8);
            color: white;
        }
        a {
            color: #002D62; /* Astros blue */
        }
        a:hover {
            color: #004080; /* Darker shade of Astros blue */
        }
    </style>
</head>
<body>
    <!-- Registration Modal -->
    <div class="modal fade show" id="registerModal" tabindex="-1" aria-labelledby="registerModalLabel" aria-hidden="true" style="display: block;">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="registerModalLabel">Register</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <% String errorMessage = request.getParameter("error"); %>
                    <% if (errorMessage != null) { %>
                        <div class="alert alert-danger"><%= errorMessage %></div>
                    <% } %>

                    <% String successMessage = request.getParameter("success"); %>
                    <% if (successMessage != null) { %>
                        <div class="alert alert-success"><%= successMessage %></div>
                    <% } %>

                    <form action="UserController" method="post" class="register-form">
                        <input type="hidden" name="action" value="register">
                        <div class="mb-3">
                            <input type="text" class="form-control" name="name" placeholder="Full Name" required>
                        </div>
                        <div class="mb-3">
                            <input type="text" class="form-control" name="address" placeholder="Address" required>
                        </div>
                        <div class="mb-3">
                            <input type="text" class="form-control" name="nic" placeholder="NIC" required>
                        </div>
                        <div class="mb-3">
                            <input type="email" class="form-control" name="email" placeholder="Email" required>
                        </div>
                        <div class="mb-3">
                            <input type="text" class="form-control" name="phone" placeholder="Phone Number" required>
                        </div>
                        <div class="mb-3">
                            <input type="password" class="form-control" name="password" placeholder="Password" required>
                        </div>
                        <div class="mb-3">
                            <input type="password" class="form-control" name="confirmPassword" placeholder="Confirm Password" required>
                        </div>
                        <button type="submit" class="btn btn-custom w-100">Register</button>
                    </form>
                </div>
                <div class="modal-footer">
                    <p class="text-center w-100">Already have an account? <a href="login.jsp" style="color: #002D62;">Login here</a></p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
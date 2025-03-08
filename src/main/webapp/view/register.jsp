<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Mega City Cab</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <section class="register">
        <h2 class="text-center">Register</h2>

        <%-- Show error message if registration fails --%>
        <% String errorMessage = request.getParameter("error"); %>
        <% if (errorMessage != null) { %>
            <div class="alert alert-danger"><%= errorMessage %></div>
        <% } %>

        <form action="RegisterServlet" method="post">
            <div class="mb-3">
                <input type="text" class="form-control" name="regNumber" placeholder="Register Number" required>
            </div>
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
        <p class="text-center mt-3">Already have an account? <a href="login.jsp">Login here</a></p>
    </section>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="header.jsp" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Dashboard - Mega City Cab</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <style>
        body {
            background: url('images/background.jpg') no-repeat center center fixed;
            font-family: 'Poppins', sans-serif;
            color: white;
            animation: fadeIn 1.5s ease-in;
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        
        .features, .available-cars {
            padding: 60px 0;
        }
        .feature-card, .car-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 12px;
            padding: 20px;
            text-align: center;
            transition: all 0.3s ease-in-out;
            color: #333;
            margin-bottom: 20px;
        }
        .feature-card img, .car-card img {
            width: 100px;
            height: 100px;
            margin-bottom: 15px;
            border-radius: 10px;
        }
        .feature-card:hover, .car-card:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
        .feature-card .btn, .car-card .btn {
            background: #002D62; /* Astros Blue */
            color: white;
            padding: 8px 12px;
            border-radius: 5px;
            margin-top: 10px;
            transition: background 0.3s ease;
        }
        .feature-card .btn:hover, .car-card .btn:hover {
            background: #0047AB; /* Darker Astros Blue */
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
        
        .hero {
            height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            background: rgba(0, 0, 0, 0.6);
            padding: 20px;
            animation: slideIn 1.5s ease-in-out;
        }
        
        /* Icons and Additional Styling */
        .feature-card i, .car-card i {
            font-size: 48px;
            color: #002D62; /* Astros Blue */
            margin-bottom: 15px;
        }
        .car-card i {
            color: #002D62; /* Astros Blue */
        }
        .feature-card h3, .car-card h3 {
            font-size: 1.5rem;
            margin-bottom: 10px;
        }
        .feature-card p, .car-card p {
            font-size: 1rem;
            color: #666;
        }
    </style>
</head>
<body>
    <!-- Display Welcome Message -->
    <% String message = request.getParameter("message"); %>
    <% if (message != null && !message.isEmpty()) { %>
        <div class="alert alert-success text-center animate__animated animate__fadeInDown">
            <%= message %>
        </div>
    <% } %>

    <section class="available-cars text-center">
        <div class="container">
            <h1>Available Cars</h1>
            <div class="row">
                <div class="col-md-4">
                    <div class="car-card">
                        <i class="fas fa-car"></i>
                        <h3>Economy Sedan</h3>
                        <p>Comfortable and budget-friendly travel.</p>
                        <a href="bookingride.jsp" class="btn">Book Now</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="car-card">
                        <i class="fas fa-suv"></i>
                        <h3>Luxury SUV</h3>
                        <p>Spacious and premium rides for families.</p>
                        <a href="bookingride.jsp" class="btn">Book Now</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="car-card">
                        <i class="fas fa-car-side"></i>
                        <h3>Luxury Sedan</h3>
                        <p>Elegant rides for special occasions.</p>
                        <a href="bookingride.jsp" class="btn">Book Now</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <section class="features text-center">
        <div class="container">
            <h1>Customer Dashboard Features</h1>
            <div class="row">
                <div class="col-md-4">
                    <div class="feature-card">
                        <i class="fas fa-taxi"></i>
                        <h3>Book a Ride</h3>
                        <p>Quickly book a cab anytime.</p>
                        <a href="#" class="btn">Book Now</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-card">
                        <i class="fas fa-wallet"></i>
                        <h3>Multiple Payment Options</h3>
                        <p>Pay via cash, card, or wallet.</p>
                        <a href="#" class="btn">Manage Payments</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-card">
                        <i class="fas fa-history"></i>
                        <h3>Ride History</h3>
                        <p>View past rides and invoices.</p>
                        <a href="#" class="btn">View History</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-card">
                        <i class="fas fa-user-edit"></i>
                        <h3>Manage Profile</h3>
                        <p>Update personal and payment details.</p>
                        <a href="#" class="btn">Edit Profile</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-card">
                        <i class="fas fa-headset"></i>
                        <h3>Customer Support</h3>
                        <p>Get assistance anytime.</p>
                        <a href="#" class="btn">Contact Support</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-card">
                        <i class="fas fa-tags"></i>
                        <h3>Promotions</h3>
                        <p>Apply discount codes for savings.</p>
                        <a href="#" class="btn">View Offers</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <footer class="footer text-center py-3">
        <p>&copy; 2025 Mega City Cab. All Rights Reserved.</p>
    </footer>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
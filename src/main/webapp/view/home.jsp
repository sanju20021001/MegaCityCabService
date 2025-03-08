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
            background: linear-gradient(135deg, #1e3c72, #2a5298);
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
            background: #ff5722;
            color: white;
            padding: 8px 12px;
            border-radius: 5px;
            margin-top: 10px;
        }
        .feature-card .btn:hover, .car-card .btn:hover {
            background: #e64a19;
        }
    </style>
</head>
<body>
    <section class="available-cars text-center">
        <div class="container">
            <h1>Available Cars</h1>
            <div class="row">
                <div class="col-md-4">
                    <div class="car-card">
                        <img src="images/car1.jpg" alt="Economy Sedan">
                        <h3>Economy Sedan</h3>
                        <p>Comfortable and budget-friendly travel.</p>
                        <a href="#" class="btn">Book Now</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="car-card">
                        <img src="images/car2.jpg" alt="Luxury SUV">
                        <h3>Luxury SUV</h3>
                        <p>Spacious and premium rides for families.</p>
                        <a href="#" class="btn">Book Now</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="car-card">
                        <img src="images/car3.jpg" alt="Luxury Sedan">
                        <h3>Luxury Sedan</h3>
                        <p>Elegant rides for special occasions.</p>
                        <a href="#" class="btn">Book Now</a>
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
                        <img src="images/book_ride.png" alt="Book a Ride">
                        <h3>Book a Ride</h3>
                        <p>Quickly book a cab anytime.</p>
                        <a href="#" class="btn">Book Now</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-card">
                        <img src="images/payment.png" alt="Payment Options">
                        <h3>Multiple Payment Options</h3>
                        <p>Pay via cash, card, or wallet.</p>
                        <a href="#" class="btn">Manage Payments</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-card">
                        <img src="images/history.png" alt="Ride History">
                        <h3>Ride History</h3>
                        <p>View past rides and invoices.</p>
                        <a href="#" class="btn">View History</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-card">
                        <img src="images/profile.png" alt="Manage Profile">
                        <h3>Manage Profile</h3>
                        <p>Update personal and payment details.</p>
                        <a href="#" class="btn">Edit Profile</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-card">
                        <img src="images/support.png" alt="Customer Support">
                        <h3>Customer Support</h3>
                        <p>Get assistance anytime.</p>
                        <a href="#" class="btn">Contact Support</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-card">
                        <img src="images/promotions.png" alt="Promotions">
                        <h3>Promotions</h3>
                        <p>Apply discount codes for savings.</p>
                        <a href="#" class="btn">View Offers</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <footer class="footer">
        <p>&copy; 2025 Mega City Cab. All Rights Reserved.</p>
    </footer>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

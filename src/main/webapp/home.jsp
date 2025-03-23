<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="header.jsp" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Dashboard - Mega City Cab</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!-- Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <style>
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

        /* Booking Form Styling */
        .modal-content {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 12px;
            color: #333;
        }
        .modal-header {
            border-bottom: 1px solid #ddd;
            padding: 10px 15px;
        }
        .modal-title {
            font-size: 1.2rem;
            font-weight: 600;
            color: #002D62; /* Astros Blue */
        }
        .form-label {
            font-size: 0.9rem;
            font-weight: 500;
            color: #002D62; /* Astros Blue */
        }
        .form-control {
            font-size: 0.9rem;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 6px;
            transition: border-color 0.3s ease;
        }
        .form-control:focus {
            border-color: #002D62; /* Astros Blue */
            box-shadow: 0 0 5px rgba(0, 45, 98, 0.5); /* Astros Blue shadow */
        }
        .btn-primary {
            background: #002D62; /* Astros Blue */
            border: none;
            font-size: 0.9rem;
            padding: 8px;
            border-radius: 6px;
            transition: background 0.3s ease;
        }
        .btn-primary:hover {
            background: #0047AB; /* Darker Astros Blue */
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

    <!-- Available Cars Section -->
    <section class="available-cars text-center">
        <div class="container">
            <h1>Available Vehicles</h1>
            <div class="row">
                <div class="col-md-4">
                    <div class="car-card">
                        <i class="fas fa-car"></i>
                        <h3>Cars for Every Journey</h3>
                        <p>Comfortable and budget-friendly travel.</p>
                        <button class="btn" data-bs-toggle="modal" data-bs-target="#bookingModal">Book Now</button>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="car-card">
                        <i class="fas fa-taxi"></i>
                        <h3>Cabs for Quick Trips</h3>
                        <p>Spacious and premium quick rides.</p>
                        <button class="btn" data-bs-toggle="modal" data-bs-target="#bookingModal">Book Now</button>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="car-card">
                        <i class="fas fa-shuttle-van"></i>
                        <h3>Vans for Group Travel</h3>
                        <p>Elegant rides for family & friends.</p>
                        <button class="btn" data-bs-toggle="modal" data-bs-target="#bookingModal">Book Now</button>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="features text-center">
        <div class="container">
            <h1>Customer Dashboard</h1>
            <div class="row">
                <div class="col-md-4">
                    <div class="feature-card">
                        <i class="fas fa-taxi"></i>
                        <h3>Book a Ride</h3>
                        <p>Quickly book a cab anytime.</p>
                        <button class="btn" data-bs-toggle="modal" data-bs-target="#bookingModal">Book Now</button>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-card">
                        <i class="fas fa-wallet"></i>
                        <h3>Multiple Payment Options</h3>
                        <p>Pay via cash, card, or wallet.</p>
                        <a href="payment.jsp" class="btn">Manage Payments</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-card">
                        <i class="fas fa-history"></i>
                        <h3>View Bookings</h3>
                        <p>View past rides and invoices.</p>
                        <a href="BookingDetail.jsp" class="btn">View Bookings</a>
                    </div>
                </div>
          
            </div>
        </div>
    </section>

    <!-- Booking Modal -->
    <div class="modal fade" id="bookingModal" tabindex="-1">
        <div class="modal-dialog modal-md"> <!-- Smaller modal size -->
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Book Your Ride</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form id="bookingForm" action="<%= request.getContextPath() %>/BookingController" method="GET">
                        <input type="hidden" id="bookCarID" name="carID" value="001">
                        <input type="hidden" id="totalBill" name="totalBill">

                        <div class="mb-3">
                            <label class="form-label">Customer Name</label>
                            <input type="text" class="form-control" name="customer_name" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Address</label>
                            <textarea class="form-control" name="address" required></textarea>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Telephone Number</label>
                            <input type="text" class="form-control" name="telephone_number" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Pickup Location</label>
                            <input type="text" class="form-control" name="pickup_location" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Distance (Km)</label>
                            <input type="number" class="form-control" id="duration" name="duration" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Booking Date & Time</label>
                            <input type="datetime-local" class="form-control" name="orderDatetime" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Driver</label>
                            <select class="form-control" id="driver" name="driver_name" required>
                                <option value="Self Drive">Self Drive</option>
                                <option value="With a driver">With a driver</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Car Model</label>
                            <select class="form-control" id="carModel" name="car_model" required>
                                <option value="Suzuki Alto" data-price="4000">Suzuki Alto - Rs.4000</option>
                                <option value="Suzuki Wagon R" data-price="5000">Suzuki Wagon R - Rs.5000</option>
                                <option value="Toyota Prius" data-price="6000">Toyota Prius - Rs.6000</option>
                                <option value="Honda Vessel" data-price="6500">Honda Vessel - Rs.6500</option>
                                <option value="Toyota Land Cruiser" data-price="7000">Toyota Land Cruiser - Rs.7000</option>
                                <option value="Audi A3" data-price="8500">Audi A3 - Rs.8500</option>
                            </select>
                        </div>

                        <button type="button" class="btn btn-primary w-100" onclick="calculateBill()">Submit Booking</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Bill Summary Popup -->
    <div class="modal fade" id="billSummaryModal" tabindex="-1">
        <div class="modal-dialog modal-md"> <!-- Smaller modal size -->
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Bill Summary</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <p id="billDetails"></p>
                    <button type="submit" class="btn btn-success w-100" onclick="submitBooking()">Confirm & Generate Bill</button>
                </div>
							<button type="button" 
			        class="btn btn-primary btn-sm" 
			        onclick="window.location.href='payment.jsp'">
			  Make Payment
			</button>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer text-center py-3">
        <p>&copy; 2025 Mega City Cab. All Rights Reserved.</p>
    </footer>

    <!-- Bootstrap JS -->
    
<script>
document.addEventListener('DOMContentLoaded', () => {
    // Attach event listeners to book buttons (if .book-btn elements exist)
    document.querySelectorAll('.book-btn').forEach(btn => {
        btn.addEventListener('click', () => {
            let carID = btn.dataset.carId;
            console.log("Selected Car ID: ", carID); // Debugging
            document.getElementById('bookCarID').value = carID;
        });
    });

    // Calculate bill function
    window.calculateBill = function () {
        let duration = parseInt(document.getElementById("duration").value) || 0;
        let driver = document.getElementById("driver").value;
        let carModel = document.getElementById("carModel");
        let carPrice = parseInt(carModel.options[carModel.selectedIndex].getAttribute("data-price")) || 0;

        let bill = (duration * 40) + carPrice;
        if (driver === "With a driver") {
            bill += 5000;
        }

        let discount = bill * 0.2;
        let finalBill = bill - discount;

        document.getElementById("totalBill").value = finalBill;
        document.getElementById("billDetails").innerHTML = `
            <strong>Base Price:</strong> Rs.${carPrice} <br>
            <strong>Duration Charge (Rs.40/km):</strong> Rs.${duration * 40} <br>
            ${driver == "With a driver" ? "<strong>Driver Fee:</strong> Rs.5000 <br>" : ""}
            <strong>Subtotal:</strong> Rs.${bill} <br>
            <strong>Discount (20%):</strong> -Rs.${discount} <br>
            <strong>Total Bill:</strong> <span style="color:green;">Rs.${finalBill}</span>
        `;

        // Show the bill summary modal
        new bootstrap.Modal(document.getElementById("billSummaryModal")).show();
    };

    // Submit booking function
    window.submitBooking = function () {
        // Validate form fields before submission
        let form = document.getElementById("bookingForm");
        if (form.checkValidity()) {
            form.submit();
        } else {
            alert("Please fill out all required fields correctly.");
        }
    };
});
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
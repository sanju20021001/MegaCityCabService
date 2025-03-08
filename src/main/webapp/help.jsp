<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<jsp:include page="header.jsp" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Help Page - Cab Services</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

    <!-- Animate.css for animations -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">

    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <!-- Map Integration (Leaflet.js) -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>

    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-image: url('home.jpg'); /* Background image set to home.jpg */
            background-size: cover;
            background-position: center;
            color: #333;
            margin: 0;
            padding: 0;
            height: 100vh;
            overflow-x: hidden;
        }
        h1, h2 {
            color: #fff;
        }
        .container {
            position: relative;
            z-index: 1;
        }
        .section {
            background-color: rgba(255, 255, 255, 0.9); /* Light semi-transparent background */
            border-radius: 12px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            padding: 25px;
            transition: all 0.3s ease-in-out;
        }
        .section:hover {
            transform: scale(1.02);
            box-shadow: 0px 6px 16px rgba(0, 0, 0, 0.2);
        }
        .faq {
            margin-left: 20px;
        }
        .contact-info p {
            margin: 5px 0;
        }
        .faq p {
            font-size: 14px;
        }

        /* Section Headings */
        h2 {
            color: #002D62; /* Astros blue */
            margin-bottom: 15px;
        }

        /* Animation for page load */
        .section {
            opacity: 0;
            transform: translateY(20px);
        }
        .section.visible {
            opacity: 1;
            transform: translateY(0);
            transition: opacity 0.5s, transform 0.5s;
        }

        /* Button Styles */
        .btn-primary {
            background-color: #002D62; /* Astros blue */
            border-color: #002D62;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 25px;
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #001f3f; /* Darker blue on hover */
            border-color: #001f3f;
            transform: translateY(-2px);
        }

        /* Icon Styles */
        .icon {
            font-size: 24px;
            margin-right: 10px;
            color: #002D62; /* Astros blue */
        }

        /* Footer Styles */
        .footer {
            background-color: rgba(0, 0, 0, 0.7); /* Semi-transparent black background */
            padding: 15px;
            border-radius: 12px;
            margin-top: 30px;
            text-align: center;
            color: #fff;
        }

        /* Testimonials Section */
        .testimonial {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 20px;
        }
        .testimonial img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            margin-right: 15px;
        }

        /* Map Section */
        #map {
            height: 300px;
            border-radius: 12px;
            margin-bottom: 20px;
        }

        /* Dark Mode Toggle */
        .dark-mode {
            background-color: #333;
            color: #fff;
        }
        .dark-mode .section {
            background-color: rgba(0, 0, 0, 0.7);
            color: #fff;
        }
        .dark-mode h2 {
            color: #002D62; /* Astros blue */
        }

        /* Progress Bar */
        .progress-bar {
            background-color: #002D62; /* Astros blue */
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .section {
                padding: 15px;
            }
            h1 {
                font-size: 28px;
            }
            h2 {
                font-size: 22px;
            }
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <div class="header animate__animated animate__fadeInDown">
        <h1 class="text-center mb-4">How Can We Help?</h1>
        <div class="text-center">
            <button id="darkModeToggle" class="btn btn-secondary">
                <i class="fas fa-moon"></i> Dark Mode
            </button>
        </div>
    </div>

    <div class="section animate__animated animate__fadeInUp">
        <h2><i class="fas fa-car icon"></i>How to Book a Cab:</h2>
        <div class="progress mb-3">
            <div class="progress-bar" role="progressbar" style="width: 20%;" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
        </div>
        <p>Follow these simple steps to book your ride:</p>
        <ol>
            <li>Open the app or visit our website.</li>
            <li>Enter your pickup location and destination.</li>
            <li>Choose the type of cab you prefer.</li>
            <li>Confirm your details and click "Book Now."</li>
            <li>Wait for the cab to arrive – it's that simple!</li>
        </ol>
        <div class="text-center">
            <a href="#" class="btn btn-primary">Book a Cab Now</a>
        </div>
    </div>

    <div class="section animate__animated animate__fadeInUp">
        <h2><i class="fas fa-dollar-sign icon"></i>Pricing:</h2>
        <p>Our pricing is transparent and affordable. Here's what you need to know:</p>
        <ul>
            <li>Prices are clearly shown before booking.</li>
            <li>Special discounts and deals for regular users.</li>
            <li>No hidden charges – you only pay what you see!</li>
        </ul>
    </div>

    <div class="section animate__animated animate__fadeInUp">
        <h2><i class="fas fa-phone icon"></i>Contacting Us:</h2>
        <p>If you have any questions or need assistance, reach out to us via:</p>
        <div class="contact-info">
            <p><strong>Phone:</strong> <%= request.getAttribute("phoneNumber") != null ? request.getAttribute("phoneNumber") : "Insert Phone Number" %></p>
            <p><strong>Email:</strong> <%= request.getAttribute("email") != null ? request.getAttribute("email") : "Insert Email Address" %></p>
            <p><strong>Live Chat:</strong> Available on our website/app.</p>
        </div>
        <div class="text-center mt-3">
            <a href="#" class="btn btn-primary">Start Live Chat</a>
        </div>
    </div>

    <div class="section animate__animated animate__fadeInUp">
        <h2><i class="fas fa-question-circle icon"></i>FAQs:</h2>
        <div class="faq">
            <div class="accordion" id="faqAccordion">
                <div class="accordion-item">
                    <h3 class="accordion-header" id="faq1">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse1" aria-expanded="true" aria-controls="collapse1">
                            How do I know when my cab will arrive?
                        </button>
                    </h3>
                    <div id="collapse1" class="accordion-collapse collapse show" aria-labelledby="faq1" data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            You will receive an estimated arrival time when you book your ride.
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h3 class="accordion-header" id="faq2">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse2" aria-expanded="false" aria-controls="collapse2">
                            What if I need to cancel my ride?
                        </button>
                    </h3>
                    <div id="collapse2" class="accordion-collapse collapse" aria-labelledby="faq2" data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            You can cancel your ride directly in the app or website. No cancellation fees apply if done early.
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h3 class="accordion-header" id="faq3">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse3" aria-expanded="false" aria-controls="collapse3">
                            Can I pay with cash?
                        </button>
                    </h3>
                    <div id="collapse3" class="accordion-collapse collapse" aria-labelledby="faq3" data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            Yes, we accept both cash and card payments.
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="section animate__animated animate__fadeInUp">
        <h2><i class="fas fa-tools icon"></i>Troubleshooting:</h2>
        <p>If you're having issues with the app or website, please check the following:</p>
        <ul>
            <li>Ensure you have a stable internet connection.</li>
            <li>If the app isn’t working, try restarting it or check for updates in your app store.</li>
        </ul>
    </div>

    <div class="section animate__animated animate__fadeInUp">
        <h2><i class="fas fa-map-marker-alt icon"></i>Find Us:</h2>
        <div id="map"></div>
    </div>

    <div class="section animate__animated animate__fadeInUp">
        <h2><i class="fas fa-comments icon"></i>Testimonials:</h2>
        <div class="testimonial">
            <div class="d-flex align-items-center">
                <img src="user1.jpg" alt="User 1">
                <div>
                    <p>"Great service! The app is easy to use, and the drivers are always on time."</p>
                    <p><strong>- John Doe</strong></p>
                </div>
            </div>
        </div>
        <div class="testimonial">
            <div class="d-flex align-items-center">
                <img src="user2.jpg" alt="User 2">
                <div>
                    <p>"Affordable pricing and excellent customer support. Highly recommended!"</p>
                    <p><strong>- Jane Smith</strong></p>
                </div>
            </div>
        </div>
    </div>

    <div class="footer animate__animated animate__fadeInUp">
        <div class="social-links mb-3">
            <a href="#" class="text-white me-3"><i class="fab fa-facebook-f"></i></a>
            <a href="#" class="text-white me-3"><i class="fab fa-twitter"></i></a>
            <a href="#" class="text-white me-3"><i class="fab fa-instagram"></i></a>
            <a href="#" class="text-white"><i class="fab fa-linkedin-in"></i></a>
        </div>
        <p>&copy; 2023 Cab Services. All rights reserved.</p>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        const sections = document.querySelectorAll('.section');
        sections.forEach((section, index) => {
            setTimeout(() => {
                section.classList.add('visible');
            }, index * 200); // Delay each section animation
        });

        // Dark Mode Toggle
        const darkModeToggle = document.getElementById('darkModeToggle');
        darkModeToggle.addEventListener('click', () => {
            document.body.classList.toggle('dark-mode');
            darkModeToggle.innerHTML = document.body.classList.contains('dark-mode') ?
                '<i class="fas fa-sun"></i> Light Mode' : '<i class="fas fa-moon"></i> Dark Mode';
        });

        // Map Integration
        const map = L.map('map').setView([51.505, -0.09], 13); // Default location
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '© OpenStreetMap contributors'
        }).addTo(map);
        L.marker([51.505, -0.09]).addTo(map)
            .bindPopup('Our Office Location')
            .openPopup();
    });
</script>

</body>
</html>
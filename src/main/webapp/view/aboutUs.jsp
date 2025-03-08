<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Cab Services</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

    <!-- Animate.css for animations -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">

    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-image: url('about-bg.jpg'); /* Background image for the About page */
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

        /* Section Headings */
        h2 {
            color: #ff7f50; /* Orange color */
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

        /* Team Member Cards */
        .team-member {
            text-align: center;
            margin-bottom: 20px;
        }
        .team-member img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            margin-bottom: 15px;
            border: 4px solid #ff7f50;
        }
        .team-member h4 {
            margin: 10px 0 5px;
            color: #ff7f50;
        }
        .team-member p {
            font-size: 14px;
            color: #666;
        }

        /* Mission and Values Section */
        .mission-values {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .mission-values .card {
            flex: 1 1 300px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }
        .mission-values .card:hover {
            transform: translateY(-5px);
            box-shadow: 0px 6px 16px rgba(0, 0, 0, 0.2);
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
        <h1 class="text-center mb-4">About Us</h1>
        <p class="text-center text-white">Your trusted partner in safe and reliable cab services.</p>
    </div>

    <!-- Our Story Section -->
    <div class="section animate__animated animate__fadeInUp">
        <h2><i class="fas fa-history icon"></i>Our Story</h2>
        <p>Founded in 2010, Cab Services has grown from a small local startup to a leading name in the transportation industry. Our mission is to provide safe, affordable, and reliable cab services to our customers, ensuring a seamless travel experience every time.</p>
        <p>Over the years, we've expanded our services to multiple cities, partnered with thousands of drivers, and served millions of happy customers. We take pride in our commitment to excellence and customer satisfaction.</p>
    </div>

    <!-- Mission and Values Section -->
    <div class="section animate__animated animate__fadeInUp">
        <h2><i class="fas fa-bullseye icon"></i>Mission & Values</h2>
        <div class="mission-values">
            <div class="card">
                <h3>Our Mission</h3>
                <p>To revolutionize urban transportation by providing safe, affordable, and eco-friendly cab services that prioritize customer convenience and satisfaction.</p>
            </div>
            <div class="card">
                <h3>Our Vision</h3>
                <p>To become the most trusted and innovative cab service provider globally, setting new standards in the transportation industry.</p>
            </div>
            <div class="card">
                <h3>Our Values</h3>
                <ul>
                    <li>Customer First</li>
                    <li>Safety Above All</li>
                    <li>Innovation and Excellence</li>
                    <li>Sustainability</li>
                </ul>
            </div>
        </div>
    </div>

    <!-- Meet the Team Section -->
    <div class="section animate__animated animate__fadeInUp">
        <h2><i class="fas fa-users icon"></i>Meet the Team</h2>
        <div class="row">
            <div class="col-md-4 team-member">
                <img src="team1.jpg" alt="John Doe">
                <h4>John Doe</h4>
                <p>CEO & Founder</p>
            </div>
            <div class="col-md-4 team-member">
                <img src="team2.jpg" alt="Jane Smith">
                <h4>Jane Smith</h4>
                <p>Operations Manager</p>
            </div>
            <div class="col-md-4 team-member">
                <img src="team3.jpg" alt="Mike Johnson">
                <h4>Mike Johnson</h4>
                <p>Head of Technology</p>
            </div>
        </div>
    </div>

    <!-- Footer -->
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
    });
</script>

</body>
</html>
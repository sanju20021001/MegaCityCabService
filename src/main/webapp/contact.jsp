<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="header.jsp" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Mega City Cab</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <style>
        body {
            background: url('images/contact-bg.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Poppins', sans-serif;
            color: white;
            animation: fadeIn 1.5s ease-in;
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        /* Contact Section */
        .contact {
            padding: 80px 0;
            background: rgba(0, 0, 0, 0.6);
        }
        .contact h1 {
            font-size: 3.5rem;
            font-weight: 700;
            text-align: center;
            margin-bottom: 50px;
            animation: fadeIn 1.5s ease-in-out;
        }
        .contact-form {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 12px;
            padding: 30px;
            margin: 0 auto;
            max-width: 600px;
            animation: fadeInUp 1s ease-in-out;
        }
        @keyframes fadeInUp {
            from { transform: translateY(30px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        .contact-form input,
        .contact-form textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 1rem;
            color: #333;
        }
        .contact-form textarea {
            height: 150px;
            resize: none;
        }
        .contact-form button {
            background: linear-gradient(to right, #ff9800, #ff5722);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.3s ease;
        }
        .contact-form button:hover {
            background: linear-gradient(to right, #e68900, #d84315);
            transform: scale(1.05);
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
    <section class="contact">
        <div class="container">
            <h1 class="animate__animated animate__fadeInDown">Contact Us</h1>
            <div class="contact-form">
                <form action="#" method="post">
                    <input type="text" name="name" placeholder="Your Name" required>
                    <input type="email" name="email" placeholder="Your Email" required>
                    <input type="text" name="subject" placeholder="Subject" required>
                    <textarea name="message" placeholder="Your Message" required></textarea>
                    <button type="submit">Send Message</button>
                </form>
            </div>
        </div>
    </section>
    
    <footer class="footer text-white">
        <p>&copy; 2025 Mega City Cab. All Rights Reserved.</p>
    </footer>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

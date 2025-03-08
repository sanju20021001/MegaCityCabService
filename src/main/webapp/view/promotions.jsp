<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Promotions - Mega City Cab</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            font-family: 'Poppins', sans-serif;
            color: white;
        }
        .promotions-list {
            background: rgba(255, 255, 255, 0.95);
            padding: 20px;
            border-radius: 12px;
            color: #333;
            margin: 50px auto;
            max-width: 600px;
        }
        .promotions-list h2 {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="promotions-list">
            <h2>Available Promotions</h2>
            <ul class="list-group">
                <li class="list-group-item">Get 10% off on your first ride! Use code: <strong>WELCOME10</strong></li>
                <li class="list-group-item">Flat ₹100 off on rides above ₹500. Use code: <strong>FLAT100</strong></li>
                <li class="list-group-item">20% off on Luxury SUV rides. Use code: <strong>LUXURY20</strong></li>
            </ul>
            <form action="ride" method="post" class="mt-4">
                <input type="hidden" name="action" value="promotions">
                <div class="mb-3">
                    <label for="discountCode" class="form-label">Enter Discount Code</label>
                    <input type="text" class="form-control" id="discountCode" name="discountCode" required>
                </div>
                <button type="submit" class="btn btn-primary">Apply Code</button>
            </form>
        </div>
    </div>
</body>
</html>
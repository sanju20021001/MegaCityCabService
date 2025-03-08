<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Support - Mega City Cab</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            font-family: 'Poppins', sans-serif;
            color: white;
        }
        .support-form {
            background: rgba(255, 255, 255, 0.95);
            padding: 20px;
            border-radius: 12px;
            color: #333;
            margin: 50px auto;
            max-width: 600px;
        }
        .support-form h2 {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="support-form">
            <h2>Customer Support</h2>
            <form action="ride" method="post">
                <input type="hidden" name="action" value="support">
                <div class="mb-3">
                    <label for="issue" class="form-label">Describe Your Issue</label>
                    <textarea class="form-control" id="issue" name="issue" rows="5" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </div>
</body>
</html>
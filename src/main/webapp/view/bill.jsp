<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.datapackage.models.Bill" %>
<jsp:include page="header.jsp" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            padding: 20px;
        }
        .bill-container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .bill-header {
            text-align: center;
            margin-bottom: 20px;
        }
        .bill-header h1 {
            color: #ff9800;
        }
        .bill-details {
            margin-bottom: 20px;
        }
        .bill-details table {
            width: 100%;
            border-collapse: collapse;
        }
        .bill-details th, .bill-details td {
            padding: 10px;
            border: 1px solid #ddd;
        }
        .bill-details th {
            background-color: #f8f9fa;
        }
        .total-amount {
            text-align: right;
            font-size: 1.2rem;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="bill-container">
        <div class="bill-header">
            <h1>Invoice</h1>
        </div>

        <% Bill bill = (Bill) request.getAttribute("bill"); %>
        <% if (bill != null) { %>
            <div class="bill-details">
                <table>
                    <tr>
                        <th>Booking ID</th>
                        <td><%= bill.getBookingId() %></td>
                    </tr>
                    <tr>
                        <th>Customer Name</th>
                        <td><%= bill.getCustomerName() %></td>
                    </tr>
                    <tr>
                        <th>Pickup Location</th>
                        <td><%= bill.getPickupLocation() %></td>
                    </tr>
                    <tr>
                        <th>Drop Location</th>
                        <td><%= bill.getDropLocation() %></td>
                    </tr>
                    <tr>
                        <th>Distance (km)</th>
                        <td><%= String.format("%.2f", bill.getDistance()) %></td>
                    </tr>
                    <tr>
                        <th>Fare</th>
                        <td>₹<%= String.format("%.2f", bill.getFare()) %></td>
                    </tr>
                    <tr>
                        <th>GST (18%)</th>
                        <td>₹<%= String.format("%.2f", bill.getGst()) %></td>
                    </tr>
                </table>
            </div>
            <div class="total-amount">
                Total Amount: ₹<%= String.format("%.2f", bill.getTotalAmount()) %>
            </div>
        <% } else { %>
            <div class="alert alert-danger">No bill details found.</div>
        <% } %>
    </div>
</body>
</html>
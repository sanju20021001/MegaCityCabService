<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="header.jsp" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Secure Payment - Mega City Cab</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .payment-container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            padding: 2rem;
            margin: 5rem auto;
            max-width: 800px;
            animation: slideInUp 1s ease-in-out;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.12);
        }

        .payment-header {
            text-align: center;
            margin-bottom: 2rem;
            padding: 1rem;
            border-bottom: 2px solid #002D62;
        }

        .payment-methods {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .method-card {
            background: white;
            border-radius: 10px;
            padding: 1.5rem;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
            border: 2px solid transparent;
        }

        .method-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 45, 98, 0.1);
            border-color: #002D62;
        }

        .method-card i {
            font-size: 2.5rem;
            color: #002D62;
            margin-bottom: 1rem;
        }

        .payment-form .form-control {
            background: rgba(255, 255, 255, 0.9);
            border: 2px solid #ddd;
            border-radius: 8px;
            padding: 1rem;
            margin-bottom: 1.5rem;
            transition: all 0.3s ease;
        }

        .payment-form .form-control:focus {
            border-color: #002D62;
            box-shadow: 0 0 8px rgba(0, 45, 98, 0.2);
        }

        .card-details-group {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1.5rem;
        }

        .btn-pay {
            background: #002D62;
            color: white;
            padding: 1rem 2rem;
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.3s ease;
            width: 100%;
        }

        .btn-pay:hover {
            background: #001F4A;
            transform: translateY(-2px);
        }

        .payment-summary {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 1.5rem;
            margin-top: 2rem;
        }

        .summary-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 1rem;
            padding: 0.5rem 0;
            border-bottom: 1px solid #eee;
        }

        @keyframes slideInUp {
            from { transform: translateY(50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
    </style>
</head>
<body>
    <!-- Payment Container -->
    <div class="container">
        <div class="payment-container animate__animated animate__fadeInUp">
            <div class="payment-header">
                <h2 class="text-astros"><i class="fas fa-lock me-2"></i>Secure Payment Gateway</h2>
                <p class="text-muted">Complete your payment securely</p>
            </div>

            <!-- Payment Methods -->
            <div class="payment-methods">
                <div class="method-card active">
                    <i class="fab fa-cc-visa"></i>
                    <h5>Credit/Debit Card</h5>
                    <p>Visa, Mastercard, AMEX</p>
                </div>
                <div class="method-card">
                    <i class="fas fa-wallet"></i>
                    <h5>Digital Wallet</h5>
                    <p>PayPal, Google Pay</p>
                </div>
                <div class="method-card">
                    <i class="fas fa-money-bill-wave"></i>
                    <h5>Cash Payment</h5>
                    <p>Pay driver directly</p>
                </div>
            </div>

            <!-- Payment Form -->
            <form class="payment-form">
                <div class="card-details-group">
                    <div>
                        <label>Card Number</label>
                        <input type="text" class="form-control" placeholder="1234 5678 9012 3456" required>
                    </div>
                    <div>
                        <label>Card Holder Name</label>
                        <input type="text" class="form-control" placeholder="John Doe" required>
                    </div>
                </div>

                <div class="card-details-group">
                    <div>
                        <label>Expiration Date</label>
                        <input type="text" class="form-control" placeholder="MM/YY" required>
                    </div>
                    <div>
                        <label>CVV</label>
                        <input type="text" class="form-control" placeholder="123" required>
                    </div>
                </div>

                <!-- Payment Summary -->
                <div class="payment-summary">
                    <h5 class="mb-3">Payment Summary</h5>
                    <div class="summary-item">
                        <span>Base Fare:</span>
                        <span>Rs.4500.00</span>
                    </div>
                    <div class="summary-item">
                        <span>Distance Charge:</span>
                        <span>Rs.1200.00</span>
                    </div>
                    <div class="summary-item">
                        <span>Service Fee:</span>
                        <span>Rs.300.00</span>
                    </div>
                    <div class="summary-item text-astros fw-bold">
                        <span>Total Amount:</span>
                        <span>Rs.6000.00</span>
                    </div>
                </div>

                <button type="submit" class="btn btn-pay">
                    <i class="fas fa-lock me-2"></i>Pay Now
                </button>
            </form>
        </div>
    </div>

    <!-- Footer -->

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Activate payment method selection
        document.querySelectorAll('.method-card').forEach(card => {
            card.addEventListener('click', () => {
                document.querySelectorAll('.method-card').forEach(c => c.classList.remove('active'));
                card.classList.add('active');
            });
        });

        // Card number formatting
        document.querySelector('input[placeholder="1234 5678 9012 3456"]').addEventListener('input', function(e) {
            this.value = this.value.replace(/\W/gi, '').replace(/(.{4})/g, '$1 ').trim();
        });

        // Expiry date formatting
        document.querySelector('input[placeholder="MM/YY"]').addEventListener('input', function(e) {
            this.value = this.value
                .replace(/^([1-9]\/|[2-9])$/g, '0$1/')
                .replace(/^(0[1-9]{1}|1[0-2]{1})$/g, '$1')
                .replace(/^([0-1]{1})([3-9]{1})$/g, '0$1/$2')
                .replace(/^(\d\d)(\d)$/g, '$1/$2')
                .replace(/^(\d\d\/\d\d)(\d+)$/g, '$1')
                .replace(/\D/g, '');
        });
    </script>
</body>
</html>
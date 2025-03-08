<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.datapackage.dao.CarDAO" %>
<%@ page import="com.datapackage.models.Car" %>

<%
    // Initialize CarDAO and fetch data
    CarDAO carDAO = new CarDAO();
    List<Car> carList = carDAO.getAllCars(); // Fetch all cars
    List<Car> featuredCars = carDAO.getFeaturedCars(20); // Fetch featured cars
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Megacity Cab - Book Your Ride</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/@mui/material@5.11.5/umd/material-ui.production.min.css" rel="stylesheet">
    <style>
        .hero-section {
            background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)),
            url('/assets/images/b.jpg') center/cover;
            height: 60vh;
            display: flex;
            align-items: center;
            color: white;
        }

        .car-card {
            transition: transform 0.3s, box-shadow 0.3s;
            border-radius: 15px;
            overflow: hidden;
        }

        .car-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
        }

        .price-tag {
            position: absolute;
            top: 10px;
            right: 10px;
            background: rgba(0,0,0,0.7);
            color: white;
            padding: 5px 15px;
            border-radius: 20px;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .animate-fade-in {
            animation: fadeIn 0.6s ease-out;
        }

        .search-bar {
            background: rgba(255,255,255,0.9);
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        .search-bar input, .search-bar select {
            margin: 5px 0;
        }

        .no-results {
            display: none;
            text-align: center;
            padding: 20px;
            font-size: 1.2em;
            color: #666;
        }
    </style>
</head>
<body>
<!-- Hero Section -->
<div class="hero-section">
    <div class="container text-center">
        <h1 class="display-4 mb-4 animate-fade-in">Find Your Perfect Ride</h1>
        <div class="search-bar mx-auto" style="max-width: 800px;">
            <div class="row g-3">
                <div class="col-md-4">
                    <input type="text" id="searchBrand" class="form-control" placeholder="Brand (e.g., Toyota)">
                </div>
                <div class="col-md-3">
                    <input type="text" id="searchModel" class="form-control" placeholder="Model (e.g., Corolla)">
                </div>
                <div class="col-md-3">
                    <select id="searchPrice" class="form-select">
                        <option value="">Price Range</option>
                        <option value="0-50">$0 - $50</option>
                        <option value="50-100">$50 - $100</option>
                        <option value="100-200">$100 - $200</option>
                        <option value="200+">$200+</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <button id="searchButton" class="btn btn-primary w-100">Search</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Featured Cars Section -->
<div class="container py-5">
    <h2 class="text-center mb-5">Available Vehicles</h2>
    <div class="no-results" id="noResults">No cars match your search criteria.</div>
    <div class="row g-4" id="carList">
        <%
            if (featuredCars != null && !featuredCars.isEmpty()) {
                for (Car car : featuredCars) {
        %>
        <div class="col-md-4 col-lg-3 car-item" data-brand="<%= car.getBrand() %>" data-model="<%= car.getModel() %>" data-price="<%= car.getPricePerDay() %>">
            <div class="car-card card h-100 position-relative">
                <div class="price-tag">$<%= car.getPricePerDay() %>/day</div>
                <img src="<%= request.getContextPath() %><%= car.getImage() %>"
                     class="card-img-top"
                     alt="<%= car.getBrand() %> <%= car.getModel() %>"
                     style="height: 200px; object-fit: cover;">
                <div class="card-body">
                    <h5 class="card-title"><%= car.getBrand() %> <%= car.getModel() %></h5>
                    <p class="text-muted"><%= car.getLicensePlate() %></p>
                    <button class="btn btn-primary w-100 book-btn"
                            data-car-id="<%= car.getCarID() %>"
                            data-bs-toggle="modal"
                            data-bs-target="#bookingModal">
                        Book Now
                    </button>
                </div>
            </div>
        </div>
        <% }
            } else { %>
        <div class="col-12 text-center">
            <p>No cars available at the moment.</p>
        </div>
        <% } %>
    </div>
    <!-- Pagination -->
    <nav aria-label="Page navigation" class="mt-4">
        <ul class="pagination justify-content-center">
            <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
            <li class="page-item active"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">Next</a></li>
        </ul>
    </nav>
</div>

<!-- Booking Modal (unchanged) -->
<div class="modal fade" id="bookingModal" tabindex="-1">
    <!-- Modal content remains the same -->
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Search functionality
    document.getElementById('searchButton').addEventListener('click', () => {
        const brand = document.getElementById('searchBrand').value.toLowerCase();
        const model = document.getElementById('searchModel').value.toLowerCase();
        const priceRange = document.getElementById('searchPrice').value;
        const cars = document.querySelectorAll('.car-item');
        let visibleCount = 0;

        cars.forEach(car => {
            const carBrand = car.getAttribute('data-brand').toLowerCase();
            const carModel = car.getAttribute('data-model').toLowerCase();
            const carPrice = parseFloat(car.getAttribute('data-price'));

            const matchesBrand = carBrand.includes(brand);
            const matchesModel = carModel.includes(model);
            const matchesPrice = priceRange === "" || (
                priceRange === "0-50" && carPrice <= 50 ||
                priceRange === "50-100" && carPrice > 50 && carPrice <= 100 ||
                priceRange === "100-200" && carPrice > 100 && carPrice <= 200 ||
                priceRange === "200+" && carPrice > 200
            );

            if (matchesBrand && matchesModel && matchesPrice) {
                car.style.display = 'block';
                visibleCount++;
            } else {
                car.style.display = 'none';
            }
        });

        // Show/hide no results message
        const noResults = document.getElementById('noResults');
        if (visibleCount === 0) {
            noResults.style.display = 'block';
        } else {
            noResults.style.display = 'none';
        }
    });

    // Booking modal functionality
    document.querySelectorAll('.book-btn').forEach(btn => {
        btn.addEventListener('click', () => {
            document.getElementById('bookCarID').value = btn.dataset.carId;
        });
    });
</script>
</body>
</html>
<%@ page import="com.datapackage.dao.BookingDAO, com.datapackage.models.Booking, java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Keep all head elements the same -->
</head>
<body>
<div class="container">
    <div class="mb-4 text-center">
        <h2 class="fw-bold mb-3">📋 Current Bookings</h2>
        <p class="text-muted">Manage all customer reservations</p>
    </div>

    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
        <%
            BookingDAO bookingDAO = null;
            List<Booking> bookings = null;
            try {
                bookingDAO = new BookingDAO();
                bookings = bookingDAO.getAllBookings();
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<div class='alert alert-danger'>Error fetching bookings. Please try again later.</div>");
            }

            if (bookings != null && !bookings.isEmpty()) {
                for (Booking booking : bookings) {
        %>
        <div class="col">
            <div class="booking-card">
                <div class="card-header">
                    <h5 class="mb-0">Booking #<%= booking.getBookingId() %></h5>
                    <small><%= booking.getPickupTime() != null ? booking.getPickupTime().toString() : "N/A" %></small>
                </div>

                <div class="detail-group">
                    <div class="detail-label"><i class="fas fa-user me-2"></i>Customer</div>
                    <div class="detail-value"><%= booking.getCustomerName() %></div>

                    <div class="detail-label"><i class="fas fa-phone me-2"></i>Contact</div>
                    <div class="detail-value"><%= booking.getCustomerPhone() %></div>

                    <div class="detail-label"><i class="fas fa-map-marker-alt me-2"></i>Address</div>
                    <div class="detail-value"><%= booking.getAddress() %></div>
                </div>

                <div class="detail-group">
                    <div class="detail-label"><i class="fas fa-route me-2"></i>Trip Details</div>
                    <div class="row">
                        <div class="col-6">
                            <div class="detail-label">Pickup</div>
                            <div class="detail-value"><%= booking.getPickupLocation() %></div>
                        </div>
                        <div class="col-6">
                            <div class="detail-label">Distance</div>
                            <div class="detail-value"><%= booking.getDistance() %> km</div>
                        </div>
                    </div>
                </div>

                <div class="detail-group">
                    <div class="detail-label"><i class="fas fa-car me-2"></i>Vehicle Details</div>
                    <div class="row">
                        <div class="col-12">
                            <div class="detail-label">Driver</div>
                            <div class="detail-value"><%= booking.getDriver() %></div>
                        </div>
                    </div>
                </div>

                <div class="detail-group text-end p-3">
                    <form method="post" action="DeleteBookingController">
                        <input type="hidden" name="bookingId" value="<%= booking.getBookingId() %>">
                        <button type="submit" class="delete-btn">
                            <i class="fas fa-trash me-1"></i>
                            Delete Booking
                        </button>
                    </form>
                </div>
            </div>
        </div>
        <% }
            } else {
                out.println("<div class='col-12 text-center'><p>No bookings found.</p></div>");
            }
        %>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
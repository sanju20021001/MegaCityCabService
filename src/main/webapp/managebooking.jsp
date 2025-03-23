<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, com.datapackage.dao.BookingDAO, com.datapackage.models.Booking" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<jsp:include page="header.jsp" />

<%
BookingDAO bookingDAO = new BookingDAO();
List<Booking> bookingList = bookingDAO.getAllBookings();
String message = request.getParameter("success") != null ? request.getParameter("success") : request.getParameter("error");
String messageType = request.getParameter("success") != null ? "success" : "danger";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Bookings</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css">
    <style>
        .alert { position: fixed; top: 20px; right: 20px; z-index: 1000; }
    </style>
</head>
<body>
    <% if (message != null) { %>
        <div class="alert alert-<%= messageType %> alert-dismissible fade show">
            <%= message %>
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    <% } %>

    <div class="container mt-4">
        <h2>Manage Bookings</h2>
        <button class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#addBookingModal">
            Add New Booking
        </button>

        <table id="bookingsTable" class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Customer Name</th>
                    <th>Phone</th>
                    <th>Address</th>
                    <th>Pickup Location</th>
                    <th>Distance (km)</th>
                    <th>Pickup Time</th>
                    <th>Cab Type</th>
                    <th>Driver</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% for (Booking booking : bookingList) { %>
                <tr>
                    <td><%= booking.getBookingId() %></td>
                    <td><%= booking.getCustomerName() %></td>
                    <td><%= booking.getCustomerPhone() %></td>
                    <td><%= booking.getAddress() %></td>
                    <td><%= booking.getPickupLocation() %></td>
                    <td><%= booking.getDistance() %></td>
                    <td><%= booking.getPickupTime() != null ? booking.getPickupTime().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")) : "" %></td>
                    <td><%= booking.getCabType() %></td>
                    <td><%= booking.getDriver() %></td>
                    <td>
                        <button class="btn btn-warning btn-sm edit-btn" 
                                data-bs-toggle="modal" 
                                data-bs-target="#editBookingModal"
                                data-bookingid="<%= booking.getBookingId() %>"
                                data-customername="<%= booking.getCustomerName() %>"
                                data-customerphone="<%= booking.getCustomerPhone() %>"
                                data-address="<%= booking.getAddress() %>"
                                data-pickup="<%= booking.getPickupLocation() %>"
                                data-distance="<%= booking.getDistance() %>"
                                data-pickuptime="<%= booking.getPickupTime() != null ? booking.getPickupTime().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME) : "" %>"
                                data-cabtype="<%= booking.getCabType() %>"
                                data-driver="<%= booking.getDriver() %>">
                            Edit
                        </button>
                        <a href="BookingController?action=delete&bookingId=<%= booking.getBookingId() %>" 
                           class="btn btn-danger btn-sm"
                           onclick="return confirm('Are you sure?')">
                            Delete
                        </a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <!-- Add Booking Modal -->
    <div class="modal fade" id="addBookingModal">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <form action="BookingController" method="POST">
                    <input type="hidden" name="action" value="create">
                    <div class="modal-header">
                        <h5 class="modal-title">Add New Booking</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Customer Name *</label>
                                    <input type="text" name="customer_name" class="form-control" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Customer Phone *</label>
                                    <input type="tel" name="telephone_number" class="form-control" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Address *</label>
                                    <input type="text" name="address" class="form-control" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Pickup Location *</label>
                                    <input type="text" name="pickup_location" class="form-control" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Distance (km) *</label>
                                    <input type="number" step="0.1" name="duration" class="form-control" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Pickup Time *</label>
                                    <input type="datetime-local" name="orderDatetime" class="form-control" required>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Cab Type *</label>
                                    <select name="car_model" class="form-select" required>
                                        <option value="Suzuki Alto">Suzuki Alto</option>
                                        <option value="Suzuki Wagon R">Suzuki Wagon R</option>
                                        <option value="Toyota Prius">Toyota Prius</option>
                                        <option value="Honda Vessel">Honda Vessel</option>
                                        <option value="Toyota Land Cruiser">Toyota Land Cruiser</option>
                                        <option value="Audi A3">Audi A3</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Driver Option *</label>
                                    <select name="driver_name" class="form-select" required>
                                        <option value="Without driver">Without driver</option>
                                        <option value="With a driver">With a driver</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Create Booking</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Edit Booking Modal -->
    <div class="modal fade" id="editBookingModal">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <form action="BookingController" method="POST">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="booking_id" id="editBookingId">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit Booking</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Customer Name *</label>
                                    <input type="text" name="customer_name" id="editCustomerName" class="form-control" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Customer Phone *</label>
                                    <input type="tel" name="telephone_number" id="editCustomerPhone" class="form-control" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Address *</label>
                                    <input type="text" name="address" id="editAddress" class="form-control" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Pickup Location *</label>
                                    <input type="text" name="pickup_location" id="editPickupLocation" class="form-control" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Distance (km) *</label>
                                    <input type="number" step="0.1" name="duration" id="editDistance" class="form-control" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Pickup Time *</label>
                                    <input type="datetime-local" name="orderDatetime" id="editPickupTime" class="form-control" required>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Cab Type *</label>
                                    <select name="car_model" id="editCabType" class="form-select" required>
                                        <option value="Suzuki Alto">Suzuki Alto</option>
                                        <option value="Suzuki Wagon R">Suzuki Wagon R</option>
                                        <option value="Toyota Prius">Toyota Prius</option>
                                        <option value="Honda Vessel">Honda Vessel</option>
                                        <option value="Toyota Land Cruiser">Toyota Land Cruiser</option>
                                        <option value="Audi A3">Audi A3</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Driver Option *</label>
                                    <select name="driver_name" id="editDriverName" class="form-select" required>
                                        <option value="Without driver">Without driver</option>
                                        <option value="With a driver">With a driver</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Update Booking</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#bookingsTable').DataTable();
            
            $('.edit-btn').click(function() {
                const bookingData = $(this).data();
                $('#editBookingId').val(bookingData.bookingid);
                $('#editCustomerName').val(bookingData.customername);
                $('#editCustomerPhone').val(bookingData.customerphone);
                $('#editAddress').val(bookingData.address);
                $('#editPickupLocation').val(bookingData.pickup);
                $('#editDistance').val(bookingData.distance);
                $('#editCabType').val(bookingData.cabtype);
                $('#editDriverName').val(bookingData.driver);
                
                // Format datetime for the input
                if(bookingData.pickuptime) {
                    const dt = bookingData.pickuptime.substring(0, 16);
                    $('#editPickupTime').val(dt);
                }
            });

            setTimeout(() => {
                $('.alert').alert('close');
            }, 5000);
        });
    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, com.datapackage.models.Booking" %>
<jsp:include page="header.jsp" />

<%
    // Retrieve the bookings list from the request attribute
    List<Booking> bookingList = (List<Booking>) request.getAttribute("bookings");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Bookings - Mega City Cab</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <style>
        /* Add your custom styles here */
    </style>
</head>
<body>

    <!-- Main Content -->
    <div class="container">
        <h2 class="text-center mb-4 animate__animated animate__fadeInDown">Manage Bookings</h2>

        <!-- Display success/error messages -->
        <% String successMessage = request.getParameter("success"); %>
        <% if (successMessage != null) { %>
            <div class="alert alert-success"><%= successMessage %></div>
        <% } %>

        <% String errorMessage = request.getParameter("error"); %>
        <% if (errorMessage != null) { %>
            <div class="alert alert-danger"><%= errorMessage %></div>
        <% } %>

        <!-- Bookings Table -->
        <table id="bookingsTable" class="table animate__animated animate__fadeInUp animate-delay-1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Customer Name</th>
                    <th>Customer Phone</th>
                    <th>Customer Email</th>
                    <th>Pickup Location</th>
                    <th>Drop Location</th>
                    <th>Pickup Time</th>
                    <th>Cab Type</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% for (Booking booking : bookingList) { %>
                <tr>
                    <td><%= booking.getUserId() %></td>
                    <td><%= booking.getCustomerName() %></td>
                    <td><%= booking.getCustomerPhone() %></td>
                    <td><%= booking.getCustomerEmail() %></td>
                    <td><%= booking.getPickupLocation() %></td>
                    <td><%= booking.getDropLocation() %></td>
                    <td><%= booking.getPickupTime() %></td>
                    <td><%= booking.getCabType() %></td>
                    <td>
                        <button class="btn btn-warning btn-sm editBtn"
                                data-bs-toggle="modal"
                                data-bs-target="#editBookingModal"
                                data-id="<%= booking.getUserId() %>"
                                data-customername="<%= booking.getCustomerName() %>"
                                data-customerphone="<%= booking.getCustomerPhone() %>"
                                data-customeremail="<%= booking.getCustomerEmail() %>"
                                data-pickuplocation="<%= booking.getPickupLocation() %>"
                                data-droplocation="<%= booking.getDropLocation() %>"
                                data-pickuptime="<%= booking.getPickupTime() %>"
                                data-cabtype="<%= booking.getCabType() %>">
                            <i class="fas fa-edit"></i> Edit
                        </button>
                        <a href="<%= request.getContextPath() %>/BookingController?action=delete&bookingId=<%= booking.getUserId() %>"
                           class="btn btn-danger btn-sm">
                            <i class="fas fa-trash"></i> Delete
                        </a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <!-- Edit Booking Modal -->
    <div class="modal fade" id="editBookingModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Edit Booking</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form id="editBookingForm" action="<%= request.getContextPath() %>/BookingController" method="post">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="bookingId" id="editBookingId">
                        <div class="mb-3">
                            <label class="form-label">Customer Name</label>
                            <input type="text" name="customerName" id="editCustomerName" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Customer Phone</label>
                            <input type="text" name="customerPhone" id="editCustomerPhone" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Customer Email</label>
                            <input type="email" name="customerEmail" id="editCustomerEmail" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Pickup Location</label>
                            <input type="text" name="pickupLocation" id="editPickupLocation" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Drop Location</label>
                            <input type="text" name="dropLocation" id="editDropLocation" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Pickup Time</label>
                            <input type="datetime-local" name="pickupTime" id="editPickupTime" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Cab Type</label>
                            <select name="cabType" id="editCabType" class="form-control" required>
                                <option value="Mini">Mini</option>
                                <option value="Sedan">Sedan</option>
                                <option value="SUV">SUV</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Update Booking</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#bookingsTable').DataTable();

            $('.editBtn').click(function () {
                let bookingId = $(this).data('id');
                let customerName = $(this).data('customername');
                let customerPhone = $(this).data('customerphone');
                let customerEmail = $(this).data('customeremail');
                let pickupLocation = $(this).data('pickuplocation');
                let dropLocation = $(this).data('droplocation');
                let pickupTime = $(this).data('pickuptime');
                let cabType = $(this).data('cabtype');

                $('#editBookingId').val(bookingId);
                $('#editCustomerName').val(customerName);
                $('#editCustomerPhone').val(customerPhone);
                $('#editCustomerEmail').val(customerEmail);
                $('#editPickupLocation').val(pickupLocation);
                $('#editDropLocation').val(dropLocation);
                $('#editPickupTime').val(pickupTime);
                $('#editCabType').val(cabType);
            });
        });
    </script>
</body>
</html>
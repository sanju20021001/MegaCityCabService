<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List,com.datapackage.dao.BookingDAO,com.datapackage.models.Booking" %>

<%
    BookingDAO bookingDAO = new BookingDAO();
    List<Booking> bookingList = bookingDAO.getAllBookings();
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
        <!-- Alert Container for Messages -->
        <div id="messageAlert" class="alert" style="display: none;"></div>

        <h2 class="text-center mb-4 animate__animated animate__fadeInDown">Manage Bookings</h2>

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
                <tr id="bookingRow_<%= booking.getBookingId() %>">
                    <td><%= booking.getBookingId() %></td>
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
                                data-bs-target="#editConfirmationModal"
                                data-id="<%= booking.getBookingId() %>"
                                data-userid="<%= booking.getUserId() %>"
                                data-customername="<%= booking.getCustomerName() %>"
                                data-customerphone="<%= booking.getCustomerPhone() %>"
                                data-customeremail="<%= booking.getCustomerEmail() %>"
                                data-pickuplocation="<%= booking.getPickupLocation() %>"
                                data-droplocation="<%= booking.getDropLocation() %>"
                                data-pickuptime="<%= booking.getPickupTime().toString() %>"
                                data-cabtype="<%= booking.getCabType() %>">
                            <i class="fas fa-edit"></i> Edit
                        </button>
                        <button class="btn btn-danger btn-sm deleteBtn"
                                data-bs-toggle="modal"
                                data-bs-target="#deleteConfirmationModal"
                                data-bookingid="<%= booking.getBookingId() %>">
                            <i class="fas fa-trash"></i> Delete
                        </button>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <!-- Edit Confirmation Modal -->
    <div class="modal fade" id="editConfirmationModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Confirm Edit</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to edit this booking?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-warning" id="confirmEditBtn">Edit</button>
                </div>
            </div>
        </div>
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
                        <input type="hidden" name="userId" id="editUserId">
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

    <!-- Delete Confirmation Modal -->
    <div class="modal fade" id="deleteConfirmationModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Confirm Delete</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to delete this booking?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-danger" id="confirmDeleteBtn">Delete</button>
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

            // Variables to store booking details
            let editBookingId, editUserId, editCustomerName, editCustomerPhone, editCustomerEmail, editPickupLocation, editDropLocation, editPickupTime, editCabType;

            // Handle Edit Button Click
            $('.editBtn').click(function () {
                editBookingId = $(this).data('id');
                editUserId = $(this).data('userid');
                editCustomerName = $(this).data('customername');
                editCustomerPhone = $(this).data('customerphone');
                editCustomerEmail = $(this).data('customeremail');
                editPickupLocation = $(this).data('pickuplocation');
                editDropLocation = $(this).data('droplocation');
                editPickupTime = $(this).data('pickuptime');
                editCabType = $(this).data('cabtype');
            });

            // Handle Confirm Edit Button Click
            $('#confirmEditBtn').click(function () {
                // Populate the edit modal with the stored booking details
                $('#editBookingId').val(editBookingId);
                $('#editUserId').val(editUserId);
                $('#editCustomerName').val(editCustomerName);
                $('#editCustomerPhone').val(editCustomerPhone);
                $('#editCustomerEmail').val(editCustomerEmail);
                $('#editPickupLocation').val(editPickupLocation);
                $('#editDropLocation').val(editDropLocation);
                $('#editPickupTime').val(editPickupTime);
                $('#editCabType').val(editCabType);

                // Close the confirmation modal
                $('#editConfirmationModal').modal('hide');

                // Open the edit modal
                $('#editBookingModal').modal('show');
            });

            // Handle Delete Button Click
            let deleteBookingId;
            $('.deleteBtn').click(function () {
                deleteBookingId = $(this).data('bookingid');
            });

            // Handle Confirm Delete Button Click
            $('#confirmDeleteBtn').click(function () {
                $.ajax({
                    url: '<%= request.getContextPath() %>/BookingController',
                    type: 'POST',
                    data: {
                        action: 'delete',
                        bookingId: deleteBookingId
                    },
                    success: function (response) {
                        if (response === 'success') {
                            // Remove the row from the table
                            $('#bookingRow_' + deleteBookingId).remove();

                            // Show success message
                            $('#messageAlert')
                                .removeClass('alert-danger')
                                .addClass('alert-success')
                                .text('Booking deleted successfully!')
                                .fadeIn();

                            // Hide the message after 3 seconds
                            setTimeout(function () {
                                $('#messageAlert').fadeOut();
                            }, 3000);
                        } else {
                            // Show error message
                            $('#messageAlert')
                                .removeClass('alert-success')
                                .addClass('alert-danger')
                                .text('Failed to delete booking.')
                                .fadeIn();

                            // Hide the message after 3 seconds
                            setTimeout(function () {
                                $('#messageAlert').fadeOut();
                            }, 3000);
                        }
                    },
                    error: function () {
                        // Show error message
                        $('#messageAlert')
                            .removeClass('alert-success')
                            .addClass('alert-danger')
                            .text('An error occurred while deleting the booking.')
                            .fadeIn();

                        // Hide the message after 3 seconds
                        setTimeout(function () {
                            $('#messageAlert').fadeOut();
                        }, 3000);
                    }
                });

                // Close the confirmation modal
                $('#deleteConfirmationModal').modal('hide');
            });
        });
    </script>
</body>
</html>
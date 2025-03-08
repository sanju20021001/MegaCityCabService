package com.datapackage.controllers;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.datapackage.dao.BookingDAO;
import com.datapackage.models.Booking;

@WebServlet("/BookingController")
public class BookingController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch the list of bookings from the database
        BookingDAO bookingDAO = new BookingDAO();
        List<Booking> bookings = bookingDAO.getAllBookings();

        // Set the bookings list as a request attribute
        request.setAttribute("bookings", bookings);

        // Forward the request to the JSP page
        request.getRequestDispatcher("/managebooking.jsp").forward(request, response);
    }

    @Override
  
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("update".equals(action)) {
            updateBooking(request, response);
        } else if ("delete".equals(action)) {
            deleteBooking(request, response);
        } else {
            createBooking(request, response);
        }
    }

    private void createBooking(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            // Extract form data from the request
            int userId = Integer.parseInt(request.getParameter("userId"));
            String customerName = request.getParameter("customerName");
            String customerPhone = request.getParameter("customerPhone");
            String customerEmail = request.getParameter("customerEmail");
            String pickupLocation = request.getParameter("pickupLocation");
            String dropLocation = request.getParameter("dropLocation");
            String pickupTimeStr = request.getParameter("pickupTime");
            String cabType = request.getParameter("cabType");

            // Convert pickupTime from String to LocalDateTime
            LocalDateTime pickupTime = LocalDateTime.parse(pickupTimeStr, DateTimeFormatter.ISO_LOCAL_DATE_TIME);

            // Create a Booking object
            Booking booking = new Booking();
            booking.setUserId(userId);
            booking.setCustomerName(customerName);
            booking.setCustomerPhone(customerPhone);
            booking.setCustomerEmail(customerEmail);
            booking.setPickupLocation(pickupLocation);
            booking.setDropLocation(dropLocation);
            booking.setPickupTime(pickupTime);
            booking.setCabType(cabType);

            // Call the bookCab method to insert the booking into the database
            boolean isSuccess = new BookingDAO().bookCab(booking);

            // Send a response back to the client
            if (isSuccess) {
                request.setAttribute("successMessage", "Booking successful!");
            } else {
                request.setAttribute("errorMessage", "Booking failed. Please try again.");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid user ID format.");
        } catch (DateTimeParseException e) {
            request.setAttribute("errorMessage", "Invalid date format.");
        } catch (Exception e) {
            request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
        }
        doGet(request, response);
    }

    private void updateBooking(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            // Check if bookingId is present in the request
            String bookingIdStr = request.getParameter("bookingId");
            if (bookingIdStr == null || bookingIdStr.isEmpty()) {
                request.setAttribute("errorMessage", "Booking ID is required.");
                doGet(request, response);
                return;
            }

            // Check if userId is present in the request
            String userIdStr = request.getParameter("userId");
            if (userIdStr == null || userIdStr.isEmpty()) {
                request.setAttribute("errorMessage", "User ID is required.");
                doGet(request, response);
                return;
            }

            // Parse bookingId and userId
            int bookingId = Integer.parseInt(bookingIdStr);
            int userId = Integer.parseInt(userIdStr);

            // Extract other parameters
            String customerName = request.getParameter("customerName");
            String customerPhone = request.getParameter("customerPhone");
            String customerEmail = request.getParameter("customerEmail");
            String pickupLocation = request.getParameter("pickupLocation");
            String dropLocation = request.getParameter("dropLocation");
            String pickupTimeStr = request.getParameter("pickupTime");
            String cabType = request.getParameter("cabType");

            // Validate pickupTime
            if (pickupTimeStr == null || pickupTimeStr.isEmpty()) {
                request.setAttribute("errorMessage", "Pickup time is required.");
                doGet(request, response);
                return;
            }

            // Convert pickupTime from String to LocalDateTime
            LocalDateTime pickupTime = LocalDateTime.parse(pickupTimeStr, DateTimeFormatter.ISO_LOCAL_DATE_TIME);

            // Create a Booking object
            Booking booking = new Booking();
            booking.setUserId(userId);
            booking.setCustomerName(customerName);
            booking.setCustomerPhone(customerPhone);
            booking.setCustomerEmail(customerEmail);
            booking.setPickupLocation(pickupLocation);
            booking.setDropLocation(dropLocation);
            booking.setPickupTime(pickupTime);
            booking.setCabType(cabType);

            // Call the updateBooking method in DAO
            boolean isSuccess = new BookingDAO().updateBooking(bookingId, booking);

            // Set success or error message
            if (isSuccess) {
                request.setAttribute("successMessage", "Booking updated successfully!");
            } else {
                request.setAttribute("errorMessage", "Failed to update booking.");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid ID format.");
        } catch (DateTimeParseException e) {
            request.setAttribute("errorMessage", "Invalid date format.");
        } catch (Exception e) {
            request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
        }
        doGet(request, response);
    }

    private void deleteBooking(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            // Check if bookingId is present in the request
            String bookingIdStr = request.getParameter("bookingId");
            if (bookingIdStr == null || bookingIdStr.isEmpty()) {
                response.getWriter().write("error");
                return;
            }

            // Parse bookingId
            int bookingId = Integer.parseInt(bookingIdStr);

            // Call the deleteBooking method in DAO
            boolean isSuccess = new BookingDAO().deleteBooking(bookingId);

            // Send response back to the client
            if (isSuccess) {
                response.getWriter().write("success");
            } else {
                response.getWriter().write("error");
            }
        } catch (NumberFormatException e) {
            response.getWriter().write("error");
        } catch (Exception e) {
            response.getWriter().write("error");
        }
    }
}
package com.datapackage.dao;

import com.datapackage.models.Booking;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {
    private Connection conn;

    // Constructor to initialize the database connection
    public BookingDAO() throws SQLException {
        this.conn = DatabaseConnection.getConnection();
    }

    // Insert a new booking into the database
    public boolean insertBooking(Booking booking) {
        String sql = "INSERT INTO bookings (customer_name, address, customer_phone, " 
                   + "pickup_location, distance, pickup_time, cab_type, driver) " 
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)"; 
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, booking.getCustomerName());
            stmt.setString(2, booking.getAddress());
            stmt.setString(3, booking.getCustomerPhone());
            stmt.setString(4, booking.getPickupLocation());
            stmt.setDouble(5, booking.getDistance());  

            // Convert LocalDateTime to Timestamp for database storage
            if (booking.getPickupTime() != null) {
                stmt.setTimestamp(6, Timestamp.valueOf(booking.getPickupTime()));
            } else {
                stmt.setTimestamp(6, null);
            }

            stmt.setString(7, booking.getCabType());
            stmt.setString(8, booking.getDriver());

            // Execute the query and return true if successful
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            // Log the exception and return false
            System.err.println("Error inserting booking: " + e.getMessage());
            return false;
        }
    }

    // Fetch all bookings from the database
    public List<Booking> getAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM bookings";

        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Booking booking = new Booking(
                        rs.getInt("id"),
                        rs.getString("customer_name"),
                        rs.getString("customer_phone"),
                        rs.getString("address"),
                        rs.getString("pickup_location"),
                        Double.parseDouble(rs.getString("distance")),
                        rs.getTimestamp("pickup_time") != null ? rs.getTimestamp("pickup_time").toLocalDateTime() : null,
                        rs.getString("cab_type"),
                        rs.getString("driver")
                );
                bookings.add(booking);
            }
            System.out.println("Total Bookings Retrieved: " + bookings.size());  // Debugging line
        } catch (SQLException e) {
            // Log the exception
            System.err.println("Error retrieving bookings: " + e.getMessage());
        }
        return bookings;
    }

    // Update a booking in the database
    public boolean updateBooking(Booking booking) {
        String sql = "UPDATE booking SET customer_name = ?, customer_phone = ?, address = ?, pickup_location = ?, distance = ?, pickup_time = ?, cab_type = ?, driver = ? WHERE id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, booking.getCustomerName());
            stmt.setString(2, booking.getCustomerPhone());
            stmt.setString(3, booking.getAddress());
            stmt.setString(4, booking.getPickupLocation());
            stmt.setDouble(5, booking.getDistance());

            // Convert LocalDateTime to Timestamp for database storage
            if (booking.getPickupTime() != null) {
                stmt.setTimestamp(6, Timestamp.valueOf(booking.getPickupTime()));
            } else {
                stmt.setTimestamp(6, null);
            }

            stmt.setString(7, booking.getCabType());
            stmt.setString(8, booking.getDriver());
            stmt.setInt(9, booking.getBookingId());

            // Execute the query and return true if successful
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            // Log the exception and return false
            System.err.println("Error updating booking: " + e.getMessage());
            return false;
        }
    }

    // Delete a booking from the database
    public boolean deleteBooking(int bookingId) {
        String sql = "DELETE FROM booking WHERE booking_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, bookingId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            // Log the exception and return false
            System.err.println("Error deleting booking: " + e.getMessage());
            return false;
        }
    }

    // Close the database connection
    public void closeConnection() {
        if (conn != null) {
            try {
                conn.close();
                System.out.println("Database connection closed.");
            } catch (SQLException e) {
                System.err.println("Error closing database connection: " + e.getMessage());
            }
        }
    }
}
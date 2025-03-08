package com.datapackage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.datapackage.models.Booking;

public class BookingDAO {

    public boolean bookCab(Booking booking) {
        String sql = "INSERT INTO bookings (user_id, customer_name, customer_phone, customer_email, pickup_location, drop_location, pickup_time, cab_type) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, booking.getUserId());
            pstmt.setString(2, booking.getCustomerName());
            pstmt.setString(3, booking.getCustomerPhone());
            pstmt.setString(4, booking.getCustomerEmail());
            pstmt.setString(5, booking.getPickupLocation());
            pstmt.setString(6, booking.getDropLocation());
            pstmt.setTimestamp(7, Timestamp.valueOf(booking.getPickupTime()));
            pstmt.setString(8, booking.getCabType());

            int rowsInserted = pstmt.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Booking> getAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM bookings";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Booking booking = new Booking();
                booking.setBookingId(rs.getInt("booking_id"));
                booking.setUserId(rs.getInt("user_id"));
                booking.setCustomerName(rs.getString("customer_name"));
                booking.setCustomerPhone(rs.getString("customer_phone"));
                booking.setCustomerEmail(rs.getString("customer_email"));
                booking.setPickupLocation(rs.getString("pickup_location"));
                booking.setDropLocation(rs.getString("drop_location"));
                booking.setPickupTime(rs.getTimestamp("pickup_time").toLocalDateTime());
                booking.setCabType(rs.getString("cab_type"));

                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bookings;
    }

    public boolean updateBooking(int bookingId, Booking booking) {
        String sql = "UPDATE bookings SET user_id=?, customer_name=?, customer_phone=?, customer_email=?, pickup_location=?, drop_location=?, pickup_time=?, cab_type=? WHERE booking_id=?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, booking.getUserId());
            pstmt.setString(2, booking.getCustomerName());
            pstmt.setString(3, booking.getCustomerPhone());
            pstmt.setString(4, booking.getCustomerEmail());
            pstmt.setString(5, booking.getPickupLocation());
            pstmt.setString(6, booking.getDropLocation());
            pstmt.setTimestamp(7, Timestamp.valueOf(booking.getPickupTime()));
            pstmt.setString(8, booking.getCabType());
            pstmt.setInt(9, bookingId);

            int rowsUpdated = pstmt.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteBooking(int bookingId) {
        String sql = "DELETE FROM bookings WHERE booking_id=?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, bookingId);
            int rowsDeleted = pstmt.executeUpdate();
            return rowsDeleted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
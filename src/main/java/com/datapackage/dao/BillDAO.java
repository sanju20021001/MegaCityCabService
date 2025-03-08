package com.datapackage.dao;

import com.datapackage.models.Bill;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BillDAO {
    private static final double RATE_PER_KM = 10.0; // Fare rate per kilometer
    private static final double GST_RATE = 0.18; // GST rate (18%)

    public Bill calculateBill(int bookingId) {
        Bill bill = new Bill();
        String query = "SELECT b.booking_id, b.customer_name, b.pickup_location, b.drop_location, " +
                       "p1.latitude AS pickup_lat, p1.longitude AS pickup_lon, " +
                       "p2.latitude AS drop_lat, p2.longitude AS drop_lon " +
                       "FROM bookings b " +
                       "JOIN locations p1 ON b.pickup_location = p1.location_name " +
                       "JOIN locations p2 ON b.drop_location = p2.location_name " +
                       "WHERE b.booking_id = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, bookingId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                bill.setBookingId(rs.getInt("booking_id"));
                bill.setCustomerName(rs.getString("customer_name"));
                bill.setPickupLocation(rs.getString("pickup_location"));
                bill.setDropLocation(rs.getString("drop_location"));

                // Get latitude and longitude for pickup and drop locations
                double pickupLat = rs.getDouble("pickup_lat");
                double pickupLon = rs.getDouble("pickup_lon");
                double dropLat = rs.getDouble("drop_lat");
                double dropLon = rs.getDouble("drop_lon");

                // Calculate distance using Haversine formula
                double distance = DistanceCalculator.calculateDistance(pickupLat, pickupLon, dropLat, dropLon);
                bill.setDistance(distance);

                // Calculate fare, GST, and total amount
                double fare = distance * RATE_PER_KM;
                double gst = fare * GST_RATE;
                double totalAmount = fare + gst;

                bill.setFare(fare);
                bill.setGst(gst);
                bill.setTotalAmount(totalAmount);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return bill;
    }
}
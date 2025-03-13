package com.datapackage.dao;

import com.datapackage.models.User;
import com.datapackage.models.Car;
import com.datapackage.models.Booking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class AdminDAO {
    private Connection connection;

    public AdminDAO(Connection connection) {
        this.connection = connection;
    }



    // Method to get total number of cars
    public int getTotalCars() throws Exception {
        String sql = "SELECT COUNT(*) AS total FROM cars";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                int total = rs.getInt("total");
                System.out.println("Total Cars: " + total); // Debugging
                return total;
            }
        }
        return 0;
    }

    // Method to get total number of bookings
    public int getTotalBookings() throws Exception {
        String sql = "SELECT COUNT(*) AS total FROM bookings";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                int total = rs.getInt("total");
                System.out.println("Total Bookings: " + total); // Debugging
                return total;
            }
        }
        return 0;
    }
    
    public int getTotalUsers() throws Exception {
        String sql = "SELECT COUNT(*) AS total FROM users";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                int total = rs.getInt("total");
                System.out.println("Total Users: " + total); // Debugging
                return total;
            }
        }
        return 0;
    }
}
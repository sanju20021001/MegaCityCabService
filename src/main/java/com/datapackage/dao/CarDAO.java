package com.datapackage.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.datapackage.models.Car;

public class CarDAO {

    private static final Logger logger = Logger.getLogger(CarDAO.class.getName());
    private static final String DEFAULT_IMAGE_PATH = "/assets/images/cars/c1.jpg";

    // Helper method to create a Car object from a ResultSet
    private Car createCarFromResultSet(ResultSet rs) throws SQLException {
        String imagePath = rs.getString("Image");
        if (imagePath == null || imagePath.trim().isEmpty()) {
            imagePath = DEFAULT_IMAGE_PATH; // Use default image if none provided
        }

        return new Car(
                rs.getInt("CarID"),
                rs.getString("Model"),
                rs.getString("Brand"),
                rs.getString("LicensePlate"),
                rs.getDouble("PricePerDay"),
                rs.getString("Status"),
                imagePath
        );
    }

    // Add a new car
    public boolean addCar(Car car) {
        String sql = "INSERT INTO Car (Model, Brand, LicensePlate, PricePerDay, Status, Image) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, car.getModel());
            stmt.setString(2, car.getBrand());
            stmt.setString(3, car.getLicensePlate());
            stmt.setDouble(4, car.getPricePerDay());
            stmt.setString(5, car.getStatus());
            stmt.setString(6, car.getImage());

            int rowsInserted = stmt.executeUpdate();
            logger.log(Level.INFO, "Rows inserted: " + rowsInserted);

            return rowsInserted > 0;

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error adding car", e);
            return false;
        }
    }

    // Update a car
    public boolean updateCar(Car car) {
        String sql = "UPDATE Car SET Model = ?, Brand = ?, LicensePlate = ?, PricePerDay = ?, Status = ?, Image = ? WHERE CarID = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, car.getModel());
            stmt.setString(2, car.getBrand());
            stmt.setString(3, car.getLicensePlate());
            stmt.setDouble(4, car.getPricePerDay());
            stmt.setString(5, car.getStatus());
            stmt.setString(6, car.getImage());
            stmt.setInt(7, car.getCarID());

            int rowsUpdated = stmt.executeUpdate();
            logger.log(Level.INFO, "Rows updated: " + rowsUpdated);

            return rowsUpdated > 0;

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error updating car", e);
            return false;
        }
    }

    // Get all cars
    public List<Car> getAllCars() {
        List<Car> cars = new ArrayList<>();
        String sql = "SELECT * FROM Car";

        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                cars.add(createCarFromResultSet(rs));
            }
        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error retrieving all cars", e);
        }
        return cars;
    }

    // Get a single car by ID
    public Car getCarById(int carID) {
        String sql = "SELECT * FROM Car WHERE CarID = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, carID);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return createCarFromResultSet(rs);
                }
            }
        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error retrieving car by ID", e);
        }
        return null;
    }

    // Get featured cars with limit
    public List<Car> getFeaturedCars(int limit) {
        List<Car> cars = new ArrayList<>();
        String sql = "SELECT * FROM Car WHERE Status = 'Available' ORDER BY CarID LIMIT ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, limit);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    cars.add(createCarFromResultSet(rs));
                }
            }
        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error retrieving featured cars", e);
        }
        return cars;
    }

    // Delete a car
    public boolean deleteCar(int carID) {
        String sql = "DELETE FROM Car WHERE CarID = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, carID);
            int rowsDeleted = stmt.executeUpdate();
            logger.log(Level.INFO, "Rows deleted: " + rowsDeleted);

            return rowsDeleted > 0;

        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error deleting car", e);
            return false;
        }
    }
}
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

    private Car createCarFromResultSet(ResultSet rs) throws SQLException {
        String imagePath = rs.getString("image");
        if (imagePath == null || imagePath.trim().isEmpty()) {
            imagePath = DEFAULT_IMAGE_PATH; 
        }

        return new Car(
                rs.getInt("id"),
                rs.getString("model"),
                rs.getString("brand"),
                rs.getString("plate"),
                rs.getDouble("price"),
                rs.getString("status"),
                imagePath
        );
    }

    // Add a new car
    public boolean addCar(Car car) {
        String sql = "INSERT INTO cars (model, brand, plate, price, status, image) VALUES (?, ?, ?, ?, ?, ?)";
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
        String sql = "UPDATE cars SET model = ?, brand = ?, plate = ?, price = ?, status = ?, image = ? WHERE id = ?";

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
        String sql = "SELECT * FROM cars";

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
        String sql = "SELECT * FROM cars WHERE id = ?";
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

    // Delete a car
    public boolean deleteCar(int carID) {
        String sql = "DELETE FROM cars WHERE id = ?";

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
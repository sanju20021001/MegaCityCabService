package com.datapackage.dao;

import com.datapackage.models.Driver;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DriverDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/megacitycabdb";
    private String jdbcUsername = "root";
    private String jdbcPassword = "root";

    private static final String SELECT_ALL_DRIVERS = "SELECT * FROM drivers";
    private static final String INSERT_DRIVER = "INSERT INTO drivers (name, license_number, phone_number, email, vehicle_type, status) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String UPDATE_DRIVER = "UPDATE drivers SET name=?, license_number=?, phone_number=?, email=?, vehicle_type=?, status=? WHERE id=?";
    private static final String DELETE_DRIVER = "DELETE FROM drivers WHERE id=?";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public List<Driver> getAllDrivers() {
        List<Driver> drivers = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_DRIVERS)) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int driverID = rs.getInt("id");
                String name = rs.getString("name");
                String licenseNumber = rs.getString("license_number");
                String phoneNumber = rs.getString("phone_number");
                String email = rs.getString("email");
                String vehicleType = rs.getString("vehicle_type");
                String status = rs.getString("status");
                drivers.add(new Driver(driverID, name, licenseNumber, phoneNumber, email, vehicleType, status));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return drivers;
    }

    public void addDriver(Driver driver) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_DRIVER)) {
            preparedStatement.setString(1, driver.getName());
            preparedStatement.setString(2, driver.getLicenseNumber());
            preparedStatement.setString(3, driver.getPhoneNumber());
            preparedStatement.setString(4, driver.getEmail());
            preparedStatement.setString(5, driver.getVehicleType());
            preparedStatement.setString(6, driver.getStatus());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateDriver(Driver driver) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_DRIVER)) {
            preparedStatement.setString(1, driver.getName());
            preparedStatement.setString(2, driver.getLicenseNumber());
            preparedStatement.setString(3, driver.getPhoneNumber());
            preparedStatement.setString(4, driver.getEmail());
            preparedStatement.setString(5, driver.getVehicleType());
            preparedStatement.setString(6, driver.getStatus());
            preparedStatement.setInt(7, driver.getDriverID());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteDriver(int driverID) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_DRIVER)) {
            preparedStatement.setInt(1, driverID);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
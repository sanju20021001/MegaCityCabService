package com.datapackage.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/megacitycabdb";
    private static final String USER = "root";
    private static final String PASSWORD = "root";
    
    private static Connection connection;

    private DatabaseConnection() { 
    }

    public static Connection getConnection() throws SQLException {
        if (connection == null || connection.isClosed()) {  
            synchronized (DatabaseConnection.class) {  
                if (connection == null || connection.isClosed()) {
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        connection = DriverManager.getConnection(URL, USER, PASSWORD);
                    } catch (ClassNotFoundException e) {
                        throw new SQLException("Database Driver not found", e);
                    }
                }
            }
        }
        return connection;
    }
}

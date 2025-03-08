package com.datapackage.controllers;

import com.datapackage.models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/UserController")
public class UserController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(UserController.class.getName());

    private static final String DB_URL = "jdbc:mysql://localhost:3306/megacitycabdb";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    static {
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            LOGGER.log(Level.SEVERE, "MySQL JDBC Driver not found!", e);
            throw new RuntimeException("MySQL JDBC Driver not found!", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("register".equals(action)) {
            registerUser(request, response);
        } else if ("login".equals(action)) {
            loginUser(request, response);
        } else if ("update".equals(action)) {
            updateUser(request, response);
        } else {
            response.sendRedirect("error.jsp?error=Invalid action");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("logout".equals(action)) {
            logoutUser(request, response);
        } else if ("delete".equals(action)) {
            deleteUser(request, response);
        } else if ("list".equals(action)) {
            listUsers(request, response);
        } else {
            response.sendRedirect("error.jsp?error=Invalid action");
        }
    }

    private void registerUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String nic = request.getParameter("nic");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Validate input fields
        if (name == null || name.isEmpty() || email == null || email.isEmpty() || password == null || password.isEmpty()) {
            response.sendRedirect("register.jsp?error=All fields are required");
            return;
        }

        if (!password.equals(confirmPassword)) {
            response.sendRedirect("register.jsp?error=Passwords do not match");
            return;
        }

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            // Check if email already exists
            String checkSql = "SELECT email FROM users WHERE email = ?";
            try (PreparedStatement checkStmt = conn.prepareStatement(checkSql)) {
                checkStmt.setString(1, email);
                ResultSet rs = checkStmt.executeQuery();
                if (rs.next()) {
                    response.sendRedirect("register.jsp?error=Email already exists");
                    return;
                }
            }

            // Insert new user
            String sql = "INSERT INTO users (username, name, address, nic, email, phone, password, role) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, email); // Use email as username
                pstmt.setString(2, name);
                pstmt.setString(3, address);
                pstmt.setString(4, nic);
                pstmt.setString(5, email);
                pstmt.setString(6, phone);
                pstmt.setString(7, password);
                pstmt.setString(8, "user"); // Default role is "user"

                int rowsInserted = pstmt.executeUpdate();
                if (rowsInserted > 0) {
                    response.sendRedirect("login.jsp?success=Registration successful! Please login.");
                } else {
                    response.sendRedirect("register.jsp?error=Registration failed. Please try again.");
                }
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Registration failed due to SQL error: " + e.getMessage(), e);
            response.sendRedirect("register.jsp?error=Registration failed. Please try again.");
        }
    }

    private void loginUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validate input fields
        if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
            response.sendRedirect("login.jsp?error=Email and password are required");
            return;
        }

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, email);
                pstmt.setString(2, password);

                ResultSet rs = pstmt.executeQuery();
                if (rs.next()) {
                    HttpSession session = request.getSession();
                    session.setAttribute("username", rs.getString("username"));
                    session.setAttribute("role", rs.getString("role"));

                    // Redirect based on role
                    if ("admin".equals(rs.getString("role"))) {
                        response.sendRedirect("admindashboard.jsp");
                    } else {
                        response.sendRedirect("home.jsp");
                    }
                } else {
                    response.sendRedirect("login.jsp?error=Invalid email or password");
                }
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Login failed due to SQL error: " + e.getMessage(), e);
            response.sendRedirect("login.jsp?error=Login failed. Please try again.");
        }
    }

    private void logoutUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        response.sendRedirect("login.jsp?success=Logged out successfully");
    }

    private void listUsers(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<User> userList = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "SELECT * FROM users";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                ResultSet rs = pstmt.executeQuery();

                while (rs.next()) {
                    User user = new User();
                    user.setRegNumber(rs.getInt("regNumber")); // Fixed
                    user.setUsername(rs.getString("username")); // Fixed
                    user.setName(rs.getString("name")); // Fixed
                    user.setAddress(rs.getString("address")); // Fixed
                    user.setNic(rs.getString("nic")); // Fixed
                    user.setEmail(rs.getString("email")); // Fixed
                    user.setPhone(rs.getString("phone")); // Fixed
                    user.setRole(rs.getString("role")); // Fixed
                    userList.add(user);
                }
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Failed to fetch users: " + e.getMessage(), e);
            request.setAttribute("error", "Failed to fetch users: " + e.getMessage());
        }

        request.setAttribute("userList", userList);
        request.getRequestDispatcher("manageUsers.jsp").forward(request, response);
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        String username = request.getParameter("username");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String nic = request.getParameter("nic");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String role = request.getParameter("role");

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "UPDATE users SET username = ?, name = ?, address = ?, nic = ?, email = ?, phone = ?, role = ? WHERE regNumber = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, username);
                pstmt.setString(2, name);
                pstmt.setString(3, address);
                pstmt.setString(4, nic);
                pstmt.setString(5, email);
                pstmt.setString(6, phone);
                pstmt.setString(7, role);
                pstmt.setInt(8, userId);

                int rowsUpdated = pstmt.executeUpdate();
                if (rowsUpdated > 0) {
                    response.sendRedirect("UserController?action=list&success=User updated successfully");
                } else {
                    response.sendRedirect("UserController?action=list&error=Failed to update user");
                }
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Failed to update user: " + e.getMessage(), e);
            response.sendRedirect("UserController?action=list&error=Failed to update user");
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "DELETE FROM users WHERE regNumber = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setInt(1, userId);

                int rowsDeleted = pstmt.executeUpdate();
                if (rowsDeleted > 0) {
                    response.sendRedirect("UserController?action=list&success=User deleted successfully");
                } else {
                    response.sendRedirect("UserController?action=list&error=Failed to delete user");
                }
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Failed to delete user: " + e.getMessage(), e);
            response.sendRedirect("UserController?action=list&error=Failed to delete user");
        }
    }
}
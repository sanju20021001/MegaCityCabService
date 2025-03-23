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

    // Database connection parameters
    private static final String DB_URL = "jdbc:mysql://localhost:3306/megacitycabdb";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    static {
        try {
            // Load MySQL JDBC driver class
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

        // Route requests based on action parameter
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

        // Route GET requests
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

    // User registration method
    private void registerUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Extract parameters from request
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String nic = request.getParameter("nic");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Basic validation
        if (name == null || name.isEmpty() || email == null || email.isEmpty() || password == null || password.isEmpty()) {
            response.sendRedirect("register.jsp?error=All fields are required");
            return;
        }

        if (!password.equals(confirmPassword)) {
            response.sendRedirect("register.jsp?error=Passwords do not match");
            return;
        }

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            // Check for existing email
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
                pstmt.setString(1, email);
                pstmt.setString(2, name);
                pstmt.setString(3, address);
                pstmt.setString(4, nic);
                pstmt.setString(5, email);
                pstmt.setString(6, phone);
                pstmt.setString(7, password);
                pstmt.setString(8, "user");

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

    // User login method with session handling
    private void loginUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

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
                    // Create session and store user information
                    HttpSession session = request.getSession(); 
                    session.setAttribute("username", rs.getString("username"));
                    session.setAttribute("role", rs.getString("role"));

                    // Redirect based on user role
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

    // Logout method with session invalidation
    private void logoutUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get existing session without creating new one
        HttpSession session = request.getSession(false);
        if (session != null) {
            // Invalidate the session
            session.invalidate();
        }
        response.sendRedirect("login.jsp?success=Logged out successfully");
    }

    // Method to list all users
    private void listUsers(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<User> userList = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "SELECT * FROM users";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                ResultSet rs = pstmt.executeQuery();

                while (rs.next()) {
                    User user = new User();
                    user.setRegNumber(rs.getInt("regNumber"));
                    user.setUsername(rs.getString("username"));
                    user.setName(rs.getString("name"));
                    user.setAddress(rs.getString("address"));
                    user.setNic(rs.getString("nic"));
                    user.setEmail(rs.getString("email"));
                    user.setPhone(rs.getString("phone"));
                    user.setRole(rs.getString("role"));
                    userList.add(user);
                }
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Failed to fetch users: " + e.getMessage(), e);
            request.setAttribute("error", "Failed to fetch users: " + e.getMessage());
        }

        request.setAttribute("userList", userList);
        request.getRequestDispatcher("Users.jsp").forward(request, response);
    }

    // User update method
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

    // User deletion method
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
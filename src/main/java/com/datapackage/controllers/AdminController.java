package com.datapackage.controllers;

import com.datapackage.dao.*;
import com.datapackage.models.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/admindashboard")
public class AdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null || action.trim().isEmpty()) {
            action = "dashboard";
        }


        try (Connection connection = DatabaseConnection.getConnection()) {
            AdminDAO adminDAO = new AdminDAO(connection);

            // Get total counts
            int totalUsers = adminDAO.getTotalUsers();
            int totalCars = adminDAO.getTotalCars();
            int totalBookings = adminDAO.getTotalBookings();

            // Debugging: Print totals to console
            System.out.println("Total Users: " + totalUsers);
            System.out.println("Total Cars: " + totalCars);
            System.out.println("Total Bookings: " + totalBookings);

            // Set totals as request attributes
            request.setAttribute("totalUsers", totalUsers);
            request.setAttribute("totalCars", totalCars);
            request.setAttribute("totalBookings", totalBookings);

            // Dispatch to the appropriate page
            switch (action) {
                case "manageUsers":
                    manageUsers(request, response);
                    break;
                case "manageCars":
                    manageCars(request, response);
                    break;
                case "manageBookings":
                    
                    break;
                default:
                    showDashboard(request, response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Handle exception if needed
        }
    }

    private void showDashboard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/admindashboard.jsp").forward(request, response); // Change to admin.jsp
    }

    private void manageUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO userDAO = new UserDAO();
        List<User> users = userDAO.getAllUsers();
        request.setAttribute("users", users);
        request.getRequestDispatcher("/admindashboard.jsp").forward(request, response);
    }

    private void manageCars(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CarDAO carDAO = new CarDAO();
        List<Car> cars = carDAO.getAllCars();
        request.setAttribute("cars", cars);
        request.getRequestDispatcher("/admindashboard.jsp").forward(request, response);
    }


}
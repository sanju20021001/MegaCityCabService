package com.datapackage.controllers;

import com.datapackage.dao.DriverDAO;
import com.datapackage.models.Driver;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/DriverController")
public class DriverController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DriverDAO driverDAO;

    public void init() {
        driverDAO = new DriverDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "add":
                addDriver(request, response);
                break;
            case "update":
                updateDriver(request, response);
                break;
            case "delete":
                deleteDriver(request, response);
                break;
            default:
                response.sendRedirect("manageDrivers.jsp");
        }
    }

    private void addDriver(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String licenseNumber = request.getParameter("license");
        String phoneNumber = request.getParameter("phone");
        String email = request.getParameter("email");
        String vehicleType = request.getParameter("vehicle");
        String status = request.getParameter("status");

        Driver newDriver = new Driver(0, name, licenseNumber, phoneNumber, email, vehicleType, status);
        driverDAO.addDriver(newDriver);
        response.sendRedirect("manageDrivers.jsp");
    }

    private void updateDriver(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int driverID = Integer.parseInt(request.getParameter("driverID"));
        String name = request.getParameter("name");
        String licenseNumber = request.getParameter("license");
        String phoneNumber = request.getParameter("phone");
        String email = request.getParameter("email");
        String vehicleType = request.getParameter("vehicle");
        String status = request.getParameter("status");

        Driver driver = new Driver(driverID, name, licenseNumber, phoneNumber, email, vehicleType, status);
        driverDAO.updateDriver(driver);
        response.sendRedirect("manageDrivers.jsp");
    }

    private void deleteDriver(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int driverID = Integer.parseInt(request.getParameter("id"));
        driverDAO.deleteDriver(driverID);
        response.sendRedirect("manageDrivers.jsp");
    }
}
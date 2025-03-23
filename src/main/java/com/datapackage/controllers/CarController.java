package com.datapackage.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

import com.datapackage.dao.CarDAO;
import com.datapackage.models.Car;

@jakarta.servlet.annotation.MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10,      // 10 MB
        maxRequestSize = 1024 * 1024 * 100   // 100 MB
)
@WebServlet("/CarController")
public class CarController extends HttpServlet {
    private final CarDAO carDAO = new CarDAO();  //Using factory design pattern

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            String model = request.getParameter("model");
            String brand = request.getParameter("brand");
            String licensePlate = request.getParameter("license");
            double price = Double.parseDouble(request.getParameter("price"));
            String status = request.getParameter("status");
            String image = request.getParameter("image");

            Car car = new Car(model, brand, licensePlate, price, status, image);
            boolean isAdded = carDAO.addCar(car);

            if (isAdded) {
                session.setAttribute("message", "Car added successfully!");
            } else {
                session.setAttribute("message", "Failed to add car. Please try again.");
            }
        } else if ("update".equals(action)) {
            int carID = Integer.parseInt(request.getParameter("carID"));
            String model = request.getParameter("model");
            String brand = request.getParameter("brand");
            String licensePlate = request.getParameter("license");
            double price = Double.parseDouble(request.getParameter("price"));
            String status = request.getParameter("status");
            String image = request.getParameter("image");

            Car car = new Car(carID, model, brand, licensePlate, price, status, image);
            boolean isUpdated = carDAO.updateCar(car);

            if (isUpdated) {
                session.setAttribute("message", "Car updated successfully!");
            } else {
                session.setAttribute("message", "Failed to update car. Please try again.");
            }
        }

        response.sendRedirect(request.getContextPath() + "/view/manageCar.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            int carID = Integer.parseInt(request.getParameter("id"));
            boolean isDeleted = carDAO.deleteCar(carID);

            if (isDeleted) {
                session.setAttribute("message", "Car deleted successfully!");
            } else {
                session.setAttribute("message", "Failed to delete car. Please try again.");
            }
        }

        response.sendRedirect(request.getContextPath() + "/view/manageCar.jsp");
    }
}
package com.datapackage.controllers;

import com.datapackage.dao.BookingDAO;
import com.datapackage.models.Booking;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/BookingController")
public class BookingController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerName = request.getParameter("customer_name");
        String address = request.getParameter("address");
        String telephoneNumber = request.getParameter("telephone_number");
        String pickupLocation = request.getParameter("pickup_location");
        String durationStr = request.getParameter("duration");
        String driverName = request.getParameter("driver_name");
        String carModel = request.getParameter("car_model");
        String orderDatetimeStr = request.getParameter("orderDatetime");

        // Convert String to LocalDateTime
        LocalDateTime orderDatetime = null;
        if (orderDatetimeStr != null && !orderDatetimeStr.isEmpty()) {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
            orderDatetime = LocalDateTime.parse(orderDatetimeStr, formatter);
        }

        // Calculate Bill
        int duration = (durationStr != null && !durationStr.isEmpty()) ? Integer.parseInt(durationStr) : 0;
        double bill = duration * 40; // Rs.40 per km

        // Add car price
        double carPrice = 0;
        switch (carModel) {
            case "Suzuki Alto":
                carPrice = 4000;
                break;
            case "Suzuki Wagon R":
                carPrice = 5000;
                break;
            case "Toyota Prius":
                carPrice = 6000;
                break;
            case "Honda Vessel":
                carPrice = 6500;
                break;
            case "Toyota Land Cruiser":
                carPrice = 7000;
                break;
            case "Audi A3":
                carPrice = 8500;
                break;
        }
        bill += carPrice;

        // Add driver charge if "With a driver" is selected
        if ("With a driver".equals(driverName)) {
            bill += 5000;
        }

        // Apply 20% discount
        double discount = bill * 0.2;
        double finalBill = bill - discount;

        // Save Booking in Database
        Booking booking = new Booking(customerName, address, telephoneNumber, pickupLocation, durationStr, orderDatetime, driverName, carModel);
        BookingDAO bookingDAO = null;
        try {
            bookingDAO = new BookingDAO();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        if (bookingDAO.insertBooking(booking)) {
            // Generate PDF
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=bill.pdf");

            try (OutputStream out = response.getOutputStream()) {
                Document document = new Document();
                PdfWriter.getInstance(document, out);
                document.open();
                document.add(new Paragraph("Mega City Cab - Booking Receipt"));
                document.add(new Paragraph("Customer: " + customerName));
                document.add(new Paragraph("Address: " + address));
                document.add(new Paragraph("Telephone: " + telephoneNumber));
                document.add(new Paragraph("Pickup Location: " + pickupLocation));
                document.add(new Paragraph("Car Model: " + carModel));
                document.add(new Paragraph("Duration: " + duration + " km"));
                document.add(new Paragraph("Driver: " + driverName));
                document.add(new Paragraph("--------------------------------------------------"));
                document.add(new Paragraph("Base Price: Rs." + carPrice));
                document.add(new Paragraph("Duration Charge (Rs.40/km): Rs." + (duration * 40)));
                if ("With a driver".equals(driverName)) {
                    document.add(new Paragraph("Driver Charge: Rs.5000"));
                }
                document.add(new Paragraph("Subtotal: Rs." + bill));
                document.add(new Paragraph("Discount (20%): -Rs." + discount));
                document.add(new Paragraph("Total Bill: Rs." + finalBill));
                document.close();
            } catch (DocumentException e) {
                throw new RuntimeException(e);
            }

        } else {
            response.sendRedirect("home.jsp?booking=error");
        }
    }
}
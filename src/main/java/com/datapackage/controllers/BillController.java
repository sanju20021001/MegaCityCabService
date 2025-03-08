package com.datapackage.controllers;

import com.datapackage.dao.BillDAO;
import com.datapackage.models.Bill;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/bill")
public class BillController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));

        BillDAO billDAO = new BillDAO();
        Bill bill = billDAO.calculateBill(bookingId);

        request.setAttribute("bill", bill);
        request.getRequestDispatcher("bill.jsp").forward(request, response);
    }
}
package com.datapackage.models;

import java.time.LocalDateTime;

public class Booking {
    private int bookingId;
    private String customerName;
    private String customerPhone;
    private String customerEmail;
    private String pickupLocation;
    private String dropLocation;
    private LocalDateTime pickupTime;
    private String cabType;
    private String driverName;

    // Default constructor
    public Booking() {}

    // Constructor for inserting a new booking (without bookingId)
    public Booking(String customerName, String customerPhone, String customerEmail,
                   String pickupLocation, String dropLocation, LocalDateTime pickupTime,
                   String cabType, String driverName) {
        this.customerName = customerName;
        this.customerPhone = customerPhone;
        this.customerEmail = customerEmail;
        this.pickupLocation = pickupLocation;
        this.dropLocation = dropLocation;
        this.pickupTime = pickupTime;
        this.cabType = cabType;
        this.driverName = driverName;
    }

    // Constructor for fetching a booking from DB (with bookingId)
    public Booking(int bookingId, String customerName, String customerPhone, String customerEmail,
                   String pickupLocation, String dropLocation, LocalDateTime pickupTime,
                   String cabType, String driverName) {
        this.bookingId = bookingId;
        this.customerName = customerName;
        this.customerPhone = customerPhone;
        this.customerEmail = customerEmail;
        this.pickupLocation = pickupLocation;
        this.dropLocation = dropLocation;
        this.pickupTime = pickupTime;
        this.cabType = cabType;
        this.driverName = driverName;
    }

    // Getters and Setters
    public int getBookingId() { return bookingId; }
    public void setBookingId(int bookingId) { this.bookingId = bookingId; }

    public String getCustomerName() { return customerName; }
    public void setCustomerName(String customerName) { this.customerName = customerName; }

    public String getCustomerPhone() { return customerPhone; }
    public void setCustomerPhone(String customerPhone) { this.customerPhone = customerPhone; }

    public String getCustomerEmail() { return customerEmail; }
    public void setCustomerEmail(String customerEmail) { this.customerEmail = customerEmail; }

    public String getPickupLocation() { return pickupLocation; }
    public void setPickupLocation(String pickupLocation) { this.pickupLocation = pickupLocation; }

    public String getDropLocation() { return dropLocation; }
    public void setDropLocation(String dropLocation) { this.dropLocation = dropLocation; }

    public LocalDateTime getPickupTime() { return pickupTime; }
    public void setPickupTime(LocalDateTime pickupTime) { this.pickupTime = pickupTime; }

    public String getCabType() { return cabType; }
    public void setCabType(String cabType) { this.cabType = cabType; }

    public String getDriverName() { return driverName; }
    public void setDriverName(String driverName) { this.driverName = driverName; }
}
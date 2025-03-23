package com.datapackage.models;

import java.time.LocalDateTime;

public class Booking {
    private int bookingId;
    private String customerName;
    private String customerPhone;
    private String address;
    private String pickupLocation;
    private double distance;
    private LocalDateTime pickupTime;
    private String cabType;
    private String driver;

    // Default constructor
    public Booking() {}

	public Booking(String customerName, String customerPhone, String address, String pickupLocation, double distance,
			LocalDateTime pickupTime, String cabType, String driver) {
		super();
		this.customerName = customerName;
		this.customerPhone = customerPhone;
		this.address = address;
		this.pickupLocation = pickupLocation;
		this.distance = distance;
		this.pickupTime = pickupTime;
		this.cabType = cabType;
		this.driver = driver;
	}

	public Booking(int bookingId, String customerName, String customerPhone, String address, String pickupLocation,
			double distance, LocalDateTime pickupTime, String cabType, String driver) {
		super();
		this.bookingId = bookingId;
		this.customerName = customerName;
		this.customerPhone = customerPhone;
		this.address = address;
		this.pickupLocation = pickupLocation;
		this.distance = distance;
		this.pickupTime = pickupTime;
		this.cabType = cabType;
		this.driver = driver;
	}

	public int getBookingId() {
		return bookingId;
	}

	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerPhone() {
		return customerPhone;
	}

	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPickupLocation() {
		return pickupLocation;
	}

	public void setPickupLocation(String pickupLocation) {
		this.pickupLocation = pickupLocation;
	}

	public double getDistance() {
		return distance;
	}

	public void setDistance(double distance) {
		this.distance = distance;
	}

	public LocalDateTime getPickupTime() {
		return pickupTime;
	}

	public void setPickupTime(LocalDateTime pickupTime) {
		this.pickupTime = pickupTime;
	}

	public String getCabType() {
		return cabType;
	}

	public void setCabType(String cabType) {
		this.cabType = cabType;
	}

	public String getDriver() {
		return driver;
	}

	public void setDriver(String driver) {
		this.driver = driver;
	}

    
}
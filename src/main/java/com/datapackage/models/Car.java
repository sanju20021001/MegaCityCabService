package com.datapackage.models;

public class Car {
    private int carID;
    private String model;
    private String brand;
    private String licensePlate;
    private double pricePerDay;
    private String status;
    private String image;

    public Car(int carID, String model, String brand, String licensePlate, double pricePerDay, String status, String image) {
        this.carID = carID;
        this.model = model;
        this.brand = brand;
        this.licensePlate = licensePlate;
        this.pricePerDay = pricePerDay;
        this.status = status;
        this.image = image;
    }

    public Car(String model, String brand, String licensePlate, double pricePerDay, String status, String image) {
        this.model = model;
        this.brand = brand;
        this.licensePlate = licensePlate;
        this.pricePerDay = pricePerDay;
        this.status = status;
        this.image = image;
    }

    public int getCarID() {
        return carID;
    }

    public void setCarID(int carID) {
        this.carID = carID;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getLicensePlate() {
        return licensePlate;
    }

    public void setLicensePlate(String licensePlate) {
        this.licensePlate = licensePlate;
    }

    public double getPricePerDay() {
        return pricePerDay;
    }

    public void setPricePerDay(double pricePerDay) {
        this.pricePerDay = pricePerDay;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
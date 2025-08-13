package com.smarttour.model;

public class Tour {
    private int id;
    private String title;
    private String name;
    private String description;
    private double price;
    private String location;
    private String image;

    // Getters and setters
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    
     public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    
    public double getPrice() {
        return price;
    }
    public void setPrice(double price) {
        this.price = price;
    }

    public String getLocation() {
        return location;
    }
    public void setLocation(String location) {
        this.location = location;
    }

    public String getImage() {
        return image;
    }
    public void setImage(String image) {
        this.image = image;
    }
    public String getImageUrl() {
    // Assuming 'image' is just the file name stored in DB
    return "images/" + image; 
}

    public String getLongDescription() {
    // You can modify this as per your database structure
    return description; 
    }
    
    public String getShortDescription() {
    // You can modify this as per your database structure
    return description; 
    }
}

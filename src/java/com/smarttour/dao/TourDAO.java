package com.smarttour.dao;

import com.smarttour.model.Tour;
import com.smarttour.utils.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TourDAO {

    public boolean addTour(Tour tour) {
        String sql = "INSERT INTO tours (title, description, price, location, image) VALUES (?, ?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, tour.getTitle());
            ps.setString(2, tour.getDescription());
            ps.setDouble(3, tour.getPrice());
            ps.setString(4, tour.getLocation());
            ps.setString(5, tour.getImage());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
     public List<Tour> searchTours(String keyword) {
    List<Tour> tours = new ArrayList<>();
    String sql = "SELECT * FROM tours WHERE name LIKE ? OR description LIKE ?";

    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {

        stmt.setString(1, "%" + keyword + "%");
        stmt.setString(2, "%" + keyword + "%");

        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            Tour tour = new Tour();
            tour.setId(rs.getInt("id"));
            tour.setName(rs.getString("name"));
            tour.setDescription(rs.getString("description"));
            tour.setPrice(rs.getDouble("price"));
            tour.setImage(rs.getString("image_url"));
            tours.add(tour);
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }

    return tours;
}
  
    public boolean updateTour(Tour tour) {
    String sql = "UPDATE tours SET title = ?, description = ?, price = ?, location = ?, image = ? WHERE id = ?";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setString(1, tour.getTitle());
        ps.setString(2, tour.getDescription());
        ps.setDouble(3, tour.getPrice());
        ps.setString(4, tour.getLocation());
        ps.setString(5, tour.getImage());
        ps.setInt(6, tour.getId());

        int rowsUpdated = ps.executeUpdate();
        return rowsUpdated > 0;

    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}

    
    public boolean deleteTour(int id) {
    String sql = "DELETE FROM tours WHERE id = ?";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setInt(1, id);

        int rowsDeleted = ps.executeUpdate();
        return rowsDeleted > 0;

    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}

    
    public Tour getTourById(int id) {
    Tour tour = null;
    String sql = "SELECT * FROM tours WHERE id = ?";

    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {

        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            tour = new Tour();
            tour.setId(rs.getInt("id"));
            tour.setName(rs.getString("name"));
            tour.setDescription(rs.getString("description"));
            tour.setPrice(rs.getDouble("price"));
            tour.setImage(rs.getString("image_url")); // Match your column name
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }

    return tour;
}



    public List<Tour> getAllTours() {
        List<Tour> list = new ArrayList<>();
        String sql = "SELECT * FROM tours";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Tour t = new Tour();
                t.setId(rs.getInt("id"));
                t.setTitle(rs.getString("title"));
                t.setDescription(rs.getString("description"));
                t.setPrice(rs.getDouble("price"));
                t.setLocation(rs.getString("location"));
                t.setImage(rs.getString("image"));
                list.add(t);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}

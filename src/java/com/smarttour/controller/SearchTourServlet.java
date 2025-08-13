package com.smarttour.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/searchTour")
public class SearchTourServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Change these according to your DB setup
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/tour_guide";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "root123";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("keyword");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<html><head><title>Search Results</title></head><body>");
        out.println("<h2>Search Results for: " + keyword + "</h2>");

        if (keyword == null || keyword.trim().isEmpty()) {
            out.println("<p>No keyword entered.</p>");
        } else {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
                    String sql = "SELECT name, description, image_url FROM destinations WHERE name LIKE ? OR description LIKE ?";
                    PreparedStatement stmt = conn.prepareStatement(sql);
                    stmt.setString(1, "%" + keyword + "%");

                    ResultSet rs = stmt.executeQuery();
                    boolean found = false;
                    while (rs.next()) {
                        found = true;
                        out.println("<div style='border:1px solid #ccc; padding:10px; margin:10px;'>");
                        out.println("<h3>" + rs.getString("name") + "</h3>");
                        out.println("<p>" + rs.getString("description") + "</p>");
                        String imgUrl = rs.getString("image_url");
                        if (imgUrl != null && !imgUrl.isEmpty()) {
                            out.println("<img src='" + imgUrl + "' alt='Image' style='width:200px;height:auto;'/>");
                        }
                        out.println("</div>");
                    }
                    if (!found) {
                        out.println("<p>No destinations found.</p>");
                    }
                }
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace(out);
            }
        }

        out.println("</body></html>");
    }
}

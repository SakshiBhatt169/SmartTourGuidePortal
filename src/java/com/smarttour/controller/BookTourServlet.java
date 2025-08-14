package com.smarttour.controller;

import com.smarttour.utils.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/BookTourServlet")
public class BookTourServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // Retrieve form parameters
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String destinationName = request.getParameter("destination");
        String travelDate = request.getParameter("date");
        String guestsStr = request.getParameter("people");

        // Session check
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user_id") == null) {
            request.setAttribute("errorMessage", "You must be logged in to book a tour.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        int userId = (int) session.getAttribute("user_id");

        // Validate all fields
        if (username == null || username.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            destinationName == null || destinationName.trim().isEmpty() ||
            travelDate == null || travelDate.trim().isEmpty() ||
            guestsStr == null || guestsStr.trim().isEmpty()) {

            request.setAttribute("errorMessage", "All fields are required!");
            request.getRequestDispatcher("book.jsp").forward(request, response);
            return;
        }

        try {
            int guests = Integer.parseInt(guestsStr);
            double pricePerPerson = 100.0; // Example price
            double totalPrice = pricePerPerson * guests;

            try (Connection conn = DBConnection.getConnection()) {
                // Get destination_id from destinations table
                String destSql = "SELECT destination_id FROM destinations WHERE name = ?";
                PreparedStatement destPs = conn.prepareStatement(destSql);
                destPs.setString(1, destinationName);
                ResultSet rs = destPs.executeQuery();

                if (!rs.next()) {
                    request.setAttribute("errorMessage", "Selected destination does not exist.");
                    request.getRequestDispatcher("book.jsp").forward(request, response);
                    return;
                }

                int destinationId = rs.getInt("destination_id");

                // Insert booking into database
                String sql = "INSERT INTO bookings (user_id, destination_id, booking_date, num_persons, total_price, status, username, email) "
                           + "VALUES (?, ?, ?, ?, ?, 'PENDING', ?, ?)";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setInt(1, userId);
                ps.setInt(2, destinationId);
                ps.setString(3, travelDate);
                ps.setInt(4, guests);
                ps.setDouble(5, totalPrice);
                ps.setString(6, username);
                ps.setString(7, email);

                int rowsInserted = ps.executeUpdate();

                if (rowsInserted > 0) {
                    request.setAttribute("destination", destinationName);
                    request.setAttribute("guests", guests);
                    request.setAttribute("totalPrice", totalPrice);
                    request.getRequestDispatcher("bookingSuccess.jsp").forward(request, response);
                } else {
                    request.setAttribute("errorMessage", "Booking could not be completed. Please try again.");
                    request.getRequestDispatcher("book.jsp").forward(request, response);
                }
            }

        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Number of people must be a valid number.");
            request.getRequestDispatcher("book.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An unexpected error occurred. Please try again.");
            request.getRequestDispatcher("book.jsp").forward(request, response);
        }
    }
}

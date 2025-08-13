package com.smarttour.controller;

import com.smarttour.utils.PasswordUtils;
import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward GET requests to login.jsp
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email").trim();
        String password = request.getParameter("password").trim();

        // Hash the input password (must match registration hash)
        String hashedPassword = PasswordUtils.hashPassword(password);

        // Debug prints
        System.out.println("LoginServlet reached");
        System.out.println("Email: " + email);
        System.out.println("Password: " + password);
        System.out.println("Hashed password: " + hashedPassword);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/tour_guide", "root", "root123")) {

                String sql = "SELECT user_id, name, role FROM users WHERE email=? AND password=?";
                try (PreparedStatement ps = con.prepareStatement(sql)) {
                    ps.setString(1, email);
                    ps.setString(2, hashedPassword);

                    try (ResultSet rs = ps.executeQuery()) {
                        if (rs.next()) {
                            int userId = rs.getInt("user_id");  // Corrected column
                            String name = rs.getString("name");
                            String role = rs.getString("role");

                            System.out.println("Login successful: user_id=" + userId);

                            HttpSession session = request.getSession();
                            session.setAttribute("user_id", userId);
                            session.setAttribute("name", name);
                            session.setAttribute("role", role);
                            session.setAttribute("email", email);

                            // Redirect based on role
                            if ("ADMIN".equalsIgnoreCase(role)) {
                                response.sendRedirect(request.getContextPath() + "/admin/dashboard.jsp");
                            } else {
                                response.sendRedirect(request.getContextPath() + "/index.jsp");
                            }
                            return;
                        } else {
                            System.out.println("Login failed: invalid email/password");
                            request.setAttribute("errorMessage", "Invalid Email or Password");
                            request.getRequestDispatcher("login.jsp").forward(request, response);
                        }
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An unexpected error occurred. Please try again.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}

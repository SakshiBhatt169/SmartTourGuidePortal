package com.smarttour.controller;

import com.smarttour.dao.UserDAO;
import com.smarttour.model.User;
import com.smarttour.utils.PasswordUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AddUserServlet")
public class AddUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String role = request.getParameter("role");

        try {
            // Hash the password before saving
            String hashedPassword = PasswordUtils.hashPassword(password);

            User user = new User();
            user.setName(name);
            user.setEmail(email);
            user.setPassword(hashedPassword);
            user.setPhone(phone);
            user.setRole(role);

            UserDAO dao = new UserDAO();
            boolean success = dao.registerUser(user);

            if (success) {
                response.sendRedirect(request.getContextPath() + "/AdminUserListServlet");
            } else {
                response.getWriter().println("Failed to add user. Please try again.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}

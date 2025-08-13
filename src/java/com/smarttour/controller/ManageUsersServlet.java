package com.smarttour.controller;

import com.smarttour.dao.UserDAO;
import com.smarttour.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/manageUsers")
public class ManageUsersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<User> users = userDAO.getAllUsers();
        System.out.println("Fetched users count: " + (users != null ? users.size() : 0)); // Debug log
        request.setAttribute("users", users);
        request.getRequestDispatcher("/admin/manageUsers.jsp").forward(request, response);
    }
}

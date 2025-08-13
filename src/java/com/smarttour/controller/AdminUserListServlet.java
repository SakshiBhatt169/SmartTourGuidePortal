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

public class AdminUserListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Fetch all users from DB
            UserDAO userDAO = new UserDAO();
            List<User> users = userDAO.getAllUsers();

            // Pass data to JSP
            request.setAttribute("userList", users);

            // Forward to JSP page
            request.getRequestDispatcher("/admin/userlist.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to fetch user list");
        }
    }
}

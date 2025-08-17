package com.smarttour.controller;

import com.smarttour.dao.UserDAO;
import com.smarttour.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/EditUserServlet")
public class EditUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr != null) {
            int id = Integer.parseInt(idStr);
            UserDAO userDAO = new UserDAO();
            User user = userDAO.getUserById(id);
            request.setAttribute("user", user);
            request.getRequestDispatcher("/admin/editUser.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String role = request.getParameter("role");

        User user = new User();
        user.setUserId(id);
        user.setName(name);
        user.setEmail(email);
        user.setPhone(phone);
        user.setRole(role);

        UserDAO userDAO = new UserDAO();
        userDAO.updateUser(user);

        response.sendRedirect(request.getContextPath() + "/AdminUserListServlet");
    }
}

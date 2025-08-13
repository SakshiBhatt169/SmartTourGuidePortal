package com.smarttour.controller;

import com.smarttour.dao.UserDAO;
import com.smarttour.model.User;
import com.smarttour.utils.PasswordUtils;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = PasswordUtils.hashPassword(req.getParameter("password"));
        String phone = req.getParameter("phone");

        User user = new User(name, email, password, phone);
        UserDAO dao = new UserDAO();
        boolean ok = dao.registerUser(user);
        if (ok) {
            resp.sendRedirect("login.jsp?msg=registered");
        } else {
            resp.sendRedirect("register.jsp?error=1");
        }
    }
}


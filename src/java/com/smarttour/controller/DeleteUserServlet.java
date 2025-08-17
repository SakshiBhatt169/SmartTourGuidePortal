package com.smarttour.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smarttour.dao.UserDAO;

@WebServlet("/DeleteUserServlet") // 
public class DeleteUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");
        if (idParam != null) {
            try {
                int userId = Integer.parseInt(idParam);
                UserDAO userDAO = new UserDAO();
                boolean deleted = userDAO.deleteUserById(userId);

                if (deleted) {
                    response.sendRedirect(request.getContextPath() + "/admin/dashboard.jsp?msg=User deleted successfully");

                } else {
                    response.sendRedirect(request.getContextPath() + "/admin/dashboard.jsp?msg=Failed to delete user");
                }
            } catch (NumberFormatException e) {
                response.sendRedirect("/admin/dashboard.jsp?msg=Invalid user ID");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/dashboard.jsp?msg=User ID missing");
        }
    }
}

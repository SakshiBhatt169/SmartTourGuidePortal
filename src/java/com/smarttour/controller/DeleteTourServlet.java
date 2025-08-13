package com.smarttour.controller;

import com.smarttour.dao.TourDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/DeleteTourServlet")
public class DeleteTourServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        TourDAO tourDAO = new TourDAO();
        boolean success = tourDAO.deleteTour(id);

        if (success) {
            response.sendRedirect(request.getContextPath() + "/AdminTourListServlet");
        } else {
            response.getWriter().println("Error: Could not delete tour.");
        }
    }
}


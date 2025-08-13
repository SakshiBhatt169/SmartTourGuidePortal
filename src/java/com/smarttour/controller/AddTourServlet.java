package com.smarttour.controller;

import com.smarttour.dao.TourDAO;
import com.smarttour.model.Tour;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AddTourServlet")
public class AddTourServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/admin/addtour.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        String location = request.getParameter("location");
        String image = request.getParameter("image");

        Tour tour = new Tour();
        tour.setTitle(title);
        tour.setDescription(description);
        tour.setPrice(price);
        tour.setLocation(location);
        tour.setImage(image);

        TourDAO tourDAO = new TourDAO();
        boolean success = tourDAO.addTour(tour);

        if (success) {
            response.sendRedirect(request.getContextPath() + "/AdminTourListServlet");
        } else {
            response.getWriter().println("Error: Could not add tour.");
        }
    }
}

package com.smarttour.controller;

import com.smarttour.dao.TourDAO;
import com.smarttour.model.Tour;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/EditTourServlet")
public class EditTourServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr == null || idStr.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Tour ID is missing");
            return;
        }

        int id;
        try {
            id = Integer.parseInt(idStr);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Tour ID");
            return;
        }

        TourDAO tourDAO = new TourDAO();
        Tour tour = tourDAO.getTourById(id);

        if (tour == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Tour not found");
            return;
        }

        request.setAttribute("tour", tour);
        request.getRequestDispatcher("/admin/edittour.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");
        String priceStr = request.getParameter("price");

        if (idStr == null || idStr.trim().isEmpty() || priceStr == null || priceStr.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Required parameters missing");
            return;
        }

        int id;
        double price;
        try {
            id = Integer.parseInt(idStr);
            price = Double.parseDouble(priceStr);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid number format");
            return;
        }

        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String location = request.getParameter("location");
        String image = request.getParameter("image");

        Tour tour = new Tour();
        tour.setId(id);
        tour.setTitle(title);
        tour.setDescription(description);
        tour.setPrice(price);
        tour.setLocation(location);
        tour.setImage(image);

        TourDAO tourDAO = new TourDAO();
        boolean success = tourDAO.updateTour(tour);

        if (success) {
            response.sendRedirect(request.getContextPath() + "/AdminTourListServlet");
        } else {
            response.getWriter().println("Error: Could not update tour.");
        }
    }
}

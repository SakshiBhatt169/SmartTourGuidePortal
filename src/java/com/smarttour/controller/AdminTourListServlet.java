package com.smarttour.controller;

import com.smarttour.dao.TourDAO;
import com.smarttour.model.Tour;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/AdminTourListServlet")
public class AdminTourListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        TourDAO tourDAO = new TourDAO();
        List<Tour> tourList = tourDAO.getAllTours();
        request.setAttribute("tourList", tourList);
        request.getRequestDispatcher("/admin/tourlist.jsp").forward(request, response);
    }
}
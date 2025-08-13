package com.smarttour.controller;

import com.smarttour.dao.TourDAO;
import com.smarttour.model.Tour;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/TourDetailsServlet")
public class TourDetailsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        TourDAO dao = new TourDAO();
        Tour t = dao.getTourById(id);
        req.setAttribute("tour", t);
        req.getRequestDispatcher("/tour-details.jsp").forward(req, resp);
    }
}

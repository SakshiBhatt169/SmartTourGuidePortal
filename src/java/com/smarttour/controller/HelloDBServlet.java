package com.smarttour.controller;

import com.smarttour.utils.DBConnection;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

public class HelloDBServlet extends HttpServlet {
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    try (Connection con = DBConnection.getConnection()) {
      resp.getWriter().println("DB connected OK");
    } catch (Exception e) {
      resp.getWriter().println("DB connection failed: " + e.getMessage());
    }
  }
}


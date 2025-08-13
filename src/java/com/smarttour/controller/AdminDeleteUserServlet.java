package com.smarttour.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.smarttour.utils.DBConnection;
@WebServlet("/admin/deleteUser")
public class AdminDeleteUserServlet extends HttpServlet {
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    int id = Integer.parseInt(req.getParameter("id"));
    // write delete SQL in DAO or here quickly:
    try (Connection con = DBConnection.getConnection();
         PreparedStatement ps = con.prepareStatement("DELETE FROM users WHERE user_id=?")) {
        ps.setInt(1, id); ps.executeUpdate();
    } catch(SQLException e){ e.printStackTrace(); }
    resp.sendRedirect(req.getContextPath()+"/admin/users");
  }
}


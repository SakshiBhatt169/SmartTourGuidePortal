<%@ page import="com.smarttour.dao.UserDAO" %>
<%@ page import="com.smarttour.model.User" %>
<%@ page import="java.util.List" %>
<%
    String role = (String) session.getAttribute("role");
    String name = (String) session.getAttribute("name");
    if (role == null || !role.equalsIgnoreCase("ADMIN")) {
        response.sendRedirect("../login.jsp?error=unauthorized");
        return;
    }

    UserDAO userDAO = new UserDAO();
    List<User> users = userDAO.getAllUsers();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Admin Dashboard - Manage Users</title>
    <!-- Bootstrap 5 CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            min-height: 100vh;
            display: flex;
            background-color: #f8f9fa;
        }
        /* Sidebar styles */
        #sidebar {
            min-width: 220px;
            max-width: 220px;
            background: #343a40;
            color: #fff;
            min-height: 100vh;
        }
        #sidebar .nav-link {
            color: #adb5bd;
        }
        #sidebar .nav-link.active {
            background-color: #495057;
            color: #fff;
            font-weight: bold;
        }
        #sidebar .nav-link:hover {
            background-color: #495057;
            color: #fff;
        }
        /* Main content */
        #content {
            flex-grow: 1;
            padding: 2rem;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <nav id="sidebar" class="d-flex flex-column p-3">
        <h3 class="text-center mb-4">SmartTour Admin</h3>
        <ul class="nav nav-pills flex-column mb-auto">
            <li class="nav-item">
                <a href="dashboard.jsp" class="nav-link active">Dashboard</a>
            </li>
            <li>
                <a href="adduser.jsp" class="nav-link">Add User</a>
            </li>
            <li>
                <a href="addtour.jsp" class="nav-link">Add Tour</a>
            </li>
            <li>
                <a href="manageUsers.jsp" class="nav-link">Manage Tours</a>
            </li>
            <li>
                <a href="../LogoutServlet" class="nav-link text-danger">Logout</a>
            </li>
        </ul>
    </nav>

    <!-- Main Content -->
    <div id="content">
        <h2>Welcome, <%= name %></h2>
        <hr />

        <h4>Manage Users</h4>
        <a href="adduser.jsp" class="btn btn-primary mb-3">Add New User</a>

        <div class="table-responsive">
            <table class="table table-striped table-bordered align-middle">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th style="width: 150px;">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% for(User user : users) { %>
                        <tr>
                            <td><%= user.getUserId() %></td>
                            <td><%= user.getName() %></td>
                            <td><%= user.getEmail() %></td>
                            <td><%= user.getRole() %></td>
                            <td>
                                <!-- FIXED: Removed EL, only scriptlet -->
                                <a href="<%= request.getContextPath() %>/EditUserServlet?id=<%= user.getUserId() %>" class="btn btn-sm btn-warning">Edit</a>

                                <a href="<%= request.getContextPath() %>/DeleteUserServlet?id=<%= user.getUserId() %>" 
                                   class="btn btn-sm btn-danger" 
                                   onclick="return confirm('Are you sure to delete user <%= user.getName() %>?');">
                                   Delete
                                </a>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

<%@ page import="java.util.List" %>
<%@ page import="com.smarttour.model.User" %>
<%
    List<User> userList = (List<User>) request.getAttribute("userList");
%>
<html>
<head>
    <title>Admin - User List</title>
</head>
<body>
<h2>Registered Users</h2>
<table border="1" cellpadding="5">
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Email</th>
    <th>Phone</th>
    <th>Role</th>
    <th>Actions</th>
</tr>
<%
if (userList != null) {
    for (User u : userList) {
%>
<tr>
    <td><%= u.getUserId() %></td>
    <td><%= u.getName() %></td>
    <td><%= u.getEmail() %></td>
    <td><%= u.getPhone() %></td>
    <td><%= u.getRole() %></td>
    <td>
        <a href="editUser?id=<%= u.getUserId() %>">Edit</a> |
        <a href="deleteUser?id=<%= u.getUserId() %>" 
           onclick="return confirm('Are you sure you want to delete this user?');">
           Delete
        </a>
    </td>
</tr>
<%
    }
}
%>
</table>
</body>
</html>

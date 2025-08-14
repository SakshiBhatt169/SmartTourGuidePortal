<%@ page import="com.smarttour.model.User" %>
<%
    User user = (User) request.getAttribute("user");
%>
<html>
<head>
    <title>Edit User</title>
</head>
<body>
<h2>Edit User</h2>
<form method="post" action="${pageContext.request.contextPath}/editUserServlet">
    <input type="hidden" name="id" value="<%= user.getUserId() %>"/>
    <p>Name: <input type="text" name="name" value="<%= user.getName() %>" required></p>
    <p>Email: <input type="email" name="email" value="<%= user.getEmail() %>" required></p>
    <p>Phone: <input type="text" name="phone" value="<%= user.getPhone() %>"></p>
    <p>Role: 
        <select name="role">
            <option value="user" <%= "user".equals(user.getRole()) ? "selected" : "" %>>User</option>
            <option value="admin" <%= "admin".equals(user.getRole()) ? "selected" : "" %>>Admin</option>
        </select>
    </p>
    <input type="submit" value="Update">
</form>
</body>
</html>

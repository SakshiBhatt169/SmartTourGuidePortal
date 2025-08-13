<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New User - Admin</title>
</head>
<body>
<h2>Add New User</h2>
<form action="<%=request.getContextPath()%>/AddUserServlet" method="post">
    <label>Name:</label><br>
    <input type="text" name="name" required><br><br>

    <label>Email:</label><br>
    <input type="email" name="email" required><br><br>

    <label>Password:</label><br>
    <input type="password" name="password" required><br><br>

    <label>Phone:</label><br>
    <input type="text" name="phone"><br><br>

    <label>Role:</label><br>
    <select name="role">
        <option value="user">User</option>
        <option value="admin">Admin</option>
    </select><br><br>

    <input type="submit" value="Add User">
</form>

<p><a href="<%=request.getContextPath()%>/AdminUserListServlet">Back to User List</a></p>
</body>
</html>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New Tour</title>
</head>
<body>
<h2>Add New Tour</h2>
<form action="<%=request.getContextPath()%>/AddTourServlet" method="post">
    <label>Title:</label><br>
    <input type="text" name="title" required><br><br>

    <label>Description:</label><br>
    <textarea name="description" rows="4" cols="50" required></textarea><br><br>

    <label>Price:</label><br>
    <input type="number" step="0.01" name="price" required><br><br>

    <label>Location:</label><br>
    <input type="text" name="location" required><br><br>

    <label>Image URL:</label><br>
    <input type="text" name="image" required><br><br>

    <input type="submit" value="Add Tour">
</form>

<p><a href="<%=request.getContextPath()%>/AdminTourListServlet">Back to Tour List</a></p>
</body>
</html>
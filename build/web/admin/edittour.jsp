<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.smarttour.model.Tour" %>
<html>
<head>
    <title>Edit Tour</title>
</head>
<body>
<h2>Edit Tour</h2>

<%
    Tour tour = (Tour) request.getAttribute("tour");
    if (tour == null) {
%>
    <p>Error: No tour data found.</p>
<%
    } else {
%>

<form action="<%=request.getContextPath()%>/EditTourServlet" method="post">
    <input type="hidden" name="id" value="<%= tour.getId() %>" />
    Title: <input type="text" name="title" value="<%= tour.getTitle() %>" /><br/>
    Description: <textarea name="description"><%= tour.getDescription() %></textarea><br/>
    Price: <input type="text" name="price" value="<%= tour.getPrice() %>" /><br/>
    Location: <input type="text" name="location" value="<%= tour.getLocation() %>" /><br/>
    Image URL: <input type="text" name="image" value="<%= tour.getImage() %>" /><br/>
    <input type="submit" value="Update Tour" />
</form>

<%
    }
%>

</body>
</html>


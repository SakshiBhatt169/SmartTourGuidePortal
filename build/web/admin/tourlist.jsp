<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.smarttour.model.Tour" %> <%-- Change to your Tour class package --%>
<html>
<head>
    <title>Tour List</title>
</head>
<body>
<h2>Tour List</h2>

<p><a href="<%=request.getContextPath()%>/admin/addtour.jsp">Add New Tour</a></p>

<table border="1">
    <tr>
        <th>Title</th>
        <th>Description</th>
        <th>Price</th>
        <th>Location</th>
        <th>Image</th>
    </tr>

<%
    // Retrieve tour list from request attribute
    List<Tour> tourList = (List<Tour>) request.getAttribute("tourList");
    if (tourList != null) {
        for (Tour tour : tourList) {
%>
    <tr>
        <td><%= tour.getTitle() %></td>
        <td><%= tour.getDescription() %></td>
        <td><%= tour.getPrice() %></td>
        <td><%= tour.getLocation() %></td>
        <td><img src="<%= tour.getImage() %>" alt="Tour Image" width="100"></td>
        <td>
            <a href="EditTourServlet?id=<%= tour.getId() %>">Edit</a> 
            <a href="DeleteTourServlet?id=<%= tour.getId() %>" onclick="return confirm('Are you sure?');">Delete</a>

        </td>

    </tr>
<%
        }
    } else {
%>
    <tr>
        <td colspan="5">No tours available</td>
    </tr>
<%
    }
%>
</table>
</body>
</html>
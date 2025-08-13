<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.smarttour.model.Tour" %>
<html>
<head>
    <title>Search Results</title>
    <style>
        .tour-card {
            border: 1px solid #ccc;
            padding: 15px;
            margin: 10px;
            display: inline-block;
            width: 250px;
            vertical-align: top;
            text-align: center;
        }
        .tour-card img {
            width: 100%;
            height: 150px;
            object-fit: cover;
        }
    </style>
</head>
<body>
<h2>Search Results</h2>

<%
    List<Tour> tours = (List<Tour>) request.getAttribute("searchResults");
    if (tours != null && !tours.isEmpty()) {
        for (Tour tour : tours) {
%>
            <div class="tour-card">
                <img src="<%= tour.getImage() %>" alt="<%= tour.getName() %>">
                <h3><%= tour.getName() %></h3>
                <p><%= tour.getDescription() %></p>
                <p>Price: ₹<%= tour.getPrice() %></p>
                <a href="tourDetails.jsp?id=<%= tour.getId() %>">View Details</a>
            </div>
<%
        }
    } else {
%>
    <p>No tours found for your search.</p>
<%
    }
%>

</body>
</html>

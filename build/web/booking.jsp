<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>Book Tour</title>
</head>
<body>
    <h2>Book Your Tour</h2>
    <form action="BookTourServlet" method="post">
        <input type="hidden" name="destination_id" value="${param.destination_id}">
        <input type="hidden" name="user_id" value="${sessionScope.user_id}">

        <label>Number of Persons:</label>
        <input type="number" name="num_persons" min="1" required><br><br>

        <label>Booking Date:</label>
        <input type="date" name="booking_date" required><br><br>

        <button type="submit">Confirm Booking</button>
    </form>
</body>
</html>

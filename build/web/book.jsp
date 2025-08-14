<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    String destination = request.getParameter("tourName"); // from previous page or link
%>
<!DOCTYPE html>
<html>
<head>
    <title>Book Tour</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f8f9fa; }
        .booking-card {
            background: white;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            margin-top: 50px;
        }
        .btn-custom {
            background-color: #28a745;
            color: white;
            font-weight: bold;
        }
        .btn-custom:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="booking-card">
        <h2 class="text-center text-primary mb-4">Book Your Tour</h2>

        <%-- Show error message if set by servlet --%>
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger">${errorMessage}</div>
        </c:if>

        <form action="BookTourServlet" method="post">
            <input type="hidden" name="destination" value="<%= (destination != null) ? destination : "" %>">

            <div class="mb-3">
                <label class="form-label">Your Name</label>
                <input type="text" class="form-control" name="name" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" class="form-control" name="email" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Travel Date</label>
                <input type="date" class="form-control" name="date" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Number of People</label>
                <input type="number" class="form-control" name="people" min="1" required>
            </div>

            <button type="submit" class="btn btn-custom w-100">Confirm Booking</button>
        </form>
    </div>
</div>
</body>
</html>

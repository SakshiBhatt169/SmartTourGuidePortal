<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/header.jsp" %>
<%@ include file="includes/navbar.jsp" %>
<html>
<head>
    <title>Book a Tour</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .booking-container {
            width: 50%;
            margin: 50px auto;
            background: #fff;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
            border-radius: 8px;
        }
        .booking-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        .booking-container input, .booking-container select {
            width: 100%;
            padding: 12px;
            margin: 8px 0 20px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .booking-container input[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }
        .booking-container input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="booking-container">
        <h2>Book Your Tour</h2>
        
        <% String errorMessage = (String) request.getAttribute("errorMessage");
           if(errorMessage != null) { %>
            <div class="error-message"><%= errorMessage %></div>
        <% } %>
        
        <form action="BookTourServlet" method="post">
            <input type="text" name="username" placeholder="Your Name" required>
            <input type="email" name="email" placeholder="Email" required>
            
            <select name="destination" required>
                <option value="">Select Destination</option>
                <option value="Goa">Goa</option>
                <option value="Jaipur">Jaipur</option>
                <option value="Manali">Manali</option>
                <option value="Kerala">Kerala</option>
                <option value="Kashmir">Kashmir</option>
            </select>
            
            <input type="date" name="date" required>
            <input type="number" name="people" placeholder="Number of People" min="1" required>
            
            <input type="submit" value="Book Now">
        </form>
    </div>
</body>
</html>

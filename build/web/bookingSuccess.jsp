<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Booking Confirmation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 50px;
            background: #f8f9fa;
        }
        .confirmation-card {
            background: white;
            display: inline-block;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        .btn-home {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .btn-home:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
    <div class="confirmation-card">
        <h2 style="color:green;">Booking Confirmed!</h2>
        <p>Thank you, <b>${name}</b>.</p>
        <p>Your booking for <b>${destination}</b> has been placed successfully.</p>
        <p>Number of Guests: <b>${guests}</b></p>
        <p>Total Price: <b>$${totalPrice}</b></p>
        <p>Status: <b>PENDING CONFIRMATION</b></p>
        <a href="index.jsp" class="btn-home">Go Back to Home</a>
    </div>
</body>
</html>

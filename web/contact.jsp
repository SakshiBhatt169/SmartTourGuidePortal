<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact - Smart Tour</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<header>
    <h1>Smart Tour</h1>
    <nav>
        <a href="home.jsp">Home</a>
        <a href="tours.jsp">Tours</a>
        <a href="contact.jsp">Contact</a>
        <a href="login.jsp">Login</a>
    </nav>
</header>

<main>
    <h2>Contact Us</h2>
    <form method="post" action="sendMessage.jsp">
        <label>Name:</label>
        <input type="text" name="name" required><br>
        <label>Email:</label>
        <input type="email" name="email" required><br>
        <label>Message:</label>
        <textarea name="message" required></textarea><br>
        <button type="submit">Send</button>
    </form>
</main>

<footer>
    <p>&copy; 2025 Smart Tour</p>
</footer>
</body>
</html>
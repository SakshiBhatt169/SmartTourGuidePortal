<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <h2>Login</h2>

    <%-- Display success message if any --%>
    <%
        String msg = (String) request.getAttribute("msg");
        if (msg != null) {
    %>
        <p style="color:green"><%= msg %></p>
    <%
        }
    %>

    <%-- Display error message from servlet --%>
    <%
        String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null) {
    %>
        <p style="color:red"><%= errorMessage %></p>
    <%
        }
    %>

    <form action="LoginServlet" method="post">
        <input name="email" type="email" placeholder="Email" required /><br/>
        <input name="password" type="password" placeholder="Password" required /><br/>
        <button type="submit">Login</button>
    </form>

    <p><a href="register.jsp">Register</a></p>
</body>
</html>

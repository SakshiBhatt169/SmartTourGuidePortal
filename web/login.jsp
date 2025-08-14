<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #4facfe, #00f2fe);
            margin: 0;
            padding: 0;
        }

        .login-container {
            width: 350px;
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            margin: 80px auto;
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }

        input {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border-radius: 6px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            font-size: 14px;
        }

        button {
            background-color: #4facfe;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }

        button:hover {
            background-color: #00c6ff;
        }

        p {
            margin-top: 15px;
        }

        a {
            text-decoration: none;
            color: #4facfe;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        .message {
            font-size: 14px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

    <div class="login-container">
        <h2>Login</h2>

        <%-- Display success message if any --%>
        <%
            String msg = (String) request.getAttribute("msg");
            if (msg != null) {
        %>
            <p class="message" style="color:green"><%= msg %></p>
        <%
            }
        %>

        <%-- Display error message from servlet --%>
        <%
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null) {
        %>
            <p class="message" style="color:red"><%= errorMessage %></p>
        <%
            }
        %>

        <form action="LoginServlet" method="post">
            <input name="email" type="email" placeholder="Email" required />
            <input name="password" type="password" placeholder="Password" required />
            <button type="submit">Login</button>
        </form>

        <p><a href="register.jsp">Register</a></p>
    </div>

</body>
</html>

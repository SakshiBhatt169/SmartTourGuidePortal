<!DOCTYPE html>
<html>
<head><title>Register</title></head>
<body>
<h2>Register</h2>
<c:if test="${param.error != null}">
  <p style="color:red">${param.error}</p>
</c:if>
<form action="RegisterServlet" method="post">
  <input name="name" placeholder="Full name" required /><br/>
  <input name="email" type="email" placeholder="Email" required /><br/>
  <input name="password" type="password" placeholder="Password" required /><br/>
  <input name="phone" placeholder="Phone" /><br/>
  <button type="submit">Register</button>
</form>
<p>Already have an account? <a href="login.jsp">Login</a></p>
</body>
</html>



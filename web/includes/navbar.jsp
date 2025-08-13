<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container">
    <a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">
        <i class="fa-solid fa-map-location-dot"></i> SmartTour
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navMenu">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/tour-packages.jsp">Tours</a></li>
        <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/contact.jsp">Contact</a></li>
        <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/login.jsp">Login</a></li>
      </ul>
    </div>
  </div>
</nav>

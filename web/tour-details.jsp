<%@ page import="com.smarttour.model.Tour" %>
<%
  Tour tour = (Tour) request.getAttribute("tour");
%>
<%@ include file="includes/header.jsp" %>
<body>
  <%@ include file="includes/navbar.jsp" %>
  <div class="container mt-4">
    <div class="row">
      <div class="col-md-8">
        <img src="<%= tour.getImageUrl() %>" class="img-fluid" alt="Tour image">
        <h2 class="mt-3"><%= tour.getTitle() %></h2>
        <p><strong>Location:</strong> <%= tour.getLocation() %></p>
        <p><%= tour.getLongDescription() %></p>
      </div>
      <div class="col-md-4">
        <div class="card p-3">
          <h5>Book Now</h5>
          <p>Price: ?<%= tour.getPrice() %></p>
          <a href="booking.jsp?tourId=<%=tour.getId()%>" class="btn btn-success">Book</a>
        </div>
      </div>
    </div>
  </div>
  <%@ include file="includes/footer.jsp" %>
</body>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.smarttour.model.Tour" %>
<%@ include file="includes/header.jsp" %>
<body>
  <%@ include file="includes/navbar.jsp" %>

  <div class="container mt-4">
    <h2>Tour Packages</h2>
    <div class="row">
      <%
         List<Tour> tourList = (List<Tour>) request.getAttribute("tourList");
         if (tourList == null) {
      %>
          <p>No tours available.</p>
      <%
         } else {
            for (Tour t : tourList) {
      %>
        <div class="col-md-4 mb-4">
          <div class="card">
            <img src="<%= t.getImageUrl() %>" class="card-img-top card-img" alt="Tour Image">
            <div class="card-body">
              <h5><%= t.getTitle() %></h5>
              <p><%= t.getShortDescription() %></p>
              <p><strong>₹ <%= t.getPrice() %></strong></p>
              <a href="<%=request.getContextPath()%>/TourDetailsServlet?id=<%= t.getId() %>" class="btn btn-primary">View</a>
            </div>
          </div>
        </div>
      <%
            }
         }
      %>
    </div>
  </div>

  <%@ include file="includes/footer.jsp" %>
</body>

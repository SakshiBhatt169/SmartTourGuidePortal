<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="includes/header.jsp" %>
<body style="background: url('images/travel-bg.jpg') center center/cover no-repeat fixed;">

  <%@ include file="includes/navbar.jsp" %>

  <!-- Hero Section -->
  <section class="hero-banner d-flex align-items-center justify-content-center text-white position-relative" 
           style="background: url('images/hero-bg.jpg') center center/cover no-repeat; height: 90vh; border-radius: 0 0 20px 20px;">
    <!-- Dark overlay -->
    <div style="position: absolute; top:0; left:0; width:100%; height:100%; background: rgba(0,0,0,0.55); z-index:1;"></div>

    <div class="text-center container position-relative" style="z-index: 2;">
      <h1 class="display-3 fw-bold" style="text-shadow: 2px 2px 8px rgba(0,0,0,0.7); letter-spacing: 1px;">Discover Your Next Adventure</h1>
      <p class="lead mb-4" style="font-size: 1.4rem; text-shadow: 1px 1px 6px rgba(0,0,0,0.6);">Explore the best tours and destinations across India</p>
      <form action="${pageContext.request.contextPath}/SearchTourServlet" method="get">
    <input type="text" name="q" placeholder="Search for a tour">
    <button type="submit">Search</button>
</form>



    </div>
  </section>

  <!-- Featured Tours -->
  <section class="container mt-5">
    <h2 class="mb-4 text-center fw-semibold">Featured Tours</h2>
    <div class="row row-cols-1 row-cols-md-3 g-4" id="featuredTours">
      <div class="col">
        <div class="card h-100 shadow-lg border-0 rounded-3">
          <img src="images/goa.jpg" class="card-img-top rounded-top" alt="Goa Beach" style="object-fit: cover; height: 220px;">
          <div class="card-body">
            <h5 class="card-title fw-bold">Goa Beach Paradise</h5>
            <p class="card-text text-muted">4 days · Beach stay · Guided tours included</p>
            <form action="book.jsp" method="get">
    <input type="hidden" name="destinationId" value="${destination.id}">
    <button type="submit" class="btn btn-primary">Book Now</button>
</form>

          </div>
        </div>
      </div>
      <div class="col">
        <div class="card h-100 shadow-lg border-0 rounded-3">
          <img src="images/jaipur.jpg" class="card-img-top rounded-top" alt="Jaipur Palace" style="object-fit: cover; height: 220px;">
          <div class="card-body">
            <h5 class="card-title fw-bold">Jaipur Heritage Experience</h5>
            <p class="card-text text-muted">5 days · Palaces · Culture & Cuisine</p>
            <form action="book.jsp" method="get">
    <input type="hidden" name="destinationId" value="${destination.id}">
    <button type="submit" class="btn btn-primary">Book Now</button>
</form>

          </div>
        </div>
      </div>
      <div class="col">
        <div class="card h-100 shadow-lg border-0 rounded-3">
          <img src="images/kerala.jpg" class="card-img-top rounded-top" alt="Kerala Backwaters" style="object-fit: cover; height: 220px;">
          <div class="card-body">
            <h5 class="card-title fw-bold">Kerala Backwaters Retreat</h5>
            <p class="card-text text-muted">6 days · Houseboat · Nature & Relaxation</p>
            <form action="book.jsp" method="get">
    <input type="hidden" name="destinationId" value="${destination.id}">
    <button type="submit" class="btn btn-primary">Book Now</button>
</form>

          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Why Choose Us -->
  <section class="bg-light py-5 mt-5" style="background: linear-gradient(to bottom, rgba(255,255,255,0.9), rgba(245,245,245,0.9)), url('images/why-choose-bg.jpg') center/cover no-repeat;">
    <div class="container text-center">
      <h3 class="mb-4 fw-semibold">Why Choose SmartTour?</h3>
      <div class="row">
        <div class="col-md-4">
          <i class="fa fa-dollar-sign fa-3x mb-3 text-primary"></i>
          <h5>Best Price Guarantee</h5>
          <p class="text-muted">Competitive prices with no hidden fees.</p>
        </div>
        <div class="col-md-4">
          <i class="fa fa-user-shield fa-3x mb-3 text-primary"></i>
          <h5>Trusted Guides</h5>
          <p class="text-muted">Experienced local guides for every destination.</p>
        </div>
        <div class="col-md-4">
          <i class="fa fa-check-circle fa-3x mb-3 text-primary"></i>
          <h5>Easy Booking</h5>
          <p class="text-muted">Simple and secure booking process.</p>
        </div>
      </div>
    </div>
  </section>

  <%@ include file="includes/footer.jsp" %>

</body>

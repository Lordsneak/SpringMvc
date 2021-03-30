<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Reservation - Home</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="OnlineReserve/resources/assets/img/favicon.png" rel="icon">
  <link href="OnlineReserve/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href='<c:url value="/resources/assets/vendor/icofont/icofont.min.css" />'/>
<link rel="stylesheet" href='<c:url value="/resources/assets/vendor/remixicon/remixicon.css" />'/>
<link rel="stylesheet" href='<c:url value="/resources/assets/vendor/venobox/venobox.css" />'/>
<link rel="stylesheet" href='<c:url value="/resources/assets/vendor/owl.carousel/assets/owl.carousel.min.css" />'/>
<link rel="stylesheet" href='<c:url value="/resources/assets/vendor/aos/aos.css" />'/>
	 <link rel="stylesheet" href='<c:url value="/resources/assets/vendor/boxicons/css/boxicons.min.css" />'/>
  

  <!-- Template Main CSS File -->
  <link rel="stylesheet" href='<c:url value="/resources/assets/css/style.css" />'/>

</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">

      <h1 class="logo mr-auto"><a href="/OnlineReserve/">Online Reservation</a></h1>

      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li class="active"><a href="/OnlineReserve/">Home</a></li>
                        <c:if test="${not empty isLoggedIn}">
   					 <li><a href="/OnlineReserve/logout">Logout</a></li>
							</c:if>
				<c:if test="${empty isLoggedIn}">
    <li><a href="/OnlineReserve/signin">Login</a></li>
				</c:if>
								<c:if test="${empty isLoggedIn}">
          <li><a href="/OnlineReserve/signup">Register</a></li>
				</c:if>
                        

          

        </ul>
      </nav><!-- .nav-menu -->
    </div>
  </header><!-- End Header -->



  <main id="main">

    <!-- ======= About Section ======= -->
    <section id="about" class="about">
      <div class="container" data-aos="fade-up">
<c:if test="${not empty isLoggedIn}">
        <div class="section-title">
          <h2>Reserve</h2>
        </div>

        <div class="row content">
        
          <div class="col-lg-12 pt-8 pt-lg-0">

							
            <c:if test="${isReservationMade != null}">
              <c:if test="${isReservationMade eq 'true'}">
                <div class="alert alert-success" role="alert">Your reservation
                  booked successfully</div>
              </c:if>
    
              <c:if test="${isReservationMade eq 'false'}">
                <div class="alert alert-warning" role="alert">You can't make an
                  reservation - Please Login ! </div>
              </c:if>
            </c:if>

            <form action="reservation" method="POST">
              <div class="col-md-3">
          <div class="form-group">
              <label for="sel1">Choose date appointment:</label>
              <select class="form-control" id="sel1" name="reservationDate">
                    <c:forEach var="date" items="${dateList}">
                      <option class="w3-padding-16" value="${date.reservationDate}">${date.reservationDate}</option>
                    </c:forEach>
              </select>
            </div> 
      </div>
      <div class="col-md-3">
          <div class="form-group">
              <label for="sel1">Choose time appointment :</label>
              <select class="form-control" id="sel1" name="reservationTime">
                    <c:forEach var="date" items="${dateList}">
                      <option class="w3-padding-16" value="${date.reservationTime}">${date.reservationTime}</option>
                    </c:forEach>
              </select>
            </div> 
      </div>
      <div class="col-md-3">
          <div class="form-group">
              <label for="sel1">Choose number of seats:</label>
              <select class="form-control" id="sel1" name="seatsNumber">
                    <c:forEach var="date" items="${dateList}">
                      <option class="w3-padding-16" value="${date.seatsNumber}">${date.seatsNumber}</option>
                    </c:forEach>
              </select>
            </div> 
      
      </div>
      
      <div class="col-md-6">
      
      <button class="btn mx-25 btn-primary" type="submit">Reserve</button>
      
      </div>
      
              </form>

          </div>
        </div>
</c:if>

				
								<c:if test="${empty isLoggedIn}">
<h3>You need  <a href="signin">login</a> To reserve</h3>
				</c:if>
      </div>
    </section><!-- End About Section -->






  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">

    <div class="footer-top">




    <div class="container d-md-flex py-4">

      <div class="mr-md-auto text-center text-md-left">
        <div class="copyright">
          &copy; Copyright <strong><span></span></strong>. All Rights Reserved
        </div>
        <div class="credits">
     
        </div>
      </div>
      <div class="social-links text-center text-md-right pt-3 pt-md-0">
        <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
        <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
        <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
        <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
        <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
      </div>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top"><i class="ri-arrow-up-line"></i></a>
  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script type="text/javascript"  src="<c:url value="/resources/assets/vendor/jquery/jquery.min.js" />"></script>
    <script type="text/javascript"  src="<c:url value="/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
    <script type="text/javascript"  src="<c:url value="/resources/assets/vendor/jquery.easing/jquery.easing.min.js" />"></script>
    <script type="text/javascript"  src="<c:url value="/resources/assets/vendor/waypoints/jquery.waypoints.min.js" />"></script>
    <script type="text/javascript"  src="<c:url value="/resources/assets/vendor/counterup/counterup.min.js" />"></script>
    <script type="text/javascript"  src="<c:url value="/resources/assets/vendor/venobox/venobox.min.js" />"></script>
    <script type="text/javascript"  src="<c:url value="/resources/assets/vendor/owl.carousel/owl.carousel.min.js" />"></script>
    <script type="text/javascript"  src="<c:url value="/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js" />"></script>
    <script type="text/javascript"  src="<c:url value="/resources/assets/vendor/aos/aos.js" />"></script>


  <!-- Template Main JS File -->
    <script type="text/javascript"  src="<c:url value="/resources/assets/js/main.js" />"></script>

</body>

</html>
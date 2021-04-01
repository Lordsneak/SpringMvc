<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Reservation - Admin</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="OnlineReserve/resources/assets/img/favicon.png" rel="icon">
  <link href="OnlineReserve/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" />
  <!-- Vendor CSS Files -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href='<c:url value="/resources/assets/vendor/icofont/icofont.min.css" />'/>
<link rel="stylesheet" href='<c:url value="/resources/assets/vendor/remixicon/remixicon.css" />'/>
<link rel="stylesheet" href='<c:url value="/resources/assets/vendor/venobox/venobox.css" />'/>
<link rel="stylesheet" href='<c:url value="/resources/assets/vendor/owl.carousel/assets/owl.carousel.min.css" />'/>
<link rel="stylesheet" href='<c:url value="/resources/assets/vendor/aos/aos.css" />'/>
	 <link rel="stylesheet" href='<c:url value="/resources/assets/vendor/boxicons/css/boxicons.min.css" />'/>
	 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" />
  

  <!-- Template Main CSS File -->
  <link rel="stylesheet" href='<c:url value="/resources/assets/css/style.css" />'/>

</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">

      <h1 class="logo mr-auto"><a href="index.html">Online Reservation</a></h1>

      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li class="active"><a href="/OnlineReserve/">Home</a></li>
          <li><a href="logout">Logout</a></li>

        </ul>
      </nav><!-- .nav-menu -->
    </div>
  </header><!-- End Header -->



  <main id="main">

    <!-- ======= About Section ======= -->
    <section id="" class="about">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Admin Panel </h2>
        </div>

        <div class="row content">
        
          <div class="col-lg-12 pt-8 pt-lg-0">


            <form method="POST" action="createDate">
        
              <c:if test="${isReservationCreated != null}">
                  <c:if test="${isReservationCreated eq 'true'}">
                      <li class="w3-green w3-xlarge w3-padding-16">Date Created
                          Successfully</li>
                  </c:if>

                  <c:if test="${isReservationCreated eq 'false'}">
                      <li class="w3-red w3-xlarge w3-padding-16">Failed to create
                          a date</li>
                  </c:if>
              </c:if>

              <label id="reservationDate">Enter Reservation date:</label> 
              <input
                  class="form-control" name="reservationDate"
                  autocomplete="off" type="date" id="appointmentDate"> 
                  <label
                  id="reservationTime">Enter Reservation time:</label> 
                  <input class="form-control" name="reservationTime"
                  id="reservationTime" autocomplete="off" type="text"> 
                  <label
                  id="reservationTime">Enter number os seats:</label> 
                  <input
                  class="form-control" autocomplete="off"
                  placeholder="Enter number os seats" name="seatsNumber"
                  type="number">
              <br>
                  <button type="submit" class="btn btn-primary">Create
                      new date</button>

              
          </form>
          
          
          <br>
          
          <h3 class="title-5 m-b-35">Users want you to approve their registration</h3>
                  <div class="table-data__tool">
                      <div class="table-data__tool-right">

                          <div class="rs-select2--dark rs-select2--sm rs-select2--dark2">

                              <div class="dropDownSelect2"></div>
                          </div>
                      </div>
                  </div>
                  <div class="table-responsive table-responsive-data2">
                      
                      <table class="table table-data2">
                          <thead>
                              <tr>
                                  <th>FirstName</th>
                                  <th>LastName</th>
                                  <th>Email</th>
                                  <th>Accept</th>
                                  <th>Refuse</th>
                                  
                              </tr>
                          </thead>
                          <tbody>
                              <c:forEach var="student" items="${users}">
                              <tr class="tr-shadow">
                                  <td>${student.firstName}</td>
                                  <td>${student.lastName}</td>
                                  <td>
                                      <span class="block-email"></span>${student.email}</span>
                                  </td>
                                  <td>
                                      <div class="table-data-feature">
<form action="accept" method="post">
<input type="hidden" name="id" value="${student.id}"> <input
  type="hidden" name="email" value="${student.email}">
<button type="submit" class="btn"><i class="fa fa-check" aria-hidden="true"></i></button>
</form>

                                      </div>
                                  </td>
                                  <td>
                                  <form action="reject" method="post">
<input type="hidden" name="id" value="${student.id}"> <input
  type="hidden" name="email" value="${student.email}">
<button type="submit" class="btn"><i class="fa fa-times" aria-hidden="true"></i></button>
</form>
                                  </td>

                              </tr>
                              </c:forEach>
                          </tbody>
                      </table>
                      <br>
                      
                       <h3 class="title-5 m-b-35">Users want you to approve their appointments</h3>
                  <div class="table-responsive table-responsive-data2">
                      <table class="table table-data2">
                          <thead>
                          
                              <tr>
                                  <th>FirstName</th>
                                  <th>LastName</th>
                                  <th>Email</th>
                                  <th>Reservation Date</th>
                                  <th>Reservation Time</th>
                                  <th>Seats Number</th>
                                  <th>Accept</th>
                                  <th>Refuse</th>
                              </tr>
                          </thead>
                          <tbody>
                              <c:forEach var="reservation" items="${reservationsList}">
                              <tr class="tr-shadow">
                                  <td>${reservation.user.firstName}</td>
                                  <td>${reservation.user.lastName}</td>
                                  <td>
                                      <span class="block-email">${reservation.user.email}</span>
                                  </td>
                                  <td>${reservation.reservationDate}</td>
                                  <td>${reservation.reservationTime}</td>
                                  <td>${reservation.seatsNumber}</td>
                                  <td>
                                  <div class="table-data-feature d-inline">
                                  

                                    <div class="d-inline">
                                                                     <form action="acceptReservation" method="post">
                                              <input type="hidden" name="id" value="${reservation.id}">
                                              <input type="hidden" name="user.email"
                                                  value="${reservation.user.email}">
                                              <button type="submit" class="btn"><i class="fa fa-check" aria-hidden="true"></i></button>

                                    </div>

                                    
                                  </div>

                                  </td>
                                  <td>
                                                                      
                                                                              </form>
                                                                                   <form action="rejectReservation" method="post">
                                              <input type="hidden" name="id" value="${reservation.id}">
                                              <input type="hidden" name="user.email"
                                                  value="${reservation.user.email}">
                                              <button type="submit" class="btn"><i class="fa fa-times" aria-hidden="true"></i></button>
                                          </form> 
                                  </td>

                              </tr>
                          </c:forEach>
                          </tbody>
                      </table>
                      
                      
              </div>
          </div>
      </div>
  </div>
<!-- MAIN CONTENT-->


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
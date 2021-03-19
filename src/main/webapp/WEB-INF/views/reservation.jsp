<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<!-- Appointment Section -->
			<div class="w3-padding-64 w3-content w3-text-grey"
				id="ask-for-appointment" style="margin-top: 200px">
				<h2 class="w3-text-light-grey">Appointment</h2>
				<hr style="width: 200px" class="w3-opacity">

				<c:if test="${isReservationMade != null}">
					<c:if test="${isReservationMade eq 'true'}">
						<div class="w3-panel w3-green w3-padding-16">Your reservation
							booked successfully</div>
					</c:if>

					<c:if test="${isReservationMade eq 'false'}">
						<div class="w3-panel w3-red w3-padding-16">You can't make an
							reservation</div>
					</c:if>
				</c:if>

				<form action="reservation" method="POST">
				
					<div class="w3-padding-16" style="display: flex">
						<select class="w3-select w3-padding-16" name="reservationDate">
							<option class="w3-padding-16" value="" disabled selected>Choose
								date appointment</option>
							<c:forEach var="date" items="${dateList}">
								<option class="w3-padding-16" value="${date.reservationDate}">${date.reservationDate}</option>
							</c:forEach>
							
						</select> 
						
						<select class="w3-select w3-padding-16" name="reservationTime">
							<option class="w3-padding-16" value="" disabled selected>Choose
								time appointment</option>
								
							<c:forEach var="date" items="${dateList}">
								<option class="w3-padding-16" value="${date.reservationTime}">${date.reservationTime}</option>
							</c:forEach>

						</select>
						
						<select class="w3-select w3-padding-16" name="seatsNumber">
							<option class="w3-padding-16" value="" disabled selected>Choose
								number of seats</option>

							<c:forEach var="date" items="${dateList}">
								<option class="w3-padding-16" value="${date.seatsNumber}">${date.seatsNumber}</option>
							</c:forEach>
						</select>
					</div>
					<button
						class="w3-margin-top w3-block w3-button w3-light-grey w3-padding-large"
						type="submit">CONFIRM APPOINTMENT</button>
				</form>
				<!-- End Appointment Section -->


</body>
</html>
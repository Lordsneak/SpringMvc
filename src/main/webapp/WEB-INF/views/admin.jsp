<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

				<form method="POST" action="createDate">
					<div class="w3-dark-grey w3-xlarge w3-padding-16">Create new
						date</div>

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

					<label id="reservationDate">Enter Reservation date:</label> <input
						class="w3-input w3-padding-16" name="reservationDate"
						autocomplete="off" type="date" id="appointmentDate"> <label
						id="reservationTime">Enter Reservation time:</label> <input
						class="w3-input w3-padding-16" name="reservationTime"
						id="reservationTime" autocomplete="off" type="time"> <input
						class="w3-input w3-padding-16" autocomplete="off"
						placeholder="Enter number os seats" name="seatsNumber"
						type="number">
					<li class="w3-light-grey w3-padding-24">
						<button class="w3-button w3-white w3-padding-large w3-hover-black">Create
							new date</button>
					</li>
				</form>
				
					<div class="w3-container">
		<h2 class="w3-large">Users want you to approve their registration</h2>
		<table class="w3-table-all">
			<tr>
				<th class="w3-center w3-small">First Name</th>
				<th class="w3-center w3-small">Last Name</th>
				<th class="w3-center w3-small">Email</th>
				<th class="w3-center w3-small">Approve</th>
			</tr>

			<c:forEach var="student" items="${users}">
				<tr>
					<td class="w3-center w3-tiny">${student.firstName}</td>
					<td class="w3-center w3-tiny">${student.lastName}</td>
					<td class="w3-center w3-tiny">${student.email}</td>
					<td class="w3-center w3-row"
						style="display: flex; width: fit-content; margin: 0 auto;">
						<form action="accept" method="post">
							<input type="hidden" name="id" value="${student.id}"> <input
								type="hidden" name="email" value="${student.email}">
							<button type="submit" class="w3-button w3-tiny">Accept</button>
						</form>
						<form action="reject" method="post">
							<input type="hidden" name="id" value="${student.id}"> <input
								type="hidden" name="email" value="${student.email}">
							<button type="submit" class="w3-button w3-tiny">Reject</button>
						</form>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>

<div class="w3-container">
		<h2 class="w3-large">Users want you to approve their appointments</h2>
		<table class="w3-table-all">
			<tr>
				<th class="w3-center w3-small">First Name</th>
				<th class="w3-center w3-small">Last Name</th>
				<th class="w3-center w3-small">Email</th>
				<th class="w3-center w3-small">Reservation Date</th>
				<th class="w3-center w3-small">Reservation Time</th>
				<th class="w3-center w3-small">Seats Number</th>
				<th class="w3-center w3-small">Approve</th>
			</tr>
////

			<c:forEach var="reservation" items="${reservationsList}">
				<tr>
					<td class="w3-center w3-tiny">${reservation.user.firstName}</td>
					<td class="w3-center w3-tiny">${reservation.user.lastName}</td>
					<td class="w3-center w3-tiny">${reservation.user.email}</td>
					<td class="w3-center w3-tiny">${reservation.reservationDate}</td>
					<td class="w3-center w3-tiny">${reservation.reservationTime}</td>
					<td class="w3-center w3-tiny">${reservation.seatsNumber}</td>
					<td class="w3-center w3-row"
						style="display: flex; width: fit-content; margin: 0 auto;">
						<form action="acceptReservation" method="post">
							<input type="hidden" name="id" value="${reservation.id}">
							<input type="hidden" name="user.email"
								value="${reservation.user.email}">
							<button type="submit" class="w3-button w3-tiny">Accept</button>
						</form>
						<form action="rejectReservation" method="post">
							<input type="hidden" name="id" value="${reservation.id}">
							<input type="hidden" name="user.email"
								value="${reservation.user.email}">
							<button type="submit" class="w3-button w3-tiny">Reject</button>
						</form>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>
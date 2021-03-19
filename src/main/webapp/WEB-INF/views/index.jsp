<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <h1>Login</h1>
    
    <form method="POST" action="login">
							<div class="w3-dark-grey w3-xlarge w3-padding-16">Login</div>

							<c:if test="${isLoggedIn != null}">
								<c:if test="${isLoggedIn eq 'true'}">
									<div class="w3-green w3-xlarge w3-padding-16">You logged
										in successfully</div>
								</c:if>

								<c:if test="${isLoggedIn eq 'false'}">
									<div class="w3-red w3-xlarge w3-padding-16">Failed to
										login</div>
								</c:if>
							</c:if>

							<p class="w3-left-align w3-block label-email">Email</p>
							<input class="w3-input w3-padding-16"
								placeholder="Enter your email" autocomplete="off" type="text"
								name="email">
							<p class="w3-left-align w3-block label-password">Password</p>
							<input class="w3-input w3-padding-16"
								placeholder="Enter your password" type="password"
								name="password">
							<div class="w1-padding-16"
								style="text-align: left; margin: 7px; border: none;">
								<span class="w3-opacity">Your info will be securitised</span>
							</div>
							<div class="w3-light-grey w3-padding-24">
								<button
									class="w3-button w3-white w3-padding-large w3-hover-black"
									type="submit">Login</button>
							</div>
						</form>
						
						<h1>Register</h1>
						
						<form method="POST" action="/OnlineReserve/register">
							<div class="w3-dark-grey w3-xlarge w3-padding-16">Sign Up</div>

							<c:if test="${isSignedUp != null}">
								<c:if test="${isSignedUp eq 'true'}">
									<li class="w3-green w3-xlarge w3-padding-16">You signed up
										successfully</li>
								</c:if>

								<c:if test="${isSignedUp eq 'false'}">
									<li class="w3-red w3-xlarge w3-padding-16">Failed to sign
										up</li>
								</c:if>
							</c:if>

							<input class="w3-input w3-padding-16"
								placeholder="Enter your firstname" name="firstName"
								autocomplete="off" type="text"> <input
								class="w3-input w3-padding-16" placeholder="Enter your lastname"
								name="lastName" autocomplete="off" type="text"> <input
								class="w3-input w3-padding-16" placeholder="Enter your email"
								name="email" autocomplete="off" type="text"> <input
								class="w3-input w3-padding-16" placeholder="Enter your password"
								name="password" type="password">
							<li class="w3-light-grey w3-padding-24">
								<button
									class="w3-button w3-white w3-padding-large w3-hover-black">Sign
									Up</button>
							</li>
						</form>
</body>
</html>
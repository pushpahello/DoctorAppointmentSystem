<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home page</title>
</head>
<style>
<%@include file="/CSS/index.css"%>

</style>
<form action="<%=request.getContextPath()%>/homepageController"
	method="post">
	<div class="header">

		<img src="https://www.cogenthealth.com.np/images/logo.png"
			style="height: 2cm;"> <input type="submit" class="button2"
			name="button" value="Join Now"> <input type="submit"
			class="button1" name="button" value="Sign Up">
	</div>

	<div class="second">
		<p
			style="font-size: 20px; float: left; margin-top: 0.5cm; margin-left: 20%;">
			Book Appointments online anytime, anywhere.</p>
		<p style="float: left; font-size: 20px; margin-top: 0.5cm;">
			<a href="LearnMore.jsp">Learn more</a>
		</p>
	</div>

	<div class="third">

		<h1 id="slogan">Our doctors are available 24/7</h1>
		<input style="vertical-align: middle" type="submit" class="getstarted"
			name="button" value="Get Started">

	</div>

	<div class="second">
		<small
			style="font-size: 20px; float: center; margin-top: 0.5cm; margin-left: 30%;">All
			rights reserved 2023</small>
	</div>
</form>
</body>
</html>
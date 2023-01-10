<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
<meta charset="UTF-8">
    <!---<title> Responsive Registration Form | CodingLab </title>--->
    <link rel="stylesheet" href="style.css">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
</head>
<style>
<%@
include file="/CSS/signup.css"%>
</style> 
<body>
<div class="container">
    <div class="title">Sign Up</div>
    <div class="content">
      <form action="<%=request.getContextPath()%>/RegisterController"
					method="post">
        <div class="user-details">
          <div class="input-box">
            <span class="details">First Name</span>
            <input type="text" name="txtFname" placeholder="Enter your name" required>
          </div>
          <div class="input-box">
            <span class="details">Last Name</span>
            <input type="text" name="txtLname" placeholder="Enter your username" required>
          </div>
          <div class="input-box">
            <span class="details">Email</span>
            <input type="email" name="txtEmail" placeholder="Enter your email" required>
          </div>
          <div class="input-box">
            <span class="details">Phone Number</span>
            <input type="text" name="txtPhone" placeholder="Enter your number" required>
          </div>
           <div class="input-box">
            <span class="details">Age</span>
            <input type="text" name="txtAge" placeholder="Enter your age" required>
          </div>
           <div class="input-box">
            <span class="details">Address</span>
            <input type="text" name="txtAddress"  placeholder="Enter your address" required>
          </div>
          <div class="input-box">
            <span class="details">Username</span>
            <input type="text" name="txtUsername" placeholder="Enter your password" required>
          </div>
          <div class="input-box">
            <span class="details">Password</span>
            <input type="password" name="txtPassword" placeholder="Confirm your password" required>
          </div>
        </div>
        <div class="gender-details">
          <input type="radio" name="gender" value="M" id="dot-1">
          <input type="radio" name="gender" value="F" id="dot-2">
          <input type="radio" name="gender" value="O" id="dot-3">
          <span class="gender-title">Gender</span>
          <div class="category">
            <label for="dot-1" >
            <span class="dot one"></span>
            <span class="gender" >Male</span>
          </label>
          <label for="dot-2">
            <span class="dot two"></span>
            <span class="gender">Female</span>
          </label>
          <label for="dot-3">
            <span class="dot three"></span>
            <span class="gender">Prefer not to say</span>
            </label>
          </div>
        </div>
        <div class="button">
          <input type="submit" value="Sign Up">
        </div>
      </form>
    </div>
  </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap CSS -->
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css'>
<!-- Font Awesome CSS -->
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css'>
<title>Log In</title>
</head>

<style>
<%@
include file="/CSS/index.css"%>
</style> 

 
<body>
	<input type="hidden" id="status" value="<%=request.getAttribute("status") %>"/>

<div align="left">
 <form action="<%= request.getContextPath() %>/loginController" method="post">
 
   <div class="bg-img">
      <div class="content">
        <header>Login Form</header>
        
          <div class="field">
            <span class="fa fa-user"></span>
            <input type="text" name="loginID" placeholder="Username/Email/Phone">
          </div>
          <div class="field space">
            <span class="fa fa-lock"></span>
          <!-- <input type="password" name="loginPassword" class="pass-key"  placeholder="Password"> -->  
          <input id="password-field" type="password" name="password" name="loginPassword" class="pass-key"  placeholder="Password"> 
            <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
          </div>
          
          <div class="field">
            <input type="submit"name="button" value="LOGIN">
          </div>
      
      
       
        <div class="signup">Don't have account?
          <div>
            <input class="buttonn2" type="submit"name="button" value="SIGN UP">
          </div>
        </div>
      </div>
    </div>
  

</form> </div> 
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js'></script>
<script>
$(".toggle-password").click(function() {
 
  $(this).toggleClass("fa-eye fa-eye-slash");
  var input = $($(this).attr("toggle"));
  if (input.attr("type") == "password") {
    input.attr("type", "text");
  } else {
    input.attr("type", "password");
  }
});    
</script>

<script src="js/jquery-3.6.1.min.js"></script>
<script src="js/main.js"></script>
<script type="text/javascript">
	var status = document.getElementById("status").value;
	if(status=="failed"){
		 alert("Either username or password is incorrect !!");
	}
</script>
</body>
</html>
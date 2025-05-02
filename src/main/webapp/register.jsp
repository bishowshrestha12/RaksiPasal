<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Register - Raksi Pasal</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href='register.css' rel='stylesheet'>
  <style>
  	body, html {
      height: 100%;
      margin: 0;
      background: url('./images/register.jpg') no-repeat center center fixed;
      background-size: cover;
      font-family: 'Segoe UI', sans-serif;
    }
  </style>
</head>
<body>
  <div class="container-wrapper">
    <div class="register-section">
      <div class="brand-logo">
        <img src="./images/logo.png" alt="Raksi Pasal Logo">
      </div>
      <form action="${pageContext.request.contextPath}/register" method="post">
       
        <%
  String error = request.getParameter("error");
  if (error != null) {
%>
  <div class="alert alert-danger text-center">
    <%
      switch (error) {
        case "fname": 
          out.print("First name must contain only letters."); 
          break;
        case "lname": 
          out.print("Last name must contain only letters."); 
          break;
        case "password": 
          out.print("Password must be at least 6 characters, include a capital letter, a number, and a special character."); 
          break;
        case "password_mismatch": 
          out.print("Passwords do not match."); 
          break;
        case "db":
          out.print("Database error occurred.");
          break;
        case "exception":
          out.print("Something went wrong. Please try again later.");
          break;
        default:
          out.print("Unknown error.");
          break;
      }
    %>
  </div>
<%
  } 
%>
        
        
        <div class="form-group">
          <input type="text" class="form-control" id="firstName" name="fname" placeholder="First Name">
        </div>
        <div class="form-group">
          <input type="text" class="form-control" id="lastName" name = "lname" placeholder="Last Name">
        </div>
        <div class="form-group">
            <input type="date" class="form-control" id="dob" name = "dob" placeholder="Date of Birth">
          </div>
        <div class="form-group">
          <input type="email" class="form-control" id="email" name="email" placeholder="Email">
        </div>
        <div class="form-group">
          <input type="password" class="form-control" id="password" name="password" placeholder="Password">
          <span class="toggle-password" onclick="togglePassword('password', this)">👁️</span>
        </div>
        <div class="form-group">
          <input type="password" class="form-control" id="confirmPassword" name= "confirmpassword" placeholder="Confirm Password">
          <span class="toggle-password" onclick="togglePassword('confirmPassword', this)">👁️</span>
        </div>
        <button type="submit" class="btn btn-gold mt-3">Register</button>
        <div class="already-account text-center">
          <a href="login.jsp">Already have an account? Login</a>
        </div>
      </form>
    </div>
  </div>

  <script>
    function togglePassword(fieldId, icon) {
      const input = document.getElementById(fieldId);
      const isVisible = input.type === "text";
      input.type = isVisible ? "password" : "text";
      icon.textContent = isVisible ? "🙈" : "👁️";
    }
  </script>
</body>
</html>
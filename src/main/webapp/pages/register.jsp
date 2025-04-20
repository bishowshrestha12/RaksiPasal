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
</head>
<body>
  <div class="container-wrapper">
    <div class="register-section">
      <div class="brand-logo">
        <img src="../images/logo.png" alt="Raksi Pasal Logo">
      </div>
      <form>
        <div class="form-group">
          <input type="text" class="form-control" id="firstName" placeholder="First Name">
        </div>
        <div class="form-group">
          <input type="text" class="form-control" id="lastName" placeholder="Last Name">
        </div>
        <div class="form-group">
            <input type="date" class="form-control" id="dob" placeholder="Date of Birth">
          </div>
        <div class="form-group">
          <input type="email" class="form-control" id="email" placeholder="Email">
        </div>
        <div class="form-group">
          <input type="password" class="form-control" id="password" placeholder="Password">
          <span class="toggle-password" onclick="togglePassword('password', this)">👁️</span>
        </div>
        <div class="form-group">
          <input type="password" class="form-control" id="confirmPassword" placeholder="Confirm Password">
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
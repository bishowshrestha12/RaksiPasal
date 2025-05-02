<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Login - Raksi Pasal</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href='login.css'  rel='stylesheet'>

</head>
<body>
  <div class="container-wrapper">
    <div class="login-section">
      <div class="brand-logo">
        <img src="../images/logo.png" alt="Raksi Pasal Logo">
      </div>
      <form action="${pageContext.request.contextPath}/LoginController" method="post">
        <%
  String error = request.getParameter("error");
  if (error != null) {
%>
  <div class="alert alert-danger text-center mt-2">
    <%
      if ("Password".equals(error)) {
        out.print("Password must be at least 6 characters and contain an uppercase letter, a number, and a special character.");
      } else if ("InvalidCredentials".equals(error)) {
        out.print("Invalid email or password.");
      } else if ("ServerError".equals(error)) {
        out.print("An internal error occurred. Please try again later.");
      }
    %>
  </div>
<%
  }
%> 
        <div class="form-group">
          <input type="email" class="form-control" id="email" name ="email" placeholder="Email">
        </div>
        <div class="form-group">
          <input type="password" class="form-control" id="password" name="password" placeholder="Password">
          <span class="toggle-password" id="toggleIcon" onclick="togglePassword()">🙈</span>
        </div>
        <button type="submit" class="btn btn-gold mt-3">Login</button>
        <div class="create-account text-center">
          <a href="register.jsp">Create New Account</a>
        </div>
      </form>
    </div>
  </div>

  <script>
    function togglePassword() {
      const passwordInput = document.getElementById("password");
      const toggleIcon = document.getElementById("toggleIcon");
      const isPasswordVisible = passwordInput.type === "text";

      passwordInput.type = isPasswordVisible ? "password" : "text";
      toggleIcon.textContent = isPasswordVisible ? "🙈" : "👁️";
    }
  </script>
</body>
</html>

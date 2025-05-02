<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>User Profile - Raksi Pasal</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    /* Your existing styles */
  </style>
</head>
<body>

<div class="container mt-5">
  <div class="profile-header">
    <img src="images/kala_patthar.jpg" alt="User Photo" class="profile-pic mb-3">
    <h2 class="mb-0">${user.firstname} ${user.lastname}</h2>
    <p class="text-muted">${user.email}</p>
    <!-- Trigger modal -->
    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editProfileModal">Edit Profile</button>
  </div>

  <div class="row mt-4">
    <div class="col-md-6 offset-md-3">
      <ul class="list-group">
        <li class="list-group-item"><strong>Email:</strong> ${user.email}</li>
        <li class="list-group-item"><strong>First Name:</strong> ${user.firstname}</li>
        <li class="list-group-item"><strong>Last Name:</strong> ${user.lastname}</li>
        <li class="list-group-item"><strong>Date of Birth:</strong> ${user.dob}</li>
      </ul>
    </div>
  </div>
</div>

<!-- Edit Profile Modal -->
<div class="modal fade" id="editProfileModal" tabindex="-1" aria-labelledby="editProfileModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <form method="POST" action="Profile">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="editProfileModalLabel">Edit Profile</h5>
          <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <div class="mb-3">
            <label for="firstName" class="form-label">First Name</label>
            <input type="text" class="form-control" id="firstName" name="firstName" value="${user.firstname}" required>
          </div>
          <div class="mb-3">
            <label for="lastName" class="form-label">Last Name</label>
            <input type="text" class="form-control" id="lastName" name="lastName" value="${user.lastname}" required>
          </div>
          <div class="mb-3">
            <label for="dob" class="form-label">Date of Birth</label>
            <input type="date" class="form-control" id="dob" name="dob" value="${user.dob}" required>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
          <button type="submit" class="btn btn-primary">Save Changes</button>
        </div>
      </div>
    </form>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

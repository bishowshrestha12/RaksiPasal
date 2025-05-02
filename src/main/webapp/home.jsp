<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Raksi Pasal</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap" rel="stylesheet">
  <link href='home.css' rel='stylesheet'>


</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-custom">
    <div class="container-fluid d-flex justify-content-between align-items-center flex-wrap">
      <a class="navbar-brand d-flex align-items-center" href="#">
        <img src="./images/logo.png" alt="Logo" class="logo-img">
      </a>
      <div class="d-flex align-items-center flex-grow-1 justify-content-center">
        <input class="form-control me-2 search-input" type="search" placeholder="Search..." id="search" aria-label="Search">
        
        <div class="ac">
          <select class="form-select me-2 w-auto" id="ac">
            <option selected>All Categories</option>
            <option value="1">Whiskey</option>
            <option value="2">Beers</option>
            <option value="3">Wines</option>
          </select>
        </div>
      </div>
      <div class="d-flex align-items-center">
        <a class="btn btn-outline-gold me-2" href="#">Cart</a>
        <a class="btn btn-outline-gold" href="login.jsp">Profile</a>
      </div>
    </div>
  </nav>

  <div class="position-relative">
    <div class="nav-section py-2" id="navLinks">
      <div class="container-fluid">
        <ul class="navbar-nav d-flex flex-row justify-content-center flex-wrap mb-0">
          <li class="nav-item mx-3"><a class="nav-link" href="#">New Arrivals</a></li>
          <li class="nav-item mx-3"><a class="nav-link" href="#">Liquor & Spirits</a></li>
          <li class="nav-item mx-3"><a class="nav-link" href="#">Whiskey</a></li>
          <li class="nav-item mx-3"><a class="nav-link" href="#">Beers</a></li>
          <li class="nav-item mx-3"><a class="nav-link" href="#">Wines</a></li>
        </ul>
      </div>
    </div>

    <div id="heroCarousel" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="./images/home_first_image.jpg" class="d-block w-100 img-fluid" alt="Slide 1">
        </div>
        <div class="carousel-item">
          <img src="./images/the_finest.jpg" class="d-block w-100 img-fluid" alt="Slide 2">
        </div>
        <div class="carousel-item">
          <img src="./images/olddurbar.jpg" class="d-block w-100 img-fluid" alt="Slide 3">
        </div>
        <div class="carousel-item">
          <img src="./images/G&G.jpg" class="d-block w-100 img-fluid" alt="Slide 4">
        </div>
        <div class="carousel-item">
          <img src="./images/kala_patthar.jpg" class="d-block w-100 img-fluid" alt="Slide 5">
        </div>
        <div class="carousel-item">
          <img src="../images/bundles.jpg" class="d-block w-100 img-fluid" alt="Slide 6">
        </div>
      </div>

      <div class="carousel-caption-button">
        <a href="product.html" class="btn mt-3">Buy Products</a>
      </div>

      <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
      </button>

      <div class="carousel-indicators">
        <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="0" class="active" aria-current="true"></button>
        <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="1"></button>
        <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="2"></button>
        <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="3"></button>
        <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="4"></button>
        <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="5"></button>
      </div>
    </div>
  </div>
  
  
  <!-- Featured Drinks Section -->
  <section class="featured-bg mt-0 py-0">
   
        
    <div class="featured-drinks-container">
    <h3 class="mb-0 fw-bold" id="featureddrinksheader" >Featured Drinks</h3>
      
        </div>
     

      
      
  </section>
  
  <!-- Popup Element -->
  <div id="popup" class="popup-message">Added to cart</div>
  
  <footer class="text-center mt-5">
    <div class="container">
      <p>&copy; 2025 Raksi Pasal. All rights reserved.</p>
      <p>
        <a href="#" style="margin: 0 10px; color: rgb(196, 183, 5); text-decoration: none;">About</a> |
        <a href="#" style="margin: 0 10px; color:  rgb(196, 183, 5); text-decoration: none;">Contact</a> |
        <a href="#" style="margin: 0 10px; color:  rgb(196, 183, 5); text-decoration: none;">Privacy Policy</a> 
      </p>
    </div>
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    const navLinks = document.getElementById("navLinks");

    window.addEventListener("scroll", () => {
      if (window.scrollY > 10) {
        navLinks.classList.add("scrolled");
      } else {
        navLinks.classList.remove("scrolled");
      }
    });

    document.addEventListener('DOMContentLoaded', function () {
      const heroCarousel = document.querySelector('#heroCarousel');
      new bootstrap.Carousel(heroCarousel, {
        interval: 5000,
        pause: false,
        wrap: true
      });
    });
    const popup = document.getElementById('popup');
  
    document.querySelectorAll('.col').forEach(card => {
      const minusBtn = card.querySelector('.minus');
      const plusBtn = card.querySelector('.plus');
      const qtyDisplay = card.querySelector('.qty-display');
      const addBtn = card.querySelector('.btn-cart-small');
      const productName = card.querySelector('.card-title').textContent;
      let qty = 1;
  
      minusBtn.addEventListener('click', () => {
        if (qty > 1) {
          qty--;
          qtyDisplay.textContent = qty;
        }
      });
  
      plusBtn.addEventListener('click', () => {
        qty++;
        qtyDisplay.textContent = qty;
      });
  
      addBtn.addEventListener('click', () => {
        popup.textContent = `${productName} added to cart!`;
        popup.classList.add('show');
        setTimeout(() => popup.classList.remove('show'), 2000);
      });
    });
  </script>
  
</body>
</html>

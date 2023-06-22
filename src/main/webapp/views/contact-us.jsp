<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us | ABC Cars</title>
</head>
<body class="bg-gray-900">
<jsp:include page="header.jsp" />
 <div class="h-screen relative" style="z-index:1;">
     <img src="https://images.unsplash.com/photo-1568605117036-5fe5e7bab0b7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
      alt="Background Image"
      class="absolute top-0 left-0 w-full h-full object-cover opacity-60"
    />
  <div class="md:flex md:justify-center text-white">
    <div class="md:w-1/3 mt-16"  style="z-index:999;">
      <div class="text-center mb-6">
        <h1 class="text-4xl font-bold text-white">Contact Us</h1>
      </div>
      <div class="text-center mb-8">
        <p class="text-xl text-white">ABC Cars is located in the heart of the city, where we offer the best selection of quality cars at affordable prices.</p>
      </div>
      <div class="text-center mb-8">
        <p class="text-xl text-white">For all inquiries, please contact us using the information below:</p>
      </div>
      <div class="text-center mb-8">
        <ul class="list-none text-lg">
          <li class="mb-4">
            <i class="fas fa-map-marker-alt text-white mr-2"></i>123 Main Street, City, ST 12345
          </li>
          <li class="mb-4">
            <i class="fas fa-phone text-white mr-2"></i>+1 (123) 456-7890
          </li>
          <li class="mb-4">
            <i class="fas fa-envelope text-white mr-2"></i>info@abccars.com
          </li>
          <li>
            <div class="flex justify-center">
              <a class="text-white hover:opacity-70 mr-4" href="#">
                <span class="sr-only">Instagram</span>
                <i class="fab fa-instagram fa-2x"></i>
              </a>
              <a class="text-white hover:opacity-70 mr-4" href="#">
                <span class="sr-only">Youtube</span>
                <i class="fab fa-youtube fa-2x"></i>
              </a>
              <a class="text-white hover:opacity-70" href="#">
                <span class="sr-only">Twitter</span>
                <i class="fab fa-twitter fa-2x"></i>
              </a>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </div>
</div>
 <jsp:include page="footer.jsp" />
</body>
</html>

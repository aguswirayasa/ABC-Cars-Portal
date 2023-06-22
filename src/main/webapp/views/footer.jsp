<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="bg-gray-900 pb-2">
  <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
    <p class="col-md-4 mb-0 text-gray-300 hover:text-white">&copy; ABC Cars Pte Ltd</p>

 <sec:authorize access="!isAuthenticated()">
    <a href="/car-listing" class="col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
      <img class="h-10 mx-auto md:mx-0" src="images/logo.webp" alt="Abc Cars Portal">
    </a>
 </sec:authorize>
 <sec:authorize access="isAuthenticated()">
    <a href="/" class="col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
    <img class="h-10 mx-auto md:mx-0" src="images/logo.webp" alt="Abc Cars Portal">
    </a>
 </sec:authorize>
 
    <ul class="nav col-md-4 justify-content-end">
      <sec:authorize access="!isAuthenticated()">
      <li class="nav-item"><a href="/" class="nav-link px-2 text-gray-300 hover:text-white">Home</a></li>
       </sec:authorize>
         <sec:authorize access="isAuthenticated()">
         <li class="nav-item"><a href="/car-listing" class="nav-link px-2 text-gray-300 hover:text-white">Home</a></li>
     		</sec:authorize>
      <li class="nav-item"><a href="/car-listing" class="nav-link px-2 text-gray-300 hover:text-white">Car Listing</a></li>
      <li class="nav-item"><a href="/contact-us" class="nav-link px-2 text-gray-300 hover:text-white">Contact us</a></li>
      <li class="nav-item"><a href="/about-us" class="nav-link px-2 text-gray-300 hover:text-white">About us</a></li>
    </ul>
  </footer>
</div>

</body>
</html>
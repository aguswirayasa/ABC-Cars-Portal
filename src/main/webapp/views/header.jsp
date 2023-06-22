<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.15/dist/tailwind.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>Header</title>
<style type="text/css">
	/* Add transitions to the mobile menu */
#mobile-menu {
  transition: all 0.3s ease-in-out;
  max-height: 0;
  overflow: hidden;
}
#mobile-menu.show {
  max-height: 500px; /* Adjust as needed */
}

/* Add animations to the mobile menu button */
#mobile-menu-button svg:first-of-type {
  transition: all 0.3s ease-in-out;
  transform: rotate(0deg);
}
#mobile-menu-button.show svg:first-of-type {
  transform: rotate(-90deg);
}
#mobile-menu-button.show svg:last-of-type {
  display: block;
}

	
</style>
</head>
<body>
	<nav class="bg-gray-900 navbar-expand-lg">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="flex items-center justify-between h-16">
      <div class="flex-shrink-0 ">
            <sec:authorize access="!isAuthenticated()">
        <a href="/" class="flex items-center">
          <img class="h-12 w-auto " src="images/logo.webp" alt="Logo">
        </a>
            </sec:authorize>
               <sec:authorize access="hasAnyRole('Administrator','Users')">
        <a href="/car-listing" class="flex items-center">
          <img class="h-12 w-auto " src="images/logo.webp" alt="Logo">
        </a>
           </sec:authorize>
      </div>
      <div class="hidden md:block">
        <div class=" flex items-center space-x-4">
          <a href="/about-us" class="text-gray-300 hover:text-white px-3 py-2 rounded-md text-sm font-medium">About Us</a>
          <a href="/contact-us" class="text-gray-300 hover:text-white px-3 py-2 rounded-md text-sm font-medium">Contact Us</a>
          <sec:authorize access="isAuthenticated()">
          <sec:authorize access="hasAnyRole('Administrator','Users')">
          <a href="/car-listing" class="text-gray-300 hover:text-white px-3 py-2 rounded-md text-sm font-medium">Car Listing</a>
          </sec:authorize>
          <sec:authorize access="hasRole('Administrator')">
           <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
      <ul class="navbar-nav">
        <li class="nav-item dropdown">
          <a class="dropdown-toggle text-gray-300 hover:text-white px-3 py-2 rounded-md text-sm font-medium" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Management
          </a>
          <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
            <li><a class="dropdown-item" href="/manage-user">User Management</a></li>
            <li><a class="dropdown-item" href="/manage-car">Car Management</a></li>
          </ul>
        </li>
      </ul>
    </div>
          </sec:authorize>
          
<form class="flex items-center" action="/search" method="get">   
    <label for="simple-search" class="sr-only">Search</label>
    <div class="relative w-full">
        <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
            <svg aria-hidden="true" class="w-5 h-5 text-gray-500 dark:text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd"></path></svg>
        </div>
        <input type="text" name="keyword" id="simple-search" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg  block w-full pl-10 p-2.5" placeholder="Search Model, Make, Year" required>
    </div>
    <button type="submit" class="p-2.5 ml-2 text-sm font-medium text-white bg-black rounded-lg border hover:opacity-70 focus:ring-4 focus:outline-none" style="border-color: #10f5cc;">
        <svg class="w-5 h-5 text-emerald-500" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" style="color: #10f5cc;"></path></svg>
        <span class="sr-only">Search</span>
    </button>
</form>
          
          </sec:authorize>
        </div>
      </div>
      <div class="hidden md:block">
        <div class="ml-4 flex items-center md:ml-6">
        <sec:authorize access="!isAuthenticated()">
          <a href="/register" class="text-gray-300 hover:text-white px-3 py-2 text-sm font-medium border-r pe-2 border-white">Sign Up</a>
          <a href="/login" class="text-gray-300 hover:text-white px-3 py-2 rounded-md text-sm font-medium">Login</a>
          </sec:authorize>
          <sec:authorize access="isAuthenticated()">
          <div  class="flex items-center justify-center">
           <form action="/logout" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <button type="submit" class="text-gray-300 hover:text-white px-3  rounded-md text-sm font-medium">Logout</button>
        </form>
        <a href="/profile">        
        <i class="fa-solid fa-user text-2xl" style="color: #10f5cc;"></i>
        </a>
        </div>
        </sec:authorize>
        </div>
      </div>
      <div class="-mr-2 flex md:hidden">
        <button id="mobile-menu-button" type="button" class="bg-gray-800 inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-white hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-800 focus:ring-white" aria-controls="mobile-menu" aria-expanded="false">
          <span class="sr-only">Open main menu</span>
          <!-- Heroicon name: menu -->
          <svg class="block h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
          </svg>
          <!-- Heroicon name: x -->
          <svg class="hidden h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
          </svg>
        </button>
      </div>
    </div>
    <div class="md:hidden" id="mobile-menu">
      <div class="px-2 pt-2 pb-3 space-y-1 sm:px-3">
      <form class="flex items-center" action="/search" method="get">   
    <label for="simple-search" class="sr-only">Search</label>
    <div class="relative w-full">
        <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
            <svg aria-hidden="true" class="w-5 h-5 text-gray-500 dark:text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd"></path></svg>
        </div>
        <input type="text" name="keyword" id="simple-search" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg  block w-full pl-10 p-2.5" placeholder="Search Model, Make, Year" required>
    </div>
    <button type="submit" class="p-2.5 ml-2 text-sm font-medium text-white bg-black rounded-lg border hover:opacity-70 focus:ring-4 focus:outline-none" style="border-color: #10f5cc;">
        <svg class="w-5 h-5 text-emerald-500" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" style="color: #10f5cc;"></path></svg>
        <span class="sr-only">Search</span>
    </button>
</form>
         <sec:authorize access="hasAnyRole('Administrator','Users')">
        <a href="/car-listing" class="text-gray-300 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Car Listing</a>
         </sec:authorize>
         <sec:authorize access="hasAnyRole('Administrator')">
        <a href="/manage-user" class="text-gray-300 hover:text-white block px-3 py-2 rounded-md text-base font-medium">User Management</a>
        <a href="/manage-car" class="text-gray-300 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Car Management</a>
         </sec:authorize>
<a href="/about-us" class="text-gray-300 hover:text-white block px-3 py-2 rounded-md text-base font-medium">About Us</a>
<a href="/contact-us" class="text-gray-300 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Contact Us</a>
 <sec:authorize access="!isAuthenticated()">
<a href="/register" class="text-gray-300 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Sign Up</a>
<a href="/login" class="text-gray-300 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Login</a>
    </sec:authorize>     
     <sec:authorize access="isAuthenticated()">
     <a href="/profile" class="text-gray-300 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Profile</a>
       <form action="/logout" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <button type="submit" class="text-gray-300 hover:text-white px-3  rounded-md text-sm font-medium">Logout</button>
        </form>
           </sec:authorize>   
</div>
</div>

  </div>
</nav>
<script>
const mobileMenuButton = document.getElementById('mobile-menu-button');
const mobileMenu = document.getElementById('mobile-menu');

mobileMenuButton.addEventListener('click', () => {
  mobileMenu.classList.toggle('show');
  mobileMenuButton.classList.toggle('show');
});

</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>ABC Cars</title>
    <!-- Import TailwindCSS -->
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.15/dist/tailwind.min.css">
  </head>
<body class="bg-gray-900">
<jsp:include page="header.jsp" />
  <!-- Background Image -->
  <div class="relative h-screen">
    <img src="https://images.unsplash.com/photo-1584345274849-e9596d6ea12d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"
      alt="Background Image"
      class="absolute top-0 left-0 w-full h-full object-cover opacity-60"
    />
    <!-- Content -->
    <div class="absolute top-0 left-0 w-full h-full flex flex-col justify-center items-center">
      <h1 class="text-4xl text-white font-bold mb-2">Welcome to ABC Cars Portal</h1>
      <h2 class="text-2xl text-white font-bold mb-4">The Best Place to Find Your Dream Car</h2>
        <a href="/register">        
        <button  class="bg-gray-600 hover:opacity-70 text-white py-2 px-14 rounded-full mt-4">
          Start Now
        </button>
        </a>
    </div>
  </div>
 <jsp:include page="footer.jsp" />
</body>

</html>

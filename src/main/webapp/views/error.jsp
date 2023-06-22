<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Error Page</title>
  <!-- Include Tailwind CSS -->
  <link href="https://unpkg.com/tailwindcss@2.2.15/dist/tailwind.min.css" rel="stylesheet">
  <!-- Include Font Awesome icons -->
  <script src="https://kit.fontawesome.com/your-key.js" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="header.jsp" />
  <div class="flex flex-col h-screen">
    <div class="flex-grow"></div>
    <div class="flex justify-center items-center">
      <div class="bg-red-500 text-white rounded-full p-5">
        <i class="fas fa-exclamation-triangle fa-4x"></i>
      </div>
      <div class="ml-6">
        <h1 class="text-3xl font-bold mb-2">Oops! Something went wrong.</h1>
        <p class="text-lg">We're sorry, but we couldn't load the page you were looking for. Please try again later.</p>
      </div>
    </div>
    <div class="flex-grow"></div>
  </div>
 <jsp:include page="footer.jsp" />
</body>
</html>

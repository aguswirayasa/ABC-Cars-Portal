<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Access Denied</title>

</head>
<body>
<jsp:include page="header.jsp" />
<div class="h-screen flex justify-center items-center bg-gray-200">
    <div class="bg-white rounded-lg p-8 w-1/2">
        <h2 class="text-3xl font-bold mb-6">Access Denied</h2>
        <p class="text-lg mb-6">You do not have permission to access this page.</p>
        <a href="/car-listing" class="bg-blue-500 text-white py-3 px-6 rounded-full hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-600 focus:ring-opacity-50">Go to Home</a>
    </div>
</div>

 <jsp:include page="footer.jsp" />
</body>
</html>

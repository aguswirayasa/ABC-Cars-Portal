<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.15/dist/tailwind.min.css">
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
</head>
<body>
<jsp:include page="header.jsp" />
	<section class="bg-gray-50 min-h-screen flex items-center justify-center">
  <!-- login container -->
  <div class="bg-gray-100 flex rounded-2xl shadow-lg max-w-3xl p-5 items-center">
    <!-- form -->
    <div class="md:w-1/2 px-8 md:px-16">
    	<c:if test="${not empty error}">
				<div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative mb-4" role="alert">
					<strong class="font-bold">Error!</strong>
					<span class="block sm:inline">${error}</span>
				</div>
			</c:if>
				<c:if test="${not empty logout}">
            <div class="bg-green-500 text-white font-bold rounded-lg px-4 py-2 mb-4" role="alert">
                You have been logged out successfully!
            </div>
        	</c:if>
      <h2 class="font-bold text-2xl text-[#002D74]">Login</h2>
      <p class="text-xs mt-4 text-[#002D74]">If you are already a member, easily log in</p>
	
      <form action="/login" method="post" class="flex flex-col gap-4 was-validated">
      <div>
        <input class="p-2 mt-8 rounded-xl border form-control" type="text" name="username" placeholder="Username" required="required">
          <div class="valid-feedback">Valid.</div>
		<div class="invalid-feedback">Please fill out this field.</div>      
      </div>
        
        <input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
        <div class="relative">
          <input class="p-2 rounded-xl border w-full form-control" type="password" name="password" placeholder="Password" required="required">
            <div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
        </div>
        <button type="submit" class="bg-black rounded-xl text-white py-2 hover:scale-105 duration-300">Login</button>
      </form>

      <div class="mt-3 text-xs flex items-center text-[#002D74]">
        <p>Don't have an account? </p>
        <a href="/register" class="ms-1 text-blue-600 text-sm no-underline hover:text-blue-300">
         Register
        
         </a>
      </div>
    </div>

    <!-- image -->
    <div class="md:block hidden w-1/2">
      <img class="rounded-2xl" src="https://images.unsplash.com/photo-1611566026373-c6c8da0ea861?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80">
    </div>
  </div>
</section>
 <jsp:include page="footer.jsp" />
</body>
</html>
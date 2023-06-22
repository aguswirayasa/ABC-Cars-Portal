<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
  <title>Search Results</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.1.1/tailwind.min.css">
</head>
<body class="bg-gray-100">
<jsp:include page="header.jsp" />
  <div class="container mx-auto my-6 px-4 sm:px-6 lg:px-8 min-h-screen">
    <c:if test="${not empty result}">
      <h1 class="text-2xl font-bold mb-4">Search Results | ${result.size()} Car Founded</h1>
     </c:if>
    <c:if test="${empty result}">
      <h1 class="text-2xl font-bold mb-4">Search Results | 0 Car Founded</h1>
     </c:if>
       <c:if test="${not empty result}">
    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
      <c:forEach items="${result}" var="c" varStatus="loop">
        <div class="bg-white shadow-md rounded-lg overflow-hidden">
          <img src="data:image/jpeg;base64,${carImage.get(loop.index)}" alt="Car Image" class="w-full h-40 object-cover">
          <div class="p-4">
            <h3 class="text-lg font-bold mb-2">${c.getCarYearAndName()}</h3>
            <p class="text-gray-700 font-medium mb-2">${c.getCarPrice()}</p>
            <a href="/car-detail?id=${c.getId()}">
              <button class="bg-black text-white px-4 py-2 rounded-md hover:bg-gray-700">View Details</button>
            </a>
          </div>
        </div>
      </c:forEach>
    </div>
      </c:if>
    <c:if test="${empty result}">
      <div class="bg-white shadow-md rounded-lg overflow-hidden mt-4 p-4">
        <p class="text-lg font-bold">${msg}</p>
      </div>
    </c:if>
  </div>
  <jsp:include page="footer.jsp" />
</body>
</html>

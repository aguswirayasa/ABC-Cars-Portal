<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Car Detail Page</title>
</head>
<body class="bg-gray-100">
<jsp:include page="header.jsp" />
	<div class="container mx-auto px-4 py-8">
		<div class="max-w-lg mx-auto bg-white shadow-lg rounded-lg overflow-hidden">
  <div class="h-64 bg-cover bg-center" style="background-image: url('data:image/jpeg;base64,${carImage}')"></div>
  <div class="p-6">
  <div class="flex justify-between">
  <div>
    <h2 class="text-2xl font-bold mb-2">${carDetails.getCarYearAndName()}</h2>
    <p class="text-gray-600 text-sm mb-2">Posted on ${carDetails.getPostDate()} by ${carPoster.getFullName()}</p>
   </div> 
   <div>
   <c:if test="${carDetails.getSellStatus() != 'Sold'}">
   <div class="btn-group">
  <button class="bg-black btn-md text-white dropdown-toggle hover:opacity-70 uppercase text-white font-bold shadow text-xs px-4 py-2 rounded outline-none focus:outline-none sm:mr-2 mb-1 ease-linear transition-all duration-150" type="button" data-bs-toggle="dropdown" aria-expanded="false">
    Bids & Books
  </button>
  <ul class="dropdown-menu dropdown-menu-dark">
    <a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#exampleModal1">Book</a>
    <a class="dropdown-item" data-bs-toggle="modal"
								data-bs-target="#exampleModal">Bid</a>
    <a class="dropdown-item" href="/bid-and-book?id=${carDetails.getId()}">View Details</a>
  </ul>
</div>
    </c:if>
    </div>
    </div>
    <c:if test="${carDetails.getSellStatus() == 'Sold'}">
							<h3 class="text-gray-700 font-bold text-xl mb-2">Sold for  <fmt:formatNumber value="${highest}" pattern="$#,###.###"/></h3>
						</c:if>
						
						<c:if test="${carDetails.getSellStatus() != 'Sold'}">

						<div>
							    <p class="text-gray-700 font-semibold text-lg">Current Price: ${carDetails.getCarPrice()}</p>
						</div>

						<p class="text-gray-700 font-semibold text-lg mb-2">Current Bid: 
						    <c:if test="${empty highest}">
						        $0
						    </c:if>
						    <c:if test="${not empty highest}">
						        <fmt:formatNumber value="${highest}" pattern="$#,###.###"/>
						    </c:if>
						</p>
						 </c:if>



							<!-- Modal -->
							<div class="modal fade" id="exampleModal1" tabindex="-1"
								aria-labelledby="exampleModal1Label" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModal1Label">Book for
												Test Drive</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">

											<!-- Book Form -->
											<sf:form action="book" method="post" class="was-validated"
												modelAttribute="booking">
												<div class="mb-3">
													<label for="bookDate" class="form-label">Booking
														Date:</label> <input type="date" class="form-control"
														name="bookDate" required="true" />
													<div class="valid-feedback">Valid.</div>
													<div class="invalid-feedback">Please fill out this
														field.</div>
												</div>

												<input type="hidden" name="cid" value="${carDetails.getId()}">

												<button type="submit" class="btn btn-dark"
													style="width: auto;">Book on this Date</button>
											</sf:form>
											<!-- User Update Form -->
										</div>
									</div>
								</div>

							</div>
				
							<div class="modal fade" id="exampleModal" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Car
												Bidding</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">

											<!-- Bid Form -->
											<sf:form action="bid" method="post" class="was-validated"
												modelAttribute="bidding">
												<div class="mb-3">
													<label for="name" class="form-label">Bid Price
														:</label> <input type="text" class="form-control"
														placeholder="Enter bidding price" name="bidderPrice"
														required="true" />
													<div class="valid-feedback">Valid.</div>
													<div class="invalid-feedback">Please fill out this
														field.</div>
												</div>

												<input type="hidden" name="cid" value="${carDetails.getId()}">

												<button type="submit" class="btn btn-dark">Bid
													at this price</button>
											</sf:form>
											<!-- User Update Form -->
										</div>

									</div>
								</div>

							</div>
						
    <div class="flex items-center mb-4">
    <c:if test="${not empty userPhoto}">
      <img class="w-10 h-10 rounded-full mr-4" src="data:image/jpeg;base64,${userPhoto}" alt="Avatar of the car seller">
    </c:if>
    <c:if test="${empty userPhoto}">
      <img class="w-10 h-10 rounded-full mr-4" src="images/pfp.jpg" alt="Avatar of the car seller">
    </c:if>
      <div class="text-sm">
        <p class="text-gray-900 leading-none">${carPoster.getFullName()}</p>
        <p class="text-gray-600">Car Seller</p>
      </div>
    </div>
    <div class="flex justify-between">
      <p class="text-gray-600">Year: ${carDetails.getYear()}</p>
      <p class="text-gray-600">Mileage: ${carDetails.getMileage()} km</p>
    </div>
    <div class="flex justify-between">
      <p class="text-gray-600">Fuel Type: ${carDetails.getFuelType()}</p>
      <p class="text-gray-600">Transmission: ${carDetails.getTransmission()}</p>
    </div>
  </div>
</div>

	</div>
 <jsp:include page="footer.jsp" />
</body>
</html>

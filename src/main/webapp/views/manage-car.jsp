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
<meta charset="UTF-8">
<title>Car Management</title>
</head>
<body>
<%@ include file="header.jsp"%>

<section>

  <div class="mx-20 mt-5 h-screen">
    <h3 class="font-bold text-2xl py-6">Car Management</h3>
			<nav>
			<div class="nav nav-tabs" id="nav-tab" role="tablist">
				<button class="nav-link active" id="nav-home-tab"
					data-bs-toggle="tab" data-bs-target="#nav-home" type="button"
					role="tab" aria-controls="nav-home" aria-selected="true">Bidding
					Status</button>
				<button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab"
					data-bs-target="#nav-profile" type="button" role="tab"
					aria-controls="nav-profile" aria-selected="false">Booking
					Status</button>

			</div>
			</nav>
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-home" role="tabpanel"
					aria-labelledby="nav-home-tab">
    <div class="max-w-max">
      <table class="table-auto border-collapse border border-gray-400 w-full">
        <thead class="bg-gray-800 text-white">
          <tr>
            <th class="px-4 py-2">No</th>
            <th class="px-4 py-2">Name</th>
            <th class="px-4 py-2">Price</th>
            <th class="px-4 py-2">Seller</th>
            <th class="px-4 py-2">Action</th>
            <th class="px-4 py-2">Sell Car?</th>
            <th class="px-4 py-2">Current Bid</th>
            <th class="px-4 py-2">Bidder Name</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${cars}" var="c" varStatus="status">
            <tr class="border border-gray-300">
              <td class="px-4 py-2">${status.count}</td>
              <td class="px-4 py-2">${c.getCarYearAndName()}</td>
              <td class="px-4 py-2">${c.price}</td>
              <td class="px-4 py-2"><a href="/view-user?uid=${c.seller.getId()}"> <button class="bg-blue-500 text-white px-4 py-2 mr-4 rounded-md hover:bg-blue-600">View</button></a></td>
              <td class="px-4 py-2">
              <div class="flex">
                <a href="/car-detail?id=${c.id}" >
                <button class="bg-blue-500 text-white px-4 py-2 mr-4 rounded-md hover:bg-blue-600">Details</button>
                </a>
                <button type="button" class="bg-green-500 text-white px-4 mr-4 py-2 rounded-md hover:bg-green-600" data-bs-toggle="modal" data-bs-target="#exampleModal${status.index}">
                  Edit
                </button>
                <!-- Modal -->

									<div class="modal fade" id="exampleModal${status.index}"
										tabindex="-1" aria-labelledby="exampleModalLabel"
										aria-hidden="true" role="dialog">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">Edit
														Car Post</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">

													<!-- Car Post Form -->
													<sf:form action="/edit-car" method="post"
														class="was-validated" modelAttribute="car"
														enctype="multipart/form-data">
														
														
																												<div class="holder"
															style="min-height:200px; max-height: 300px; width: 300px; margin: auto;">
															<img id="imgPreview" src="data:image/jpeg;base64,${carImage.get(status.index)}"
																alt="image preview" style="width: inherit;" class="w-full h-40 object-cover"/>
														</div>
														<div class="mb-3 mt-3">
															<label class="d-flex form-label">Photo:</label> <input
																type="file" class="form-control" name="file"
																id="photo" accept="image/png, image/jpeg"
																 value="data:image/jpeg;base64,${carImage.get(status.index)}"/>
															
														</div>
														
														<div class="mb-3">
															<label for="make" class="d-flex form-label">Make:</label>
															<input type="text" class="form-control"
																placeholder="Enter car make" name="make" path="make"
																required="true" value="${c.make}" />
															<div class="valid-feedback">Valid.</div>
															<div class="invalid-feedback">Please fill out this
																field.</div>
														</div>
														<div class="mb-3">
															<label for="model" class="d-flex form-label">Model:</label>
															<input type="text" class="form-control"
																placeholder="Enter model" name="model" path="model"
																value="${c.model}" required="true" />
															<div class="valid-feedback">Valid.</div>
															<div class="invalid-feedback">Please fill out this
																field.</div>
														</div>
														<div class="mb-3">
															<label for="model" class="d-flex form-label">Year:</label>
															<input type="text" class="form-control"
																placeholder="Enter car year" name="year" path="year"
																value="${c.year}" required="true" />
															<div class="valid-feedback">Valid.</div>
															<div class="invalid-feedback">Please fill out this
																field.</div>
														</div>
														<div class="mb-3">
															<label for="price" class="d-flex form-label">Price
																(RM):</label> <input type="text" class="form-control" id="price"
																placeholder="Enter car price" name="price" path="price"
																value="${c.price}" required="true" />
															<div class="valid-feedback">Valid.</div>
															<div class="invalid-feedback">Please fill out this
																field.</div>
														</div>
														<h5>Car Details</h5>
														<div class="mb-3">
															<label for="make" class="d-flex form-label">Mileage:</label> <input type="text" class="form-control"
																placeholder="Enter make year" name="mileage" path="mileage"
																value="${c.mileage}" required="true" />
															<div class="valid-feedback">Valid.</div>
															<div class="invalid-feedback">Please fill out this
																field.</div>
														</div>
															<div class="mb-3">
															      <label class="block text-gray-700 font-bold mb-2" for="userName">
															        Fuel Type:
															      </label>
															      <sf:select path="fuelType" id="fuelType" 
															        class="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
															        <option value="${c.fuelType}">-- ${c.fuelType} --</option>
															        <option value="petrol">Petrol</option>
															        <option value="diesel">Diesel</option>
															        <option value="electric">Electric</option>
															      </sf:select>
															    </div>
															
															    <div class="mb-3">
															      <label class="block text-gray-700 font-bold mb-2" for="email">
															        Transmission:
															      </label>
															      <sf:select path="transmission" id="transmission" 
															        class="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
															        <option value="${c.transmission}">-- ${c.transmission} --</option>
															        <option value="manual">Manual</option>
															        <option value="automatic">Automatic</option>
															      </sf:select>
															    </div>


														<input type="hidden" name="id" value="${c.id}" />
													


														<button type="submit" class="btn btn-primary d-flex">Edit</button>
													</sf:form>
													<script>
						            $(document).ready(() => {
						            	
						                $("#photo").change(function () {
						                    const file = this.files[0];
						                    if (file) {
						                        let reader = new FileReader();
						                        reader.onload = function (event) {
						                            $("#imgPreview")
						                              .attr("src", event.target.result);
						                        };
						                        reader.readAsDataURL(file);
						                    }
						                });
						            });
						        </script>
												
												</div>
							
											</div>
										</div>

									</div> 
								
								  <button class="bg-red-500 hover:bg-red-600 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
          data-bs-toggle="modal" data-bs-target="#staticBackdrop${status.index}">
            Delete
          </button>
        <!-- Modal -->
<div class="modal fade" id="staticBackdrop${status.index}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">Delete User Post</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body text-xl font-bold">
        Are you sure, you want to delete this car?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Back</button>
        <a href="/delete-car?id=${c.id}">
        <button type="button" class="btn btn-danger">Delete</button>
            </a>
      </div>
    </div>
  </div>
</div>
</div>								
								</td>


								<!-- selling modal -->
								<td>${c.sellStatus}<!-- Button trigger modal -->
									<button type="button" class="btn" data-bs-toggle="modal"
										data-bs-target="#exampleModal2${status.index}">
										<i class="fas fa-edit fa-sm"></i>
									</button> <!-- Modal -->

									<div class="modal fade" id="exampleModal2${status.index}"
										tabindex="-1" aria-labelledby="exampleModalLabel"
										aria-hidden="true" role="dialog">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModal2Label">Set
														Car Sale Status</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">

													<!-- Sale Status Form -->
													<sf:form action="/sale_status?cid=${c.id}" method="post"
														class="was-validated" modelAttribute="biddings">
														<div class="mb-3">
															<label for="sellStatus" class="form-label block">Current Sale
																Status: ${c.sellStatus}</label> 
															<label for="sellStatus" class="form-label">Set Sale
																Status:</label> 
																	<div class="form-check form-check-inline">
																	  <input class="form-check-input" type="radio" name="sellStatus" id="inlineRadio1" value="Sell">
																	  <label class="form-check-label" for="inlineRadio1">Sell</label>
																	</div>
																	<div class="form-check form-check-inline">
																	  <input class="form-check-input" type="radio" name="sellStatus" id="inlineRadio2" value="Sold">
																	  <label class="form-check-label" for="inlineRadio2">Sold</label>
																	</div>
															
															<div class="valid-feedback">Valid.</div>
															<div class="invalid-feedback">Please fill out this
																field.</div>
														</div>

														<button type="submit" class="btn btn-dark">Set</button>
													</sf:form>
												</div>
											</div>
										</div>
									</div>

								</td>
								<!-- selling modal -->
								<c:forEach items="${c.biddings}" var="b" begin="0" end="0">

									<td class="px-4 py-2 ">${b.bidderPrice}</td>
							
									<td class="px-4 py-2">${b.bidderName}</td>

								</c:forEach>

							</tr>

						</c:forEach>
					</tbody>
				</table>
			</div>
			</div>
				<div class="tab-pane fade" id="nav-profile" role="tabpanel"
					aria-labelledby="nav-profile-tab">
				
<table class="table-auto border-collapse border border-gray-400 w-full">
  <thead class="bg-gray-800 text-white">
    <tr>
      <th class="px-4 py-2">No</th>
      <th class="px-4 py-2">Name</th>
      <th class="px-4 py-2">Book Date</th>
      <th class="px-4 py-2">Book Status</th>
      <th class="px-4 py-2">Bookers</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var="booking" items="${bookings}" varStatus="status">
      <tr class="border border-gray-300">
        <td class="px-4 py-2">${status.index +1}</td>
        <td class="px-4 py-2">${booking.car.model} ${booking.car.year} ${booking.car.make}</td>
        <td class="px-4 py-2">${booking.bookDate}</td>
        <td class="px-4 py-2">${booking.bookStatus}
        	<button type="button" class="btn" data-bs-toggle="modal"
											data-bs-target="#exampleModal1${status.index}">
											<i class="fas fa-edit fa-sm"></i>
										</button> <!-- Modal -->

										<div class="modal fade" id="exampleModal1${status.index}"
											tabindex="-1" aria-labelledby="exampleModalLabel"
											aria-hidden="true" role="dialog">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModal1Label">Set
															Booking Status</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">

														<!-- Booking Status Form -->
														<sf:form action="/booking_status?bid=${booking.id}"
															method="post" class="was-validated" modelAttribute="book">
															<div class="mb-3">
																<label for="bookStatus" class="form-label">Current Booking
																	Status: ${b.bookStatus}</label> 
																<label for="bookStatus" class="form-label">Set Booking
																	Status:</label> 
																		<div class="form-check form-check-inline">
																	  <input class="form-check-input" type="radio" name="bookStatus" id="inlineRadio1" value="Approve">
																	  <label class="form-check-label" for="inlineRadio1">Approve</label>
																	</div>
																	<div class="form-check form-check-inline">
																	  <input class="form-check-input" type="radio" name="bookStatus" id="inlineRadio2" value="In Queue">
																	  <label class="form-check-label" for="inlineRadio2">In Queue</label>
																	</div>
																	<div class="form-check form-check-inline">
																	  <input class="form-check-input" type="radio" name="bookStatus" id="inlineRadio2" value="Rejected">
																	  <label class="form-check-label" for="inlineRadio2">Rejected</label>
																	</div>
												
																<div class="valid-feedback">Valid.</div>
																<div class="invalid-feedback">Please fill out this
																	field.</div>
															</div>

															<button type="submit" class="btn btn-dark">Set</button>
														</sf:form>
													</div>
												</div>
											</div>
										</div> <!-- booking modal -->
        
        </td>
        <td class="px-4 py-2">${booking.user.firstName} ${booking.user.lastName}</td>
      </tr>
    </c:forEach>
  </tbody>
</table>
					
				</div>
					
		</div>
		</div>



	</section>


	<%@ include file="footer.jsp"%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<head>
	<title>Profile</title>
	<link rel="stylesheet" href="https://demos.creative-tim.com/notus-js/assets/styles/tailwind.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.15/dist/tailwind.min.css">
	<link rel="stylesheet"
		href="https://demos.creative-tim.com/notus-js/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css">

	<style type="text/css">
		.pos {
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			z-index: 1000;
		}

		.is-active {
			display: block !important;
		}

		.overlay {
			position: fixed;
			top: 0;
			left: 0;
			right: 0;
			bottom: 0;
			background-color: rgba(0, 0, 0, 0.5);
			/* semi-transparent black color */
			z-index: 999;
			/* higher than the modal */
			display: none;
		}
	</style>
</head>

<body>
	<jsp:include page="header.jsp" />
	<main class="profile-page relative" id="main-container">
		<section class="relative block h-500-px">
			<div class="absolute top-0 w-full h-full bg-center bg-cover" style="
            background-image: url('https://images.unsplash.com/photo-1575732905618-d22750d2bc1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1172&q=80');
          ">
				<span id="blackOverlay" class="w-full h-full absolute opacity-50 bg-black"></span>
			</div>
			<div class="top-auto bottom-0 left-0 right-0 w-full absolute pointer-events-none overflow-hidden h-70-px"
				style="transform: translateZ(0px)">
				<svg class="absolute bottom-0 overflow-hidden" xmlns="http://www.w3.org/2000/svg"
					preserveAspectRatio="none" version="1.1" viewBox="0 0 2560 100" x="0" y="0">
					<polygon class="text-blueGray-200 fill-current" points="2560 0 2560 100 0 100"></polygon>
				</svg>
			</div>
		</section>
		<section class="relative py-16 bg-blueGray-200">
			<div class="container mx-auto px-4">
				<div
					class="relative flex flex-col min-w-0 break-words bg-white w-full mb-6 shadow-xl rounded-lg -mt-64">
					<div class="px-6">
						<div class="flex flex-wrap justify-center">
							<div class="w-full lg:w-3/12 px-4 lg:order-2 flex justify-center">
								<c:if test="${not empty userPhoto}">
									<div class="relative">
										<img alt="profile" src="data:image/jpeg;base64,${userPhoto}"
											class="shadow-xl rounded-full h-auto align-middle border-none absolute -m-16 -ml-20 lg:-ml-16 max-w-150-px">
									</div>
								</c:if>
								<c:if test="${empty userPhoto}">
									<div class="relative">
										<img alt="profile" src="images/pfp.jpg"
											class="shadow-xl rounded-full h-auto align-middle border-none absolute -m-16 -ml-20 lg:-ml-18 max-w-150-px">
									</div>
								</c:if>
							</div>
							<div class="w-full lg:w-4/12 px-4 lg:order-3 lg:text-right lg:self-center">
								<div class="py-6 px-3 mt-32 sm:mt-0">
									<button
										class="bg-emerald-400 hover:opacity-70 uppercase text-white font-bold shadow text-xs px-4 py-2 rounded outline-none focus:outline-none sm:mr-2 mb-1 ease-linear transition-all duration-150"
										type="button" id="edit-profile-btn">
										Edit Profile
									</button>
									<button
										class="bg-emerald-400 hover:opacity-70 uppercase text-white font-bold shadow text-xs px-4 py-2 rounded outline-none focus:outline-none sm:mr-2 mb-1 ease-linear transition-all duration-150"
										type="button" id="add-picture">
										Add Profile Picture
									</button>
								</div>
							</div>
							<div class="w-full lg:w-4/12 px-4 lg:order-1">

							</div>
						</div>
						<div class="text-center mt-6">
							<h3 class="text-4xl font-semibold leading-normal text-blueGray-700 mb-2">
								${user.getFullName()}
							</h3>

							<div class="text-sm leading-normal mt-0 mb-2 text-blueGray-400 font-bold uppercase">
								<i class="fas fa-map-marker-alt mr-2 text-lg text-blueGray-400"></i>
								${user.getAddress()}
								<c:if test="${empty user.getAddress()}">
									No Address Recorded
								</c:if>
							</div>
							<div class="mb-2 text-blueGray-600 mt-2">
								<i class="fa-solid fa-envelope mr-2 text-lg text-blueGray-400"></i>
								${user.getEmail()}
								<c:if test="${empty user.getEmail()}">
									No Email Recorded
								</c:if>
							</div>
							<div class="mb-2 text-blueGray-600 mb-6">
								<i class="fa-solid fa-phone mr-2 text-lg text-blueGray-400"></i>
								${user.getMobile()}
								<c:if test="${empty user.getMobile()}">
									No Mobile Number Recorded
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="card bg-white shadow-md">
				<div class="row p-3">
					<nav>
						<div class="nav nav-tabs" id="nav-tab" role="tablist">
							<button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab"
								data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home"
								aria-selected="true">Post
								Status</button>
							<button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab"
								data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile"
								aria-selected="false">Booking
								Status</button>

						</div>
					</nav>

					<div class="tab-content" id="nav-tabContent">
						<div class="tab-pane fade show active" id="nav-home" role="tabpanel"
							aria-labelledby="nav-home-tab">
							<div class="container">
								<div class="row">
									<div class="col-12">
										<table class="table table-bordered mt-8">
											<thead class="bg-gray-800 text-white">
												<tr>
													<th scope="col">Post</th>
													<th scope="col">Car</th>
													<th scope="col">Post Date</th>
													<th scope="col">Action</th>
													<th scope="col">Current Bid (RM)</th>
													<th scope="col">Bidder Name</th>
													<th scope="col">Sale status</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${not empty cars}">
													<c:forEach items="${cars}" var="c" varStatus="status">
														<tr>
															<th scope="row">${status.count}</th>
															<td>${c.getCarYearAndName()}</td>
															<td>${c.postDate}</td>
															<td>
																<a type="button" class="btn btn-primary"
																	href="/car-detail?id=${c.id}"> View
																</a> <button type="button" class="btn btn-success"
																	data-bs-toggle="modal"
																	data-bs-target="#exampleModal${status.index}">
																	Edit
																</button> <button class="btn btn-danger"
																	data-bs-toggle="modal"
																	data-bs-target="#staticBackdrop${status.index}">
																	Delete
																</button>
																<!-- Modal -->
																<div class="modal fade"
																	id="staticBackdrop${status.index}"
																	data-bs-backdrop="static" data-bs-keyboard="false"
																	tabindex="-1" aria-labelledby="staticBackdropLabel"
																	aria-hidden="true">
																	<div class="modal-dialog modal-dialog-centered">
																		<div class="modal-content">
																			<div class="modal-header">
																				<h1 class="modal-title fs-5"
																					id="staticBackdropLabel">Delete Post
																				</h1>
																				<button type="button" class="btn-close"
																					data-bs-dismiss="modal"
																					aria-label="Close"></button>
																			</div>
																			<div class="modal-body text-xl font-bold">
																				Are you sure, you want to delete this
																				car?
																			</div>
																			<div class="modal-footer">
																				<button type="button"
																					class="btn btn-primary"
																					data-bs-dismiss="modal">Back</button>
																				<a href="/delete-post?id=${c.id}">
																					<button type="button"
																						class="btn btn-danger">Delete</button>
																				</a>
																			</div>
																		</div>
																	</div>
																</div>
															</td>
															<c:forEach items="${c.biddings}" var="b" begin="0" end="0">
																<c:set var="bidPrice" value="${b.bidderPrice}"></c:set>
																<c:if test="${bidPrice > 0}">
																	<td>${b.bidderPrice}</td>
																	<td>${b.bidderName}</td>

																</c:if>
																<td>${c.sellStatus}</td>
															</c:forEach>

														</tr>
														<!-- Modal -->

														<div class="modal fade" id="exampleModal${status.index}"
															tabindex="-1" aria-labelledby="exampleModalLabel"
															aria-hidden="true" role="dialog">
															<div class="modal-dialog">
																<div class="modal-content">
																	<div class="modal-header">
																		<h5 class="modal-title" id="exampleModalLabel">
																			Edit
																			Car Post</h5>
																		<button type="button" class="btn-close"
																			data-bs-dismiss="modal"
																			aria-label="Close"></button>
																	</div>
																	<div class="modal-body">

																		<!-- Car Post Form -->
																		<sf:form action="/edit-car" method="post"
																			class="was-validated" modelAttribute="car"
																			enctype="multipart/form-data">


																			<div class="holder"
																				style="min-height:200px; max-height: 300px; width: 300px; margin: auto auto;">
																				<img id="imgPreview"
																					src="data:image/jpeg;base64,${carImage.get(status.index)}"
																					alt="image preview"
																					style="width: inherit;"
																					class="w-full h-40 object-cover" />
																			</div>
																			<div class="mb-3 mt-3">
																				<label
																					class="d-flex form-label">Photo:</label>
																				<input type="file" class="form-control"
																					name="file" id="photo"
																					accept="image/png, image/jpeg"
																					value="data:image/jpeg;base64,${carImage.get(status.index)}" />

																			</div>

																			<div class="mb-3">
																				<label for="make"
																					class="d-flex form-label">Make:</label>
																				<input type="text" class="form-control"
																					placeholder="Enter car make"
																					name="make" path="make"
																					required="true" value="${c.make}" />
																				<div class="valid-feedback">Valid.</div>
																				<div class="invalid-feedback">Please
																					fill out this
																					field.</div>
																			</div>
																			<div class="mb-3">
																				<label for="model"
																					class="d-flex form-label">Model:</label>
																				<input type="text" class="form-control"
																					placeholder="Enter model"
																					name="model" path="model"
																					value="${c.model}"
																					required="true" />
																				<div class="valid-feedback">Valid.</div>
																				<div class="invalid-feedback">Please
																					fill out this
																					field.</div>
																			</div>
																			<div class="mb-3">
																				<label for="model"
																					class="d-flex form-label">Year:</label>
																				<input type="text" class="form-control"
																					placeholder="Enter car year"
																					name="year" path="year"
																					value="${c.year}" required="true" />
																				<div class="valid-feedback">Valid.</div>
																				<div class="invalid-feedback">Please
																					fill out this
																					field.</div>
																			</div>
																			<div class="mb-3">
																				<label for="price"
																					class="d-flex form-label">Price
																					:</label> <input type="text"
																					class="form-control" id="price"
																					placeholder="Enter car price"
																					name="price" path="price"
																					value="${c.price}"
																					required="true" />
																				<div class="valid-feedback">Valid.</div>
																				<div class="invalid-feedback">Please
																					fill out this
																					field.</div>
																			</div>
																			<h5>Car Details</h5>
																			<div class="mb-3">
																				<label for="make"
																					class="d-flex form-label">Mileage:</label>
																				<input type="text" class="form-control"
																					placeholder="Enter make year"
																					name="mileage" path="mileage"
																					value="${c.mileage}"
																					required="true" />
																				<div class="valid-feedback">Valid.</div>
																				<div class="invalid-feedback">Please
																					fill out this
																					field.</div>
																			</div>
																			<div class="mb-3">
																				<label
																					class="block text-gray-700 font-bold mb-2"
																					for="userName">
																					Fuel Type:
																				</label>
																				<sf:select path="fuelType" id="fuelType"
																					class="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
																					<option value="${c.fuelType}">--
																						${c.fuelType} --</option>
																					<option value="petrol">Petrol
																					</option>
																					<option value="diesel">Diesel
																					</option>
																					<option value="electric">Electric
																					</option>
																				</sf:select>
																			</div>

																			<div class="mb-3">
																				<label
																					class="block text-gray-700 font-bold mb-2"
																					for="email">
																					Transmission:
																				</label>
																				<sf:select path="transmission"
																					id="transmission"
																					class="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
																					<option value="${c.transmission}">--
																						${c.transmission} --</option>
																					<option value="manual">Manual
																					</option>
																					<option value="automatic">Automatic
																					</option>
																				</sf:select>
																			</div>



																			<input type="hidden" name="id"
																				value="${c.id}" />



																			<button type="submit"
																				class="btn btn-primary d-flex">Edit</button>
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
													</c:forEach>

												</c:if>
											</tbody>
										</table>
									</div>
								</div>

								<!-- end of row -->
							</div>
						</div>
						<div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
							<c:if test="${not empty cars}">
								<div class="container">
									<div class="row">
										<div class="col-12">
											<table class="table table-bordered mt-8">
												<thead class="bg-gray-800 text-white">
													<tr>
														<th scope="col">No.</th>
														<th scope="col">Car</th>
														<th scope="col">Book Date</th>
														<th scope="col">Book By</th>
														<th scope="col">Book Status</th>

													</tr>
												</thead>
												<tbody>
													<c:forEach items="${cars}" var="c" varStatus="status">
														<c:forEach items="${c.biddings}" var="b">
															<c:set var="bookDate" value="${b.bookDate}"></c:set>
															<c:if test="${bookDate != null}">
																<tr>
																	<th scope="row">${status.count}</th>
																	<td>${c.getCarYearAndName()}</td>
																	<td>${b.bookDate}</td>
																	<td>${b.bidderName}</td>
																	<td>${b.bookStatus}</td>
																</tr>
															</c:if>
														</c:forEach>
													</c:forEach>

												</tbody>
											</table>
										</div>
									</div>
								</div>
							</c:if>

							<c:if test="${empty cars}">
								<div class="container">
									<div class="row">
										<div class="col-12">
											<table class="table table-bordered mt-8">
												<thead class="bg-gray-800 text-white">
													<tr>
														<th scope="col">No.</th>
														<th scope="col">Book Date</th>
														<th scope="col">Car</th>
														<th scope="col">Book Status</th>
														<th scope="col">View Car</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${bids}" var="b" varStatus="status">
														<c:set var="bookDate" value="${b.bookDate}"></c:set>
														<c:if test="${bookDate != null}">
															<tr>
																<th scope="row">${status.count}</th>
																<td>${b.bookDate}</td>
																<td>${b.car.getCarYearAndName()}</td>
																<td>${b.bookStatus}</td>
																<td>
																	<!-- view car --> <a type="button"
																		class="btn btn-primary"
																		href="/car-detail?id=${b.car.id}">
																		<i class="far fa-eye"></i>
																	</a> <!-- view car -->
																</td>
															</tr>
														</c:if>
													</c:forEach>

												</tbody>
											</table>
										</div>
									</div>
								</div>
							</c:if>


						</div>

					</div>
				</div>
			</div>
		</section>


		<!-- MODAL -->
		<div class="overlay" id="overlay"></div>
		<div class="container mx-auto my-8 w-2/5 absolute pos hidden" id="edit-profile-modal">

			<sf:form modelAttribute="user" method="post" action="/profile/save"
				class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4 was-validated">
				<div class="relative w-full">
					<i class="fa-solid fa-x absolute top-2 cursor-pointer right-0 text-xl"
						id="close-edit-profile-modal"></i>
					<h1 class="text-3xl text-center font-bold mb-4">Edit Profile</h1>
				</div>

				<div class="mb-4">
					<label class="block text-gray-700 font-bold mb-2" for="firstName">
						First Name:
					</label>
					<sf:input path="firstName" id="firstName" value="${user.getFirstName()}" required="required"
						class="form-control appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" />
					<div class="valid-feedback">Valid.</div>
					<div class="invalid-feedback">Please fill out this field.</div>
				</div>

				<div class="mb-4">
					<label class="block text-gray-700 font-bold mb-2" for="lastName">
						Last Name:
					</label>
					<sf:input path="lastName" id="lastName" value="${user.getLastName()}" required="required"
						class="form-control appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" />
					<div class="valid-feedback">Valid.</div>
					<div class="invalid-feedback">Please fill out this field.</div>
				</div>

				<div class="mb-4">
					<label class="block text-gray-700 font-bold mb-2" for="userName">
						User Name:
					</label>
					<sf:input path="userName" id="userName" value="${user.getUserName()}" required="required"
						class="form-control appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" />
					<div class="valid-feedback">Valid.</div>
					<div class="invalid-feedback">Please fill out this field.</div>
				</div>

				<div class="mb-4">
					<label class="block text-gray-700 font-bold mb-2" for="email">
						Email:
					</label>
					<sf:input path="email" id="email" value="${user.getEmail()}" required="required"
						class="form-control appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" />
					<div class="valid-feedback">Valid.</div>
					<div class="invalid-feedback">Please fill out this field.</div>
				</div>

				<div class="mb-4">
					<label class="block text-gray-700 font-bold mb-2" for="mobile">
						Mobile:
					</label>
					<sf:input path="mobile" id="mobile" value="${user.getMobile()}" required="required"
						class="form-control appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" />
					<div class="valid-feedback">Valid.</div>
					<div class="invalid-feedback">Please fill out this field.</div>
				</div>

				<div class="mb-4">
					<label class="block text-gray-700 font-bold mb-2" for="country">
						Country:
					</label>
					<sf:input path="country" id="country" value="${user.getCountry()}" required="required"
						class="form-control appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" />
					<div class="valid-feedback">Valid.</div>
					<div class="invalid-feedback">Please fill out this field.</div>
				</div>

				<div class="mb-4">
					<label class="block text-gray-700 font-bold mb-2" for="city">
						City:
					</label>
					<sf:input path="city" id="city" value="${user.getCity()}" required="required"
						class="form-control appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" />
					<div class="valid-feedback">Valid.</div>
					<div class="invalid-feedback">Please fill out this field.</div>
				</div>
				<sf:hidden path="password" value="${user.getPassword()}" />
				<sf:hidden path="id" value="${user.getId()}" />
				<input type="submit" value="Save Changes"
					class="bg-emerald-400 hover:opacity-70 cursor-pointer text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" />
			</sf:form>
		</div>

		<!-- MODAL -->
		<div class="overlay" id="overlay"></div>
		<div class="container mx-auto my-8 w-2/5 absolute pos hidden" id="add-picture-modal" style="height: 500px;">

			<sf:form modelAttribute="user" method="post" action="/profile/add-picture" enctype="multipart/form-data"
				class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
				<div class="relative w-full">
					<i class="fa-solid fa-x absolute top-2 cursor-pointer right-0 text-xl"
						id="close-add-picture-modal"></i>
					<h1 class="text-3xl text-center font-bold mb-4">Add Profile Picture</h1>
				</div>
				<div class="holder" style="width: 300px; margin: auto; display: none;">
					<img id="imgPreview" src="#" alt="image preview" style="width: inherit;" />
				</div>
				<div class="mb-4">
					<label class="block text-gray-700 font-bold mb-2" for="mobile">
						Photo Profile:
					</label>
					<input type="file" accept="image/png, image/jpeg" name="photo" id="photo"
						class="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" />
				</div>
				<div class="holder2" style="width: 300px; margin: auto; display: none;">
					<img id="imgPreview2" src="#" alt="image preview" style="width: inherit;" />
				</div>
				<sf:hidden path="password" value="${user.getPassword()}" />
				<sf:hidden path="id" value="${user.getId()}" />
				<input type="submit" value="Save"
					class="bg-emerald-400 hover:opacity-70 cursor-pointer text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" />
			</sf:form>
		</div>



	</main>
	<script>
		document.querySelector("#edit-profile-btn").addEventListener("click", function () {
			document.querySelector("#edit-profile-modal").classList.add("is-active");
			document.querySelector("#overlay").classList.add("is-active");
		});
		document.querySelector("#add-picture").addEventListener("click", function () {
			document.querySelector("#add-picture-modal").classList.add("is-active");
			document.querySelector("#overlay").classList.add("is-active");
		});

		document.querySelector("#close-edit-profile-modal").addEventListener("click", function () {
			document.querySelector("#edit-profile-modal").classList.remove("is-active");
			document.querySelector("#overlay").classList.remove("is-active");
		});
		document.querySelector("#close-add-picture-modal").addEventListener("click", function () {
			document.querySelector("#add-picture-modal").classList.remove("is-active");
			document.querySelector("#overlay").classList.remove("is-active");
		});

		document.addEventListener("DOMContentLoaded", function () {
			const photoInput1 = document.querySelector("#photo");
			const imgPreview1 = document.querySelector("#imgPreview");
			const photoInput2 = document.querySelector("#photo2");
			const imgPreview2 = document.querySelector("#imgPreview2");

			photoInput1.addEventListener("change", function () {
				const file = this.files[0];
				if (file) {
					const reader = new FileReader();
					reader.onload = function (event) {
						imgPreview1.setAttribute("src", event.target.result);
					};
					reader.readAsDataURL(file);
				}
				document.querySelector(".holder").classList.add("is-active");
			});

			photoInput2.addEventListener("change", function () {
				const file = this.files[0];
				if (file) {
					const reader = new FileReader();
					reader.onload = function (event) {
						imgPreview2.setAttribute("src", event.target.result);
					};
					reader.readAsDataURL(file);
				}
				document.querySelector(".holder2").classList.add("is-active");
			});
		});
	</script>
	<jsp:include page="footer.jsp" />
</body>

</html>
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
<title>User Management</title>

</head>
<body>
<jsp:include page="header.jsp" />
<div class="mx-20 mt-5 h-screen">
<h1 class="font-bold text-2xl py-6">User Management</h1>
  <table class="table-auto w-full">
    <thead class="bg-gray-800 text-white">
      <tr>
        <th class="px-4 py-2">No</th>
        <th class="px-4 py-2">Name</th>
        <th class="px-4 py-2">Username</th>
        <th class="px-4 py-2">Email</th>
        <th class="px-4 py-2">Role</th>
        <th class="px-4 py-2">Action</th>
      </tr>
    </thead>
    <tbody>
<c:forEach items="${user}" var="u" varStatus="loop">
    <tr class="border border-gray-300">
      <td class="px-4 py-2">${loop.index + 1}</td>
      <td class="px-4 py-2">${u.getFullName()}</td>
      <td class="px-4 py-2">${u.getUserName()}</td>
      <td class="px-4 py-2">${u.getEmail()}</td>
    								<c:forEach items="${u.roles}" var="r">
									<td class="px-4 py-2">${r.name}<!-- Button trigger modal -->
										<button type="button" class="btn" data-bs-toggle="modal"
											data-bs-target="#exampleModal1${loop.index}">
											<i class="fas fa-edit fa-sm"></i>
										</button> <!-- Modal -->

										<div class="modal fade" id="exampleModal1${loop.index}"
											tabindex="-1" aria-labelledby="exampleModalLabel"
											aria-hidden="true" role="dialog">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModal1Label">Assign as Admin</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">

														<!-- Assign Admin Form -->
														<sf:form action="/assign_role?uid=${u.id}" method="post"
															class="was-validated" modelAttribute="user">
															<div class="mb-3">
																<label for="name" class="form-label block">Current Role: ${r.name}</label> 
																<label for="name" class="form-label">Set New Role:</label> 
																<div class="form-check form-check-inline">
																	  <input class="form-check-input" type="radio" name="role" id="inlineRadio1" value="Administrator">
																	  <label class="form-check-label" for="inlineRadio1">Administrator</label>
																	</div>
																	<div class="form-check form-check-inline">
																	  <input class="form-check-input" type="radio" name="role" id="inlineRadio2" value="Users">
																	  <label class="form-check-label" for="inlineRadio2">Users</label>
																	</div>
														
																<div class="valid-feedback">Valid.</div>
																<div class="invalid-feedback">Please fill out this
																	field.</div>
															</div>
															
															<button type="submit" class="btn btn-primary">Assign</button>
														</sf:form>
													</div>
												</div>
											</div>
										</div>
									</td>
								</c:forEach>
      <td class="px-4 py-2">
        <a href="/view-user?uid=${u.id}" class="inline-block mr-4">
          <button class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
            View
          </button>
        </a>
        <button type="button" class="mr-4 bg-green-500 hover:bg-green-600 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
										data-bs-toggle="modal"
										data-bs-target="#exampleModal${loop.index}">
										Edit
									</button> <!-- Modal -->

									<div class="modal fade" id="exampleModal${loop.index}"
										tabindex="-1" aria-labelledby="exampleModalLabel"
										aria-hidden="true" role="dialog">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">Edit
														User</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">

													<!-- User Update Form -->
													<sf:form action="/edit" method="post"
														class="was-validated" modelAttribute="userModel">
														<div class="mb-3 mt-3">
															<label for="name" class="form-label">First Name:</label> 
															<sf:input path="firstName"
																type="text" class="form-control"
																placeholder="Enter name" name="name" value="${u.getFirstName()}"
																required="true" />
															<div class="valid-feedback">Valid.</div>
															<div class="invalid-feedback">Please fill out this
																field.</div>
														</div>
														<div class="mb-3 mt-3">
															<label for="name" class="form-label">Last Name:</label> 
															<sf:input path="lastName"
																type="text" class="form-control"
																placeholder="Enter name" name="name" value="${u.lastName}"
																required="true" />
															<div class="valid-feedback">Valid.</div>
															<div class="invalid-feedback">Please fill out this
																field.</div>
														</div>
														<div class="mb-3">
															<label for="userName" class="form-label">Username:</label>
															<sf:input path="userName" type="text" class="form-control" id="userName"
																placeholder="Enter username" name="userName"
																value="${u.userName}" required="true" />
															<div class="valid-feedback">Valid.</div>
															<div class="invalid-feedback">Please fill out this
																field.</div>
														</div>
														
														<div class="mb-3">
															<label for="email" class="form-label">Email:</label> 
															<sf:input path="email"
																type="email" class="form-control"
																placeholder="Enter username" name="email"
																value="${u.email}" required="true" />
															<div class="valid-feedback">Valid.</div>
															<div class="invalid-feedback">Please fill out this
																field.</div>
														</div>
														<div class="mb-3">
															<label for="mobile" class="form-label">Mobile:</label> 
														<sf:input path="mobile"
																type="text" class="form-control" id="mobile"
																placeholder="Enter mobile" name="mobile"
																value="${u.mobile}" required="true" />
															<div class="valid-feedback">Valid.</div>
															<div class="invalid-feedback">Please fill out this
																field.</div>
														</div>
														<div class="mb-3">
															<label for="address" class="form-label">City:</label>
															<sf:input path="city" type="text" class="form-control" id="address"
																placeholder="Enter address" name="address"
																value="${u.city}" required="true" />
															<div class="valid-feedback">Valid.</div>
															<div class="invalid-feedback">Please fill out this
																field.</div>
														</div>
														<div class="mb-3">
															<label for="address" class="form-label">Country:</label>
															<sf:input path="country" type="text" class="form-control" id="address"
																placeholder="Enter address" name="address"
																value="${u.country}" required="true" />
															<div class="valid-feedback">Valid.</div>
															<div class="invalid-feedback">Please fill out this
																field.</div>
														</div>
																	<sf:hidden path="password" value="${u.getPassword()}"/>
														<sf:hidden path="id" value="${u.getId()}"/>
															
														<button type="submit" class="btn btn-primary">Edit</button>
													</sf:form>
													<!-- User Update Form -->
												</div>
							
											</div>
										</div>
									</div>
   
          <button class="bg-red-500 hover:bg-red-600 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
          data-bs-toggle="modal" data-bs-target="#staticBackdrop${loop.index}">
            Delete
          </button>
        <!-- Modal -->
<div class="modal fade" id="staticBackdrop${loop.index}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">Delete User</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body text-xl font-bold">
        Are you sure, you want to delete this user?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Back</button>
        <a href="/delete?uid=${u.id}">
        <button type="button" class="btn btn-danger">Delete</button>
            </a>
      </div>
    </div>
  </div>
</div>
      </td>
    </tr>
</c:forEach>
</tbody>
    </table>
</div>
 <jsp:include page="footer.jsp" />
</body>
</html>
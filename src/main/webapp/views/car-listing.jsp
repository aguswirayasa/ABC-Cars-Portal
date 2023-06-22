<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Car Listings</title>
  <style type="text/css">
.pos{
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 1000; /* higher than the modal */
}
.is-active{
	display: block !important;
}
.overlay {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: rgba(0, 0, 0, 0.5); /* semi-transparent black color */
  z-index: 999; /* higher than the modal */
  display: none;
}


</style>
</head>
<body class="bg-gray-100">
<jsp:include page="header.jsp" />
<div class="container mx-auto my-6 px-4 sm:px-6 lg:px-8 min-h-screen">
			<c:if test="${msg != null}">
				<div class="alert alert-success">${msg}
				</div>
			</c:if>
  <div class="flex justify-between items-center mb-4">
    <h2 class="text-xl font-bold ">Used Cars For Sale | ${carList.size()} Car Posted</h2>
    <sec:authorize access="hasAnyRole('Users')">
    <button id="edit-profile-btn" class="bg-black text-white px-4 py-2 rounded-md hover:opacity-70">Sell Your Car</button>
  	</sec:authorize>
  </div>

  <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
    <c:forEach items="${carList}" var="c" varStatus="loop">
     <div class="c-card block bg-white shadow-md hover:shadow-xl rounded-lg overflow-hidden">
     
        <div class="relative pb-48 overflow-hidden">
          <img
            class="absolute inset-0 h-full w-full object-cover"
            src="data:image/jpeg;base64,${carImage.get(loop.index)}"
            alt="${c.getCarYearAndName()}"
          />
        </div>
        <div class="p-4">
          
          <h2 class="mt-2  text-lg  font-bold">
            ${c.getCarYearAndName()}
          </h2>

          <div class=" flex items-center justify-between">
            <div>
              <span class="font-bold text-xl">${c.getCarPrice()}</span>
            </div>
            <a href="/car-detail?id=${c.getId()}">
              <button class="bg-black me-3 rounded-md p-2 text-white hover:scale-110 hover:bg-gray-700">
                View Details
              </button>
         </a>
          </div>
        </div>
        <div class="p-4 border-t border-b text-xs text-gray-700">
          <span class="flex items-center mb-1">
            <i class="far fa-clock fa-fw mr-2 text-gray-900"></i> ${c.getMileage()}
            Mi
          </span>
          <span class="flex items-center">
            <img src="images/gearshift.svg" alt="mileage" class="h-3 mr-2" />
            ${c.getTransmission()}
          </span>
        </div>
     
    </div>
    
    </c:forEach>
  </div>
</div>

   
 <!-- MODAL -->
 <div class="overlay" id="overlay"></div>
  <div class="container mx-auto my-8 w-2/5 absolute pos hidden" id="edit-profile-modal"style="height: 500px; overflow-y: scroll;">

    <sf:form modelAttribute="car" method="post" action="/post-car" enctype="multipart/form-data"
              class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4 was-validated">
    <div class="relative w-full">    
  <i class="fa-solid fa-x absolute top-2 cursor-pointer right-0 text-xl" id="close-edit-profile-modal"></i>
    <h1 class="text-3xl text-center font-bold mb-4">Sell Car</h1>
    </div>
    		<div class="holder"
				style="width: 300px; margin: auto; display: none;">
				<img id="imgPreview" src="#" alt="image preview"
				style="width: inherit;" />
			</div>
		     <div class="mb-4">
            <label class="block text-gray-700 font-bold mb-2" for="mobile">
                Car Photo:
            </label>
            <input type="file" accept="image/png, image/jpeg" name="file" id="photo"
                      class="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline form-control" required="true"/>
       			<div class="valid-feedback">Valid.</div>
															<div class="invalid-feedback">Please fill out this
																field.</div>
        </div>
        <div class="mb-4">
            <label class="block text-gray-700 font-bold mb-2" for="firstName">
                Make:
            </label>
            <sf:input path="make" id="make" 
                      class="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline form-control" required="true"/>
        	<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">Please fill out this field.</div>
        
        </div>

        <div class="mb-4">
            <label class="block text-gray-700 font-bold mb-2">
                Model:
            </label>
            <sf:input path="model" id="model" 
                      class="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline form-control" required="true"/>
           	<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">Please fill out this field.</div>
        </div>

        <div class="mb-4">
            <label class="block text-gray-700 font-bold mb-2" >
                Year:
            </label>
            <sf:input path="year" id="year"
                      class="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline form-control" required="true"/>
           	<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">Please fill out this field.</div>
        </div>

        <div class="mb-4">
            <label class="block text-gray-700 font-bold mb-2" >
                Price:
            </label>
            <sf:input path="price" id="price"
                      class="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline form-control" required="true"/>
           	<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">Please fill out this field.</div>
        </div>
           <h1 class="text-xl text-center font-bold mb-4">Car Details</h1>
		 <div class="mb-4">
      <label class="block text-gray-700 font-bold mb-2" >
        Mileage:
      </label>
      <sf:input path="mileage" id="mileage" 
        class="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline form-control" required="true"/>
       	<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="mb-4">
      <label class="block text-gray-700 font-bold mb-2" for="userName">
        Fuel Type:
      </label>
      <sf:select path="fuelType" id="fuelType" 
        class="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline form-control" required="true">
        <option value="">-- Select Fuel Type --</option>
        <option value="petrol">Petrol</option>
        <option value="diesel">Diesel</option>
        <option value="electric">Electric</option>
      </sf:select>
       	<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">Please fill out this field.</div>
    </div>

    <div class="mb-4">
      <label class="block text-gray-700 font-bold mb-2" for="email">
        Transmission:
      </label>
      <sf:select path="transmission" id="transmission" 
        class="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline form-control" required="true">
        <option value="">-- Select Transmission --</option>
        <option value="manual">Manual</option>
        <option value="automatic">Automatic</option>
      </sf:select>
       	<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">Please fill out this field.</div>
    </div>
   

            <input type="submit" value="Post"
                class="bg-black hover:opacity-70 cursor-pointer text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" />
                   </sf:form>
                   </div>
                   
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
	  const photoInput = document.querySelector("#photo");
      const imgPreview = document.querySelector("#imgPreview");

	  photoInput.addEventListener("change", function() {
	    const file = this.files[0];
	    if (file) {
	      const reader = new FileReader();
	      reader.onload = function(event) {
	        imgPreview.setAttribute("src", event.target.result);
	      };
	      reader.readAsDataURL(file);
	    }
	    document.querySelector(".holder").classList.add("is-active");
	  });
	});
document.querySelector("#edit-profile-btn").addEventListener("click", function() {
    document.querySelector("#edit-profile-modal").classList.add("is-active");
    document.querySelector("#overlay").classList.add("is-active");
});

document.querySelector("#close-edit-profile-modal").addEventListener("click", function() {
    document.querySelector("#edit-profile-modal").classList.remove("is-active");
    document.querySelector("#overlay").classList.remove("is-active");
   
});
</script>
</body>
  <jsp:include page="footer.jsp" />
</html>
        

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up</title>
</head>
<body>
<jsp:include page="header.jsp" />
	<div class="font-sans antialiased bg-grey-lightest">
	<c:if test="${error_register != null}">
			<div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative mb-4" role="alert">${error_register} Click here to <a href="/login">
			Sign In</a> </div>
		</c:if>
	<c:if test="${success_register != null}">
			<div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative mb-4" role="alert">${success_register} Click here to <a href="/login">
			Sign In</a> </div>
		</c:if>
  <!-- Content -->
  <div class="w-full bg-grey-lightest" style="padding-top: 4rem;">
    <div class="container mx-auto py-8">
      <div class="w-5/6 lg:w-1/2 mx-auto bg-white rounded shadow">
            <div class="py-4 px-8 text-black text-xl border-b border-grey-lighter">Register for a your account</div>
            <sf:form action="/save" method="post" modelAttribute="user" class="was-validated">
            <div class="py-4 px-8">
                <div class="flex mb-4">
                    <div class="w-1/2 mr-1">
                        <label class="block text-grey-darker text-sm font-bold mb-2" for="first_name">First Name</label>
                        <sf:input class="appearance-none border rounded w-full py-2 px-3 text-grey-darker form-control" id="first_name" path="firstName" type="text" placeholder="Your first name" required="required"/>
                 <div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
                    </div>
                    <div class="w-1/2 ml-1">
                        <label class="block text-grey-darker text-sm font-bold mb-2" for="last_name">Last Name</label>
                        <sf:input class="appearance-none border rounded w-full py-2 px-3 text-grey-darker form-control" id="last_name" path="lastName" type="text" placeholder="Your last name" required="required"/>
                      <div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
                    </div>
                </div>
                <div class="mb-4">
                    <label class="block text-grey-darker text-sm font-bold mb-2" for="email">Username</label>
                    <sf:input class="appearance-none border rounded w-full py-2 px-3 text-grey-darker form-control" id="text" type="text" path="userName" placeholder="Your username" required="required"/>
                	  <div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
                </div>
                <div class="mb-4">
                    <label class="block text-grey-darker text-sm font-bold mb-2" for="password">Password</label>
                    <sf:input class="appearance-none border rounded w-full py-2 px-3 text-grey-darker form-control" id="password" type="password" path="password" placeholder="Your secure password" required="required"/>
           
                      <div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
                </div>
                <div class="flex items-center justify-center mt-8">
                    <input type="submit" value="Sign Up"
				class="bg-black hover:opacity-70 text-white font-bold py-2 px-14 rounded-full" />
                </div>
            </div>
            </sf:form>
        </div>
        <p class="text-center my-4">
        I already have an account.
            <a href="/login" class="text-blue-600 text-sm no-underline hover:text-blue-300">Sign in</a>
        </p>
    </div>
  </div>
</div>
 <jsp:include page="footer.jsp" />
</body>
</html>
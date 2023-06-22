<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bid & Book Detail</title>
</head>
<body>
<jsp:include page="header.jsp" />
	<!--list of car bidder -->
	  <div class="mx-20 mt-5 h-screen">
	<div class="row">
    <h3 class="font-bold text-2xl py-6">Bidding & Booking Status</h3>
    <div class="col-12">
        <table class="table-auto w-full">
            <thead class="bg-gray-800 text-white">
                <tr>
                    <th scope="col" class="px-4 py-2">Name</th>
                    <th scope="col" class="px-4 py-2">Bidding Date</th>
                    <th scope="col" class="px-4 py-2">Bidding Price (RM)</th>
                    <th scope="col" class="px-4 py-2">Test Drive Book Date</th>
                </tr>
            </thead>
            <tbody>
                <c:if test="${not empty bid}">
                    <c:forEach items="${bid}" var="b">
                        <tr>
                            <td class="border px-4 py-2">${b.bidderName}</td>
                            <td class="border px-4 py-2">${b.bidDate}</td>
                            <td class="border px-4 py-2">${b.bidderPrice}</td>
                            <td class="border px-4 py-2">${b.bookDate}</td>
                        </tr>
                    </c:forEach>
                </c:if>
                <c:if test="${empty bid}">
                    <tr>
                        <td colspan="4" class="text-center py-4">No Bid or Book Recorded</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>
</div>
		
	
 <jsp:include page="footer.jsp" />
</body>
</html>
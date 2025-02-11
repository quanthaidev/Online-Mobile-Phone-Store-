<%@page import="java.util.*"%>
<%@page import="pagination.ProductPaginationDao"%>
<%@page import="model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Smartphones Online Store</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
<link href="https://use.fontawesome.com/releases/v5.0.1/css/all.css" rel="stylesheet">	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	

<link rel="stylesheet" href="css/styleHome.css">

<link rel="icon" href="resource/logo.png">

</head>
<body>

	<!-- Header -->
	<%@ include file="header.jsp"%>

	<!-- Content -->
	<div id="pricing" class="container-fluid">
		<div class="text-center">
			<h2>Tổng cộng có ${requestScope.total} sản phẩm được tìm thấy</h2>
		</div>
		
		
		
		<!-- 		View data SQL hiển thị sản phẩm lên jsp -->
		<c:set var="spageid" value="${param.page}"></c:set>
		<c:if test="${spageid==null}">
			<c:set var="spageid" value="1"></c:set>
		</c:if>
		<h1>Page No: ${spageid} </h1>
		
	
		
		

		<c:set var="list" value="${requestScope.subArray}"></c:set>
		
		<c:set var="index" value="1"></c:set>
		
		<c:forEach var="items" items="${list}">
	 		
	 		<c:if test="${index % 4 == 1}">
					<div class='row slideanim'>
			</c:if>
			
			<div class='col-sm-3'>
			<div class=panel panel-default text-left'>
			<div class='panel-heading'>
			<img src="${items.getSrc()}" width='90' height='100'>
			</div>
			<div class='panel-body'>
			<p> ${items.getType()} id: ${items.getId()}</p>
			<a href='InformationProductController?id=${items.getId()}' ><strong> ${items.getName()}</strong></a>
			</div>
			<div class='panel-footer'>
			<h3>${items.getPrice()}</h3>
			<a href='InformationProductController?id=${items.getId()}'><button class='btn btn-lg'>View More</button></a>
			</div>
			</div>
			</div>
			
			<c:if test="${index % 4 == 0}">
				</div>
			</c:if>
			
			<c:set var="index" value="${index + 1}"></c:set>
	 		
	 		
		</c:forEach>
		


	</div>
	
	




	<!-- pagination -->

	<div id="paginationCustom">

		<nav aria-label="Page navigation example justify-content-center">
			<ul class="pagination">
				
				<c:set var="totalRows" value="${requestScope.total}"></c:set>

				<c:set var="displayRows" value="8"></c:set>

				<c:if test="${totalRows % displayRows != 0}">
					<c:forEach var="i" begin="1" end="${totalRows/displayRows+1}">
						<li class="page-item"><a class="page-link"
							href="${pageContext.request.contextPath}/SearchClientController?page=${i}&searchKey=${requestScope.searchKey}">${i}</a></li>
					</c:forEach>

				</c:if>

				<c:if test="${totalRows % displayRows == 0}">
					<c:forEach var="i" begin="1" end="${totalRows/displayRows}">
						<li class="page-item"><a class="page-link"
							href="${pageContext.request.contextPath}/SearchClientController?page=${i}&searchKey=${requestScope.searchKey}">${i}</a></li>
					</c:forEach>

				</c:if>

			</ul>
		</nav>

	</div>


	<p style="text-align: center;">Tổng cộng có ${requestScope.total} sản phẩm được tìm thấy</p>




	<!-- Footer -->

	<%@ include file="footer.jsp"%>



	<script>
		$(document).ready(
				function() {
					// Add smooth scrolling to all links in navbar + footer link
					$(".navbar a, footer a[href='#myPage']").on('click',
							function(event) {
								// Make sure this.hash has a value before overriding default behavior
								if (this.hash !== "") {
									// Prevent default anchor click behavior
									event.preventDefault();

									// Store hash
									var hash = this.hash;

									// Using jQuery's animate() method to add smooth page scroll
									// The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
									$('html, body').animate({
										scrollTop : $(hash).offset().top
									}, 900, function() {

										// Add hash (#) to URL when done scrolling (default click behavior)
										window.location.hash = hash;
									});
								} // End if
							});

					$(window).scroll(function() {
						$(".slideanim").each(function() {
							var pos = $(this).offset().top;

							var winTop = $(window).scrollTop();
							if (pos < winTop + 600) {
								$(this).addClass("slide");
							}
						});
					});
				})
	</script>


</body>
</html>
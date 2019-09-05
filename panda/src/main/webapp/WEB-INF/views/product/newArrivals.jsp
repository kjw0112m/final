<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신상순</title>
<style>
.ul li a {
	text-decoration: none;
	color: #555;
}

.ul li {
	float: left;
	width: 20%;
	color: #555;
}

.ul::after{
	content: '';
	display: block;
	clear: both;
}

.order-img {
	width: 100%;
	margin-bottom: 12px;
}

.ul {
	list-style-type: none;
	min-width: 1600px;
}

.li-bottom {
	margin-bottom: 50px;
}
</style>
</head>

<div>	

	<ul class="ul">
		<c:forEach var="productSellerDto" items="${list}">
			<li>
				<div class="order-img">
					<a href="detail?product_id=${productSellerDto.product_id}"><img src="http://placehold.it/300x300"></a>
				</div>
				<div class="li-bottom">
					<a href="sellerList?seller_id=${productSellerDto.seller_id}">${productSellerDto.nickname}</a><br><br>
					<a href="detail?product_id=${categoryListDto.product_name}">${productSellerDto.product_name}</a>
					<br>
					<strong>${productSellerDto.price}</strong>
				</div>
			</li>
		</c:forEach>
	</ul>
	
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
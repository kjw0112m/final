<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sellers 판매자 상품 전체보기 판매자설명</title>
<style>
.img1 {
	height: 600px;
	width: 100%;
}

.topimg {
	position: relative;
	width: 100%;
	margin: 0 auto;
	margin-top: 50px;
	margin-bottom: 50px;
	min-width: 1600px;
}

.ul li a {
	text-decoration: none;
	color: #555;
}

.ul li {
	float: left;
	width: 25%;
	color: #555;
}

.order-img {
	padding-left: 50px;
	width: 280px;
	height: 375px;
	margin-bottom: 12px;
}

.ul {
	margin: auto;
	list-style-type: none;
	min-width: 1600px;
}

.li-bottom {
	padding-left: 50px;
	margin-bottom: 50px;
}

.ul::after {
	content: '';
	display: block;
	clear: both;
}
</style>
</head>
<div class="topimg">
	<div>
		<img src="${pageContext.request.contextPath}/image/product/nike.png"
			class="img1">
	</div>
</div>
<ul class="ul">
			<c:forEach var="productSellerDto" items="${list}">
	<li>
		<div class="order-img">
				<a href="detail?product_id=${productSellerDto.product_id}"><img src="http://placehold.it/280x375"></a>
		</div>
		<div class="li-bottom">
			<a href="sellerList?seller_id=${productSellerDto.seller_id}">${productSellerDto.nickname}</a><br>
			<br> <a href="detail?product_id=${productSellerDto.product_id}">${productSellerDto.product_name}</a> <br>
			<strong>${productSellerDto.price}</strong>
		</div> 
	</li>
		</c:forEach>
</ul>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
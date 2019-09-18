<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	margin-top: 5px;
}

.ul ::after {
	content: '';
	display: block;
	clear: both;
}

.image-wrap {
	height: 400px;
	min-height: 400px;
	max-height: 400px;
	padding-right: 15px;
}

.image-wrap .order-img {
	width: 100%;
	height: 100%;
}

.ul {
	list-style-type: none;
	min-width: 1600px;
}

.li-bottom {
	margin-bottom: 50px;
}

.paginate {
	margin: 25px 0 0;
	text-align: center;
}

.paginate ol, .paginate li {
	display: inline-block;
	vertical-align: middle;
	font-size: 16px;
	line-height: 16px;
	padding: 0 1px;
}

.active_page {
	font-weight: bold;
	color: #55a0ff;
}

img {
	display: block;
}

.total ::after {
	content: "";
	display: block;
	clear: both;
}

.top h2 {
	display: inline-block;
	margin-right: 10px;
	margin-left: 40px;
}
</style>
</head>

<div class="total">
	<div class="top">
		<h2>오늘 업데이트된 상품 <font color="#BDBDBD">${count}</font></h2>
	</div>
	<ul class="ul">
		<c:forEach var="productSellerDto" items="${list}">
			<li>
				<div class="image-wrap">
					<a href="detail?product_id=${productSellerDto.product_id}"> <img
						src="${pageContext.request.contextPath}/product/image?id=${productSellerDto.mainfile}"
						class="order-img">
					</a>
				</div>
				<div class="li-bottom">
					<a href="sellerList?seller_id=${productSellerDto.seller_id}">${productSellerDto.nickname}</a>
					<br>
					<!-- 					<br> -->
					<a href="detail?product_id=${productSellerDto.product_id}">${productSellerDto.product_name}</a>
					<!-- 					<br> -->
					<strong> <fmt:formatNumber
							value="${productSellerDto.price}" pattern="#,###.##" />
					</strong>
				</div>
			</li>
		</c:forEach>
	</ul>
</div>
<input name="page" type="hidden">
<div class="paginate">
	<ol>
		<c:if test="${(not (page eq 1))&& not empty page && page>=11}">
			<li><a href="newArrivals?page=${startBlock-1}"
				class="page_block">&lt;&lt;</a></li>
		</c:if>
		<c:if test="${not (page eq 1) && not empty page}">
			<li><a href="newArrivals?page=${page-1}" class="page_block">&lt;</a></li>
		</c:if>
		<!--페이지 출력 -->
		<c:forEach var="i" begin="${startBlock}" end="${endBlock}">
			<c:choose>
				<c:when test="${page == i}">
					<li class="active_page">${i}</li>
				</c:when>
				<c:otherwise>
					<c:if test="${i>0}">
						<li><a href="newArrivals?page=${i}" class="page_move">${i}</a></li>
					</c:if>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${not (page eq pageCount)}">
			<li><a href="newArrivals?page=${page+1}" class="page_block">&gt;</a></li>
		</c:if>
		<c:if test="${(not (page eq pageCount)) && pageCount>=10}">
			<li><a href="newArrivals?page=${endBlock+1}" class="page_block">&gt;&gt;</a></li>
		</c:if>
	</ol>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
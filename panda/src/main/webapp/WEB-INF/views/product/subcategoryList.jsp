<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서브카테고리 상세페이지</title>
<style>
.text-top {
	text-align: left;
	margin-left: 50px;
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
	width: 280px;
	height: 375px;
	margin-bottom: 9px;
}

.ul {
	list-style-type: none;
	min-width: 1563px;
}

.li-bottom {
	margin-bottom: 50px;
}

.bottom {
	width: 80%;
	float: left;
}

.top {
	width: 190px;
	float: left;
	margin-right: 50px;
}


.total {
	padding-top: 50px;
	margin: 0 auto;
}

.total::after{
	content:"";
	display:block;
	clear:both;	
}

#title {
	font-size: 30px;
}

.sidebar_ul li {
	line-height: 40px;
	text-align: left;
	list-style-type: none;
	color: black;
}

.sidebar_ul li a {
	color: black;
	text-decoration: none;
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
</style>
</head>
	<div class="total">
		<div class="top">
			<ul class="sidebar_ul">
				<li><h2 id="title">${subcategoryDto.name}</h2>
					<ul class="sidebar_ul">
						<c:forEach var="sclist"  items="${sclist}">
							<li><a href="subcategoryList?sub_category_id=${sclist.id}">${sclist.name}</a></li>
						</c:forEach>
					</ul></li>
			</ul>
		</div>
		<div class="bottom">
			<ul class="ul">
				<c:forEach var="productSellerDto" items="${list}"><li>
						<div>
							<a href="detail?product_id=${productSellerDto.product_id}"> <img
								src="${pageContext.request.contextPath}/product/image?id=${productSellerDto.mainfile}" class="order-img"></a>
<!-- 							src="http://placehold.it/280x375" class="order-img"></a> -->
						</div>
						<div class="li-bottom">
							<a href="sellerList?seller_id=${productSellerDto.seller_id}">${productSellerDto.nickname}</a><br><br>
							<a href="detail?product_id=${productSellerDto.product_id}">${productSellerDto.product_name}</a>
							<br>
							<strong>
								<fmt:formatNumber value="${productSellerDto.price}"
									pattern="#,###.##"/>
							</strong>
						</div>
					</li>
					</c:forEach>
			</ul>
		</div>
	</div>
<input name="page" type="hidden">
<div class="paginate">
	<ol>
	<c:if test="${(not (page eq 1))&& not empty page && page>=11}">
		<li><a href="subcategoryList?page=${startBlock-1}" class="page_block">&lt;&lt;</a></li>
	</c:if>
	<c:if test="${not (page eq 1) && not empty page}">
		<li><a href="subcategoryList?page=${page-1}" class="page_block">&lt;</a></li>
	</c:if>
	<!--페이지 출력 -->
	<c:forEach var="i" begin="${startBlock}" end="${endBlock}">
		<c:choose>
		<c:when test="${page == i}">
			<li class="active_page">${i}</li>
		</c:when>
		<c:otherwise>
			<c:if test="${i>0}">
				<li><a href="subcategoryList?page=${i}" class="page_move">${i}</a></li>
			</c:if>
		</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${not (page eq pageCount)}">
		<li><a href="subcategoryList?page=${page+1}" class="page_block">&gt;</a></li>
	</c:if>
	<c:if test="${(not (page eq pageCount)) && pageCount>=10}">
		<li><a href="subcategoryList?page=${endBlock+1}" class="page_block">&gt;&gt;</a></li>
	</c:if>
	</ol>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
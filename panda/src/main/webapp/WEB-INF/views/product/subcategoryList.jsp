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
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
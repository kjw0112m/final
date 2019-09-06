<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script>
	$(function() {
		$('.bxSlider').bxSlider();
	})
</script>
<style>
.total {
	position: relative;
	margin: auto;
}

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
	width: 20%;
	color: #555;
}

.ul::after {
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

.bxSlider {
	align: center;
}

.img1 {
	height: 600px;
	width: 100%;
}

#wrapper {
	position: relative;
	width: 100%;
	margin: 0 auto;
	margin-top: 50px;
	min-width: 1600px;
}

#sidebar {
	position: absolute;
	width: 250px;
	height: 540px;
	top: 30px;
	left: 40px;
	vertical-align: top;
	border: none;
	background-color: rgba(255, 255, 255, .2);
}

#sidebar .snbArea {
	flex-direction: column;
	height: 100%;
}

.snbArea {
	font-size: 25px;
}

/* #snb>li {
        position: relative;
    
    } */
#clothing {
	text-align: center;
	margin-bottom: 10px;
	font-size: 30px;
	line-height: 34px;
	font-weight: 700
}

.detail {
	padding: 0px;
	list-style-type: none;
}

#snb a {
	margin-left: 15px;
	text-decoration: none;
	color: black;
	line-height: 50px;
}

#snb {
	padding: 0px;
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
</style>
<%-- <h2>${categoryDto.name}</h2> --%>
<!-- <div> -->
<%-- 	<c:forEach var="categoryListDto" items="${list}"> --%>
<%-- 		<a href="detail?product_id=${categoryListDto.product_id}"><img --%>
<!-- 			src="http://placehold.it/350x350"></a> -->
<!-- 		<br> -->
<!-- 		<br> -->
<%-- 		<a href="sellerList?seller_id=${categoryListDto.seller_id}">${categoryListDto.nickname}</a> --%>
<!-- 		<br> -->
<!-- 		<br> -->
<%-- 		<a href="detail?product_id=${categoryListDto.product_id}">${categoryListDto.product_name}</a> --%>
<!-- 		<br> -->
<!-- 		<br> -->
<%-- 	${categoryListDto.price} 원 --%>
<!-- 	<br> -->
<!-- 		<br> -->
<%-- 	</c:forEach> --%>
<!-- </div> -->

<div class="total">
	<div id="wrapper">
		<div class="bxSlider">
			<div>
				<img src="${pageContext.request.contextPath}/image/product/category1.png" class="img1">
			</div>
			<div>
				<img src="${pageContext.request.contextPath}/image/product/category2.png" class="img1">
			</div>
			<div>
				<img src="${pageContext.request.contextPath}/image/product/category3.png" class="img1">
			</div>
		</div>
	</div>

	<div id="sidebar">
		<div class="snbArea">
			<ul id="snb">
				<li class="detail">
					<h2 id="clothing">${categoryDto.name}</h2>
					<ul>
						<c:forEach var="sclist"  items="${sclist}">
							<li class="detail"><a href="${pageContext.request.contextPath}/product/subcategoryList?sub_category_id=${sclist.id}">${sclist.name}</a></li>
						</c:forEach>
<%-- 						<li class="detail"><a href="${pageContext.request.contextPath}/product/subcategoryList?sub_category_id=1"> 원피스 </a></li> --%>
<%-- 						<li class="detail"><a href="${pageContext.request.contextPath}/product/subcategoryList?sub_category_id=2"> 티샤스 </a></li> --%>
<%-- 						<li class="detail"><a href="${pageContext.request.contextPath}/product/subcategoryList?sub_category_id=3"> 샤츠 </a></li> --%>
<%-- 						<li class="detail"><a href="${pageContext.request.contextPath}/product/subcategoryList?sub_category_id=4"> 맨투맨 </a></li> --%>
<%-- 						<li class="detail"><a href="${pageContext.request.contextPath}/product/subcategoryList?sub_category_id=5"> 후드티 </a></li> --%>
<%-- 						<li class="detail"><a href="${pageContext.request.contextPath}/product/subcategoryList?sub_category_id=6"> 아우터 </a></li> --%>
					</ul>
				</li>
			</ul>
		</div>
	</div>

	<h2 class="text-top">${categoryDto.name}</h2>
	<ul class="ul">
		<c:forEach var="categoryListDto" items="${list}">
			<li>
				<div class="order-img">
					<a href="detail?product_id=${categoryListDto.product_id}"><img src="${pageContext.request.contextPath}/product/image?id=${categoryListDto.mainfile}"></a>
				</div>
				<div class="li-bottom">
					<a href="sellerList?seller_id=${categoryListDto.seller_id}">${categoryListDto.nickname}</a><br><br>
					<a href="detail?product_id=${categoryListDto.product_id}">${categoryListDto.product_name}</a>
					<br>
					<strong>
						<fmt:formatNumber value="${categoryListDto.price}"
							pattern="#,###.##"/>
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
		<li><a href="${address}?page=${startBlock-1}" class="page_block">&lt;&lt;</a></li>
	</c:if>
	<c:if test="${not (page eq 1) && not empty page}">
		<li><a href="${address}?page=${page-1}" class="page_block">&lt;</a></li>
	</c:if>
	<!--페이지 출력 -->
	<c:forEach var="i" begin="${startBlock}" end="${endBlock}">
		<c:choose>
		<c:when test="${page == i}">
			<li class="active_page">${i}</li>
		</c:when>
		<c:otherwise>
			<c:if test="${i>0}">
				<li><a href="${address}?page=${i}" class="page_move">${i}</a></li>
			</c:if>
		</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${not (page eq pageCount)}">
		<li><a href="${address}?page=${page+1}" class="page_block">&gt;</a></li>
	</c:if>
	<c:if test="${(not (page eq pageCount)) && pageCount>=10}">
		<li><a href="${address}?page=${endBlock+1}" class="page_block">&gt;&gt;</a></li>
	</c:if>
	</ol>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
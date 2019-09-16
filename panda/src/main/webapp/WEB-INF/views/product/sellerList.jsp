<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<script src="https://kit.fontawesome.com/f890a3719c.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		$('#follow').click(function() {
			if($(this).children().hasClass('fas')){
				$.ajax({
					url : rootContext+"/unfollow",
					type : "GET",
					dataType : "text",
					data : {
						seller_id : '${list.get(0).seller_id}',
						member_id : '${sessionScope.sid}'
					},
					success : function(data) {
						$('.follow').removeClass('fas');
						$('.follow').addClass('far');
						$('.follow-score').text(data);
					}
				});
			}
			else{
				$.ajax({
					url : rootContext+"/follow",
					type : "GET",
					dataType : "text",
					data : {
						seller_id : '${list.get(0).seller_id}',
						member_id : '${sessionScope.sid}'
					},
					success : function(data) {
						$('.follow').removeClass('far');
						$('.follow').addClass('fas');
						$('.follow-score').text(data);
					}
				});
			}
		});
	});
</script>
<meta charset="UTF-8">
<style>
.img1 {
	height: 600px;
	width: 100%;
}

.top {
	width: 100%;
	margin-left: 30px;
	margin-top: 50px;
	margin-bottom: 50px;
	min-width: 1600px;
	diplay: inline-block;
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

.image-wrap {
	height: 400px;
	min-height: 400px;
	max-height: 400px;
	padding-right: 100px;
}

.image-wrap .order-img {
	width: 100%;
	height: 100%;
}

.ul {
	margin: auto;
	list-style-type: none;
	min-width: 1600px;
}

.li-bottom {
	/* 	padding-left: 50px; */
	margin-bottom: 50px;
}

.ul::after {
	content: '';
	display: block;
	clear: both;
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

.follow {
	color: red;
}

.top h1, .top h2 {
	display: inline-block;
	margin-right: 10px;
	margin-left: 10px;
}
</style>
</head>
<div class="top">
	<h1>${list.get(0).nickname}</h1>
	<a href="#" id="follow">
	<c:choose>
		<c:when test="${isFollow>0}">
			<i class="follow fas fa-heart fa-2x"></i>
		</c:when>
		<c:otherwise>
			<i class="follow far fa-heart fa-2x"></i>
		</c:otherwise>
	</c:choose>
	</a>
	<h2 class="follow-score">${follows}</h2>
</div>
<ul class="ul">
	<c:forEach var="productSellerDto" items="${list}">
		<li>
			<div class="image-wrap">
				<a href="detail?product_id=${productSellerDto.product_id}"><img
					src="${pageContext.request.contextPath}/product/image?id=${productSellerDto.mainfile}"
					class="order-img"></a>
			</div>
			<div class="li-bottom">
				<a href="sellerList?seller_id=${productSellerDto.seller_id}">${productSellerDto.nickname}</a><br>
				<br> <a href="detail?product_id=${productSellerDto.product_id}">${productSellerDto.product_name}</a>
				<br> <strong> <fmt:formatNumber
						value="${productSellerDto.price}" pattern="#,###.##" />
				</strong>
			</div>
		</li>
	</c:forEach>
</ul>

<input name="page" type="hidden">
<div class="paginate">
	<ol>
		<c:if test="${(not (page eq 1))&& not empty page && page>=11}">
			<li><a
				href="sellerList?page=${startBlock-1}&seller_id=${param.seller_id}"
				class="page_block">&lt;&lt;</a></li>
		</c:if>
		<c:if test="${not (page eq 1) && not empty page}">
			<li><a
				href="sellerList?page=${page-1}&seller_id=${param.seller_id}"
				class="page_block">&lt;</a></li>
		</c:if>
		<!--페이지 출력 -->
		<c:forEach var="i" begin="${startBlock}" end="${endBlock}">
			<c:choose>
				<c:when test="${page == i}">
					<li class="active_page">${i}</li>
				</c:when>
				<c:otherwise>
					<c:if test="${i>0}">
						<li><a
							href="sellerList?page=${i}&seller_id=${param.seller_id}"
							class="page_move">${i}</a></li>
					</c:if>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${not (page eq pageCount)}">
			<li><a
				href="sellerList?page=${page+1}&seller_id=${param.seller_id}"
				class="page_block">&gt;</a></li>
		</c:if>
		<c:if test="${(not (page eq pageCount)) && pageCount>=10}">
			<li><a
				href="sellerList?page=${endBlock+1}&seller_id=${param.seller_id}"
				class="page_block">&gt;&gt;</a></li>
		</c:if>
	</ol>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 페이지</title>
<style>
#find_buttonimg {
	width: 38px;
	height: 38px;
	border-width: 0;
	padding: 0;
	width: 38px;
	height: 38px;
	min-width: 38px;
	opacity: .4;
	float: left;
}

.title {
	font-size: 44px;
	line-height: 58px;
	font-weight: 700;
}

.input_text {
	font-size: 44px;
	font-weight: 500;
	height: 90px;
	width: 750px;
	float: left;
}

.total {
	width: 100%;
	overflow: hidden;
	left: 0;
	margin: auto;

}

.form_in {
	border: 0;
	margin: 0;
	padding: 0;
}

.input_span {
	display: inline-block;
	position: relative;
	vertical-align: top;
	width: 100%;
}

.find_div {
        border-width: 0 0 4px;
        justify-content: space-between;
        border-style: solid;
        align-items: center;
        display: flex;
        border-color: #333;
    }

.top {
	margin: auto;
	padding-top: 100px;
	width: 800px;
	position: relative;
	padding-bottom:200px;
}

.order_list li a {
	text-decoration: none;
	color: #555;
}

.order_list li {
	margin-top: 50px;
	float: left;
	width: 25%;
	color: #555;
}

.image-wrap{
	height:350px;
	min-height:350px;
	max-height:350px;
	padding-right:100px;
}
.image-wrap .order-img {
	width:100%;
	height:100%;
}

.order_list {
	list-style-type: none;
	min-width: 1600px;
}

.li-bottom {
	margin-bottom: 50px;
}

.list_isempty {
	color: #555;
	font-size: 44px;
	text-align: center;
	font-weight: 500;
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
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function() {
		// 검색어 없을 시 검색 방지
		$(".search").submit(function(e) {
			e.preventDefault();
			var keyword = $(".find_div").find(".input_text").val();
			if(!keyword == true) {
				alert("검색어를 입력하세요");
			}
			else {
				this.submit();
			}
		});
	});
</script>
</head>
<body>
	<div class="total">
		<div class="top">
			<form action="search" method="get" class="search">
				<div class="form_in">
					<strong class="title">고객님<br>무엇을 찾으세요?
					</strong>
					<div class="find_div">
						<span style="width: 100%;"> <input type="text"
							class="input_text" name="keyword" placeholder="상품을 찾아보세요" value="${param.keyword}"
							style="border: 0px; padding: 10px 30px 0px 60px;">
						</span> <input type="submit" value="검색">
					</div>
				</div>
			</form>
		</div>

		<c:choose>
			<c:when test="${list.isEmpty()}">
				<h3 class="list_isempty">검색 결과가 존재하지 않습니다</h3>
			</c:when>
			<c:otherwise>
				<!-- 검색 결과가 출력될 부분 -->
				<ul class="order_list">
					<c:forEach var="productSellerDto" items="${list}">
					<li>
						<div class="image-wrap">
								<a href="detail?product_id=${productSellerDto.product_id}"><img
									src="${pageContext.request.contextPath}/product/image?id=${productSellerDto.mainfile}" class="order-img"></a>
						</div>
						<div class="li-bottom">
							<a href="sellerList?seller_id=${productSellerDto.seller_id}">${productSellerDto.nickname}</a><br>
							<a href="detail?product_id=${productSellerDto.product_id}">${productSellerDto.product_name}</a>
							<br> <br> <strong><fmt:formatNumber value="${productSellerDto.price}"
							pattern="#,###.##"/></strong>
						</div>
					</li>
					</c:forEach>
				</ul>
			</c:otherwise>
		</c:choose>

	</div>
	<input name="page" type="hidden">
	<div class="paginate">
		<ol>
			<c:if test="${(not (page eq 1))&& not empty page && page>=11}">
				<li><a href="search?page=${startBlock-1}&keyword=${param.keyword}" class="page_block">&lt;&lt;</a></li>
			</c:if>
			<c:if test="${not (page eq 1) && not empty page}">
				<li><a href="search?page=${page-1}&keyword=${param.keyword}" class="page_block">&lt;</a></li>
			</c:if>
			<!--페이지 출력 -->
			<c:forEach var="i" begin="${startBlock}" end="${endBlock}">
				<c:choose>
					<c:when test="${page == i}">
						<li class="active_page">${i}</li>
					</c:when>
					<c:otherwise>
						<c:if test="${i>0}">
							<li><a href="search?page=${i}&keyword=${param.keyword}" class="page_move">${i}</a></li>
						</c:if>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${not (page eq pageCount)}">
				<li><a href="search?page=${page+1}&keyword=${param.keyword}" class="page_block">&gt;</a></li>
			</c:if>
			<c:if test="${(not (page eq pageCount)) && pageCount>=10}">
				<li><a href="search?page=${endBlock+1}&keyword=${param.keyword}" class="page_block">&gt;&gt;</a></li>
			</c:if>
		</ol>
	</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
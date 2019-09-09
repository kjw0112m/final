<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	position: absolute;
	left: 0;
	top: 30%;
	transform: translateY(-50%);
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
	padding-top: 300px;
	width: 800px;
	position: relative;
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

.order-img {
	width: 350px;
	height: 350px;
	margin-bottom: 12px;
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
</style>
</head>
<body>
	<div class="total">
		<div class="top">
			<form action="search" method="get">
				<div class="form_in">
					<strong class="title">고객님<br>무엇을 찾으세요?
					</strong>
					<div class="find_div">
						<span style="width: 100%;"> <input type="text"
							class="input_text" name="keyword" placeholder="상품을 찾아보세요"
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
					<li>
						<div>
							<c:forEach var="productSellerDto" items="${list}">
								<a href="detail?product_id=${productSellerDto.product_id}"><img
									src="http://placehold.it/350x350" class="order-img"></a>
						</div>
						<div class="li-bottom">
							<a href="sellerList?seller_id=${productSellerDto.seller_id}">${productSellerDto.nickname}</a><br>
							<a href="detail?product_id=${productSellerDto.product_id}">${productSellerDto.product_name}</a>
							<br> <br> <strong>${productSellerDto.price}</strong>
						</div> </c:forEach>
					</li>
				</ul>
			</c:otherwise>
		</c:choose>

	</div>
</body>
</html>
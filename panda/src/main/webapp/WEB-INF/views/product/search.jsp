<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 페이지</title>
</head>
<body>
<form action="search" method="get">
	<input type="search" placeholder="search" name="keyword" required value="${param.keyword}">
	<input type="submit" value="검색">
</form>

<hr> 

<c:choose>
	<c:when test="${list.isEmpty()}">
		<h3>검색 결과가 존재하지 않습니다</h3>
	</c:when>
	<c:otherwise>
		<!-- 검색 결과가 출력될 부분 -->
		<c:forEach var="productSellerDto" items="${list}">
		<a href="detail?product_id=${productSellerDto.product_id}"><img src="http://placehold.it/350x350"></a>
		<br><br>
		<a href="sellerList?seller_id=${productSellerDto.seller_id}">${productSellerDto.nickname}</a>
		<br><br>
		<a href="detail?product_id=${productSellerDto.product_id}">${productSellerDto.product_name}</a>
		<br><br>
		${productSellerDto.price} 원
		<br><br>	
		</c:forEach>
	</c:otherwise>
</c:choose>
</body>
</html>
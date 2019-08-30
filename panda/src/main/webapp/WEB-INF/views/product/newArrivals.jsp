<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Arrivals</title>
</head>
<body>
<div>
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
</div>
</body>
</html>
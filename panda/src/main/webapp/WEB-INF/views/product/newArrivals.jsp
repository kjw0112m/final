<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신상순</title>
</head>
<body>
<div>
	<c:forEach var="productSellerDto" items="${list}">
	<img src="http://placehold.it/350x350">
	<br><br>
	<a href="sellerList?seller_id=${productSellerDto.seller_id}">${productSellerDto.nickname}</a>
	<br><br>
	${productDto.price}원 
	${productSellerDto.product_name}
	<br><br>
	${productSellerDto.price} 원
	<br><br>
	</c:forEach>
</div>
</body>
</html>
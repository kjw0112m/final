<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>${categoryDto.name}</h2>
<div>
	<c:forEach var="categoryListDto" items="${list}">
	<a href="detail?product_id=${categoryListDto.product_id}"><img src="http://placehold.it/350x350"></a>
	<br><br>
	<a href="sellerList?seller_id=${categoryListDto.seller_id}">${categoryListDto.nickname}</a>
	<br><br>
	<a href="detail?product_id=${categoryListDto.product_id}">${categoryListDto.product_name}</a>
	<br><br>
	${categoryListDto.price} 원
	<br><br>
	</c:forEach>
</div>
</body>
</html>
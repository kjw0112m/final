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
	<img src="http://placehold.it/350x350">
	<br><br>
	<a href="sellerList?seller_id=${categoryListDto.seller_id}">${categoryListDto.nickname}</a>
	<br><br>
	${categoryListDto.product_name}
	<br><br>
	${categoryListDto.price} 원
	<br><br>
	</c:forEach>
</div>
</body>
</html>
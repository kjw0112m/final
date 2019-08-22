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
	<c:forEach var="productDto" items="${list}">
	<img src="http://placehold.it/350x350">
	<br><br>
	${productDto.name}
	<br><br>
	${productDto.price}원 
	<br><br>
	</c:forEach>
</div>
</body>
</html>
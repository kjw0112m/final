<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sellers</title>
</head>
<body>
<div>
	<c:forEach var="sellerDto" items="${list}">
	<a href="nicklist?nickname=${sellerDto.nickname}">${sellerDto.nickname}</a>
	<br><br>
	</c:forEach>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PANDA Admin</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin/common.css">
<script>
	var rootContext = "${pageContext.request.contextPath}";
</script>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<div class="header">
				<h1 class="logo">
					<a href="${pageContext.request.contextPath }/seller/"> <span>PANDA</span>
					</a>
				</h1>
				<ul class="util" id="gnb">
					<li class="shop"><a href="${pageContext.request.contextPath}/" target="_blank">쇼핑몰 바로가기</a></li>
					<c:choose>
					<c:when test="${not empty sessionScope.ssid or not empty sessionScope.aid}">
						<c:choose>
						<c:when test="${not empty sessionScope.ssid}">
							<li class="info"><a href="${pageContext.request.contextPath}/seller/info">나의 정보</a></li>
							<li class="logout"><a href="${pageContext.request.contextPath}/seller/logout">로그아웃</a></li>
						</c:when>
						<c:otherwise>
							<li class="logout"><a href="${pageContext.request.contextPath}/admin/logout">로그아웃</a></li>
						</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<li class="info"><a href="${pageContext.request.contextPath}/seller/login">판매자 로그인</a></li>
						<li class="info"><a href="${pageContext.request.contextPath}/admin/login">관리자 로그인</a></li>
					</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
		<div id="container">
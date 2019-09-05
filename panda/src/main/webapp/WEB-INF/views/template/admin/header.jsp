<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<li class="shop"><a href="${pageContext.request.contextPath }/">쇼핑몰 바로가기</a></li>
					<li class="info"><a href="${pageContext.request.contextPath }/seller/info">내 정보</a></li>
					<li class="logout"><a href="${pageContext.request.contextPath }/seller/logout">로그아웃</a></li>
				</ul>
			</div>
		</div>
		<div id="container">
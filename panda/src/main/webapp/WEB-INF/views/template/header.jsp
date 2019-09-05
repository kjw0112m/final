<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/footer.css">
<title>PANDA 판다</title>

<script>
	var rootContext = "${pageContext.request.contextPath}";
</script>
</head>
<body>
	<div></div>
	<div>
		<header class="main_header">
			<div class="inner">
				<h1 class="tit" style="padding: 0">
					<a href="${pageContext.request.contextPath}" class=""><span class="tit_text">PANDA</span></a>
				</h1>
				<nav id="main_nav" class="main_nav">
					<ul class="menu">
						<li class="dis_f ai_c"><a href="${pageContext.request.contextPath}/product/newArrivals">NEW</a></li>
						<li class="dis_f ai_c c_w" id="tops"><a href="${pageContext.request.contextPath}/product/tops?category_id=1">TOPS</a>
							<ul class="menus" id="topsmenu">
								<strong class="tit">TOPS</strong>
								<li><a href="${pageContext.request.contextPath}/product/subcategoryList?sub_category_id=1">원피스</a></li>
								<li><a href="${pageContext.request.contextPath}/product/subcategoryList?sub_category_id=2">티셔츠</a></li>
								<li><a href="${pageContext.request.contextPath}/product/subcategoryList?sub_category_id=3">셔츠</a></li>
								<li><a href="${pageContext.request.contextPath}/product/subcategoryList?sub_category_id=4">맨투맨</a></li>
								<li><a href="${pageContext.request.contextPath}/product/subcategoryList?sub_category_id=5">후드티</a></li>
								<li><a href="${pageContext.request.contextPath}/product/subcategoryList?sub_category_id=6">아우터</a></li>
							</ul></li>
						<li class="dis_f ai_c c_w" id="bottoms"><a href="${pageContext.request.contextPath}/product/bottoms?category_id=2">BOTTOMS</a>
							<ul id="bottomsmenu" class="menus">
								<strong class="tit">BOTTOMS</strong>
								<li><a href="${pageContext.request.contextPath}/product/subcategoryList?sub_category_id=7">슬랙스</a></li>
								<li><a href="${pageContext.request.contextPath}/product/subcategoryList?sub_category_id=8">청바지</a></li>
								<li><a href="${pageContext.request.contextPath}/product/subcategoryList?sub_category_id=9">스커트</a></li>
								<li><a href="${pageContext.request.contextPath}/product/subcategoryList?sub_category_id=10">반바지</a></li>
								<li><a href="${pageContext.request.contextPath}/product/subcategoryList?sub_category_id=11">면바지</a></li>
							</ul></li>
						<li class="dis_f ai_c c_w" id="acc"><a href="${pageContext.request.contextPath}/product/acc?category_id=3">ACC</a>
							<ul id="accmenu" class="menus">
								<strong class="tit">ACC</strong>
								<li><a href="${pageContext.request.contextPath}/product/subcategoryList?sub_category_id=12">목걸이</a></li>
								<li><a href="${pageContext.request.contextPath}/product/subcategoryList?sub_category_id=13">팔찌</a></li>
								<li><a href="${pageContext.request.contextPath}/product/subcategoryList?sub_category_id=14">반지</a></li>
								<li><a href="${pageContext.request.contextPath}/product/subcategoryList?sub_category_id=15">모자</a></li>
							</ul></li>
						<li class="dis_f ai_c"><a href="/sale">SALE</a></li>
						<li class="dis_f ai_c"><a href="/event">EVENT</a></li>
					</ul>
				</nav>
				<div class="dis_f header_links ai_c">

					<c:choose>
						<c:when test="${not empty sessionScope.sid}">
							<a href="${pageContext.request.contextPath }/member/info" class="">나의 정보</a> 
							<a href="${pageContext.request.contextPath }/member/logout" class="">로그아웃</a> 
						</c:when>
						<c:otherwise>
							<a href="${pageContext.request.contextPath }/member/login" class="">로그인</a> 
							<a href="${pageContext.request.contextPath }/member/regist" class="">회원가입</a> 
						</c:otherwise>
					</c:choose>
					
						<a href="${pageContext.request.contextPath}/product/search" class=""><img src="${pageContext.request.contextPath}/image/main/search.PNG"></a> <a href="${pageContext.request.contextPath }/cart/view"
						class=""><img src="${pageContext.request.contextPath}/image/main/cart.PNG"></a> 
						<a href="${pageContext.request.contextPath}/notice/noticeList" class="">						
						<img src="${pageContext.request.contextPath}/image/main/contact.PNG"></a>
			</div>
			</div>
		</header>
	</div>
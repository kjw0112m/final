<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/footer.css">
<title>PANDA 판다</title>
</head>
<body>
	<div></div>
	<div>
		<header class="main_header">
			<div class="inner">
				<h1 class="tit" style="padding: 0">
					<a href="/" class=""><span class="tit_text">PANDA</span></a>
				</h1>
				<nav id="main_nav" class="main_nav">
					<ul class="menu">
						<li class="dis_f ai_c"><a href="/new">NEW</a></li>
						<li class="dis_f ai_c"><a href="/sellers">SELLERS</a></li>
						<li class="dis_f ai_c c_w" id="tops"><a href="/tops">TOPS</a>
							<ul class="menus" id="topsmenu">
								<strong class="tit">TOPS</strong>
								<li><a href="#">원피스</a></li>
								<li><a href="#">티셔츠</a></li>
								<li><a href="#">셔츠</a></li>
								<li><a href="#">맨투맨</a></li>
								<li><a href="#">후드티</a></li>
								<li><a href="#">아우터</a></li>
							</ul></li>
						<li class="dis_f ai_c c_w" id="bottoms"><a href="/bottoms">BOTTOMS</a>
							<ul id="bottomsmenu" class="menus">
								<strong class="tit">BOTTOMS</strong>
								<li><a href="#">슬랙스</a></li>
								<li><a href="#">청바지</a></li>
								<li><a href="#">스커트</a></li>
								<li><a href="#">반바지</a></li>
								<li><a href="#">면바지</a></li>
							</ul></li>
						<li class="dis_f ai_c c_w" id="acc"><a href="/acc">ACC</a>
							<ul id="accmenu" class="menus">
								<strong class="tit">ACC</strong>
								<li><a href="#">목걸이</a></li>
								<li><a href="#">팔찌</a></li>
								<li><a href="#">반지</a></li>
								<li><a href="#">모자</a></li>
							</ul></li>
						<li class="dis_f ai_c"><a href="/sale">SALE</a></li>
						<li class="dis_f ai_c"><a href="/event">EVENT</a></li>
					</ul>
				</nav>
				<div class="dis_f header_links ai_c">
				<a href="${pageContext.request.contextPath}/member/logout" class="">로그아웃</a>
				<a href="${pageContext.request.contextPath}/member/info" class="">회원정보</a>
					<a href="${pageContext.request.contextPath}/member/login" class="">로그인</a>
					 <a href="${pageContext.request.contextPath}/member/agree" class="">회원가입</a> 
					<a href="#" class=""><img src="${pageContext.request.contextPath}/image/search.PNG"></a> <a href="#"
						class=""><img src="${pageContext.request.contextPath}/image/cart.PNG"></a> <a href="#" class=""><img
						src="${pageContext.request.contextPath}/image/contact.PNG"></a>
				</div>
			</div>
		</header>
	</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script>
	$(function() {
		$('.bxSlider').bxSlider({
			auto : true
		})
	});
</script>
<style>
* {
	box-sizing: border-box;
}

#wrapper1 {
	width: 100%;
	margin: 0 auto;
}

.bxSlider {
	align: center;
}

.img1 {
	width: 100%;
	height: 500px;
}

.img2 {
	width: 378px;
	height: 503px;
}

.stylestory {
	text-align: center;
	margin: auto;
	width: 100%;
	border: none;
	padding: 5px;
	font-size: 48px;
	color: #333;
}

div.new {
	text-align: center;
	margin: auto;
	width: 100%;
	border: none;
	padding: 5px;
	font-size: 48px;
	color: #333;
}

div.gallery {
	margin-bottom: 50px;
	float: left;
	width: 25%;
	padding-left: 22px;
}

div.gallery img {
	width: 100%;
}

div.desc {
	padding: 10px;
	height: 50px;
	text-align: center;
}

.gallery_clear {
	width: 100%;
	min-width: 1000px;
}

.gallery_clear::after {
	content: '';
	display: block;
	clear: both;
}

div.item img {
	padding: 10px;
	display: block;
	margin-left: auto;
	margin-right: auto;
}

.item {
	float: left;
	width: 20%;
	padding-top: 80px;
	margin-bottom: 50px;
}

.item::after {
	content: '';
	display: block;
	clear: both;
}

.wrapper2 {
	background-color: black;
	width: 100%;
	min-width: 1000px;
	text-align: center;
	margin: auto;
	width: 100%;
	height: 400px;
	border: none;
	padding: 5px;
}

.desc2 {
	display: block;
	margin-left: auto;
	margin-right: auto;
	height: 150px;
	padding-left: 10px;
	color: white;
}
</style>
<div id="wrapper1">
	<div class="bxSlider">
		<div>
			<img src="${pageContext.request.contextPath}/image/main/mainpage1.png" class="img1">
		</div>
		<div>
			<img src="${pageContext.request.contextPath}/image/main/mainpage2.png" class="img1">
		</div>
		<div>
			<img src="${pageContext.request.contextPath}/image/main/mainpage3.png" class="img1">
		</div>
	</div>
</div>

<div class="stylestory">
	<p>STYLE STORY</p>
</div>
<div class="gallery_clear">
	<div class="gallery">
		<a target="_blank" href="#"> <img src="${pageContext.request.contextPath}/image/main/apeach.png"
			alt="Cinque Terre" width="378" height="504">
		</a>
		<div class="desc">
			<h4>오늘의 판매자 어피치</h4>
		</div>
	</div>

	<div class="gallery">
		<a target="_blank" href="#"> <img src="${pageContext.request.contextPath}/image/main/frodo.png" alt="Forest"
			width="378" height="504">
		</a>
		<div class="desc">
			<h4>오늘의 판매자 프로도</h4>
		</div>
	</div>

	<div class="gallery">
		<a target="_blank" href="#"> <img src="${pageContext.request.contextPath}/image/main/muzi.png"
			alt="Northern Lights" width="378" height="504">
		</a>
		<div class="desc">
			<h4>오늘의 판매자 무지</h4>
		</div>
	</div>

	<div class="gallery">
		<a target="_blank" href="#"> <img src="${pageContext.request.contextPath}/image/main/tube.png" alt="Mountains"
			width="378" height="504">
		</a>
		<div class="desc">
			<h4>오늘의 판매자 튜브</h4>
		</div>
	</div>
</div>

<div class="new">
	<p>WHAT'S TOP</p>
</div>

<div class="wrapper2">
	<c:forEach items="${top}" var="top" varStatus="status">
		<div class="item">
			<a href="${pageContext.request.contextPath }/product/detail?product_id=${top.product_id}"><img src="${pageContext.request.contextPath}/product/image?id=${top.mainfile}"
				width="190" height="253"></a>
			<div class="desc2">
				<p>오늘의 베스트${status.count}</p>
			</div>
		</div>
	</c:forEach>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

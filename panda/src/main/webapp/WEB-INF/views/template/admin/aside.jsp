<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath}/js/admin/side.js"></script>
<div id="sidebar">
	<div class="snbArea">
		<ul id="snb">
			<li><a id="" href="#none" class="product"> 상품관리 </a>
				<ul class="hide">
					<li class=""><a id="" href="#" class=""> 상품 등록 </a></li>
					<li class=""><a id="" href="#" class=""> 상품 목록 </a></li>
					<li class=""><a id="" href="#" class=""> 카테고리 관리(준비중) </a></li>
					<li class=""><a id="" href="#" class=""> 메인 관리(준비중) </a></li>
				</ul></li>
			<li><a href="#none" class="order"> 주문관리 </a>
				<ul class="hide">
					<li class=""><a href="${pageContext.request.contextPath }/seller/orders/search"> 전체주문목록 </a></li>
					<li class=""><a href="${pageContext.request.contextPath }/seller/orders/delivery"> 배송 관리 </a></li>
					<li class=""><a href="#"> 취소/교환/반품/환불(준비중) </a></li>
				</ul></li>
			<li><a href="${pageContext.request.contextPath }/seller/member/search" class="member"> 고객관리 </a></li>
			<li><a href="#" class="board"> 게시판관리 </a>
				<ul class="hide">
					<li class=""><a href="#"> 게시판 설정 </a></li>
					<li class=""><a href="#"> 게시물 관리 </a></li>
				</ul></li>
			<li><a href="#" class="promotion"> 프로모션 </a>
				<ul class="hide">
					<li class=""><a href="#"> 혜택 관리 </a></li>
					<li class=""><a href="#"> 쿠폰 관리 </a></li>
					<li class=""><a href="#"> 적립금 관리 </a></li>
				</ul></li>
			<li><a href="#" class="stat"> 통계분석 </a>
				<ul class="hide">
					<li class=""><a href="#"> 매출 분석 </a></li>
					<li class=""><a href="#"> 상품 분석 </a></li>
				</ul></li>
		</ul>
		<div class="customer">
			<strong class="title">고객센터 <span class="info">(평일
					9~18시)</span></strong>
			<div class="tel">
				8080<span class="dot">.</span>8080
			</div>
		</div>
	</div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	$(function() {
		var target = $(".product, .order, .member, .promotion, .stat, .board");
		target.click(function() {
			$(this).next().toggle();
			// 		$(this).parent().toggleClass("bc_w");
			target.not($(this)).next().hide();
			// 		target.not($(this)).parent().removeClass("bc_w");
		});

		target.next().find("a").click(function() {
			$(this).addClass("a_bold");
			target.next().find("a").not($(this)).removeClass("a_bold");
		});
	});
</script>
<style>
#a {
	text-decoration: none;
	color: black;
	line-height: 50px;
}

#snb>li {
	position: relative;
}

#snb>li>ul {
	margin-bottom: 10px;
}

#snb>li>a {
	margin-left: 15px;
	font-size: 14px;
	font-weight: bold;
}

#snb h1 {
	margin: 40px 0px;
}

.bc_w {
	background-color: whitesmoke;
}

.hide {
	display: none;
}

#sidebar .snbArea {
	display: flex;
	flex-direction: column;
	height: 100%;
}

#snb {
	margin: 0 0 auto;
	padding: 0;
}

#sidebar {
	float: left;
	width: 220px;
	height: 100%;
	margin-left: 30px;
	box-sizing: border-box;
	vertical-align: top;
	background-color: white;
}

.a_bold {
	font-weight: bold;
	color: #5fa5fe;
}
</style>
<div id="sidebar">
	<div class="snbArea">
		<ul id="snb">
			<li>
				<h1>MY PAGE</h1>
			</li>
			<li><a id="a" href="#none" class="product"> 좋아요 </a></li>
			<li><a id="a" href="#" class="order"> 주문 관리 </a>
				<ul class="">
					<li class=""><a id="a"
						href="${pageContext.request.contextPath}/orders/list"> 주문 배송
							조회 </a></li>
					<li class=""><a id="a" href="#"> 취소/교환/반품/환불 </a></li>
				</ul></li>
			<li><a id="a" href="#" class="member"> 회원 혜택 </a>
				<ul class="">
					<li class=""><a id="a"
						href="#"> 적립금</a></li>
				</ul></li>
			<li><a id="a" href="#" class="board"> 정보 관리 </a>
				<ul class="">
					<li class=""><a id="a"
						href="${pageContext.request.contextPath}/member/info"> 회원정보 수정
					</a></li>
					<li class=""><a id="a"
						href="${pageContext.request.contextPath}/member/delete"> 회원 탈퇴
					</a></li>
				</ul></li>
			<li><a id="a" href="#" class="promotion"> 문의내역 </a>
				<ul class="">
					<li class=""><a id="a" href="#"> 통합 문의 </a></li>
					<li class=""><a id="a" href="#"> 상품 문의 </a></li>
					<li class=""><a id="a" href="#"> 1:1 문의 </a></li>
				</ul></li>
		</ul>
	</div>
</div>
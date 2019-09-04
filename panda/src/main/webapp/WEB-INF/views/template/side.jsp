<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="sidebar">
			<div class="snbArea">
				<ul id="snb">
					<li>
						<h4>MY PAGE</h4>
					</li>
					<li><a id="a" href="#none" class="product"> 좋아요 </a></li>
					<li><a id="a"
						href="#"
						class="order"> 주문 관리 </a>
						<ul class="hide">
							<li class=""><a id="a" href="${pageContext.request.contextPath}/orders/list"> 주문 배송 조회 </a></li>
							<li class=""><a id="a" href="#"> 취소/교환/반품/환불 </a></li>
						</ul></li>
					<li><a id="a" href="#" class="member"> 회원 혜택 </a></li>
					<li><a id="a" href="#" class="board"> 정보 관리 </a>
						<ul class="">
							<li class=""><a id="a" href="info"> 회원정보 수정 </a></li>
							<li class=""><a id="a" href="delete"> 회원 탈퇴 </a></li>
						</ul></li>
					<li><a id="a" href="#" class="promotion"> 문의내역 </a>
						<ul class="hide">
							<li class=""><a id="a" href="#"> 통합 문의 </a></li>
							<li class=""><a id="a" href="#"> 상품 문의 </a></li>
							<li class=""><a id="a" href="#"> 1:1 문의 </a></li>
						</ul></li>
				</ul> 
			</div>
		</div>
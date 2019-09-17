<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
/* 나의 정보 */
#myInfo {
	margin-left: 150px;
	min-width: 1280px;
	background-color: #333;
	height: 200px;
	padding-top: 50px;
	padding-left: 100px;
	width: 1500px;
}

#myInfo div {
	float: left;
	width: 30%;
}

#myInfo .id {
	color: white;
	font-size: 26px;
}

#myInfo .id em {
	font-size: 18px;
}

#myInfo .grade {
	margin-top: 20px;
	color: white;
	font-size: 18px;
	color: white;
}

#myInfo .grade a {
	color: #888 !important;
	font-size: 15px;
}

#myInfo .number {
	color: white;
	font-size: 25px;
	text-align: center;
}

#myInfo .number_dd {
	color: white;
	margin-top: 10px;
	font-size: 18px;
	text-align: center;
}

#myInfo .clear {
	clear: both;
}
</style>
<div id="myInfo">
	<div>
		<p class="id">
			${myInfo.member_name} <em>(${myInfo.member_id })</em>
		</p>
		<p class="grade">
			${myInfo.grade_name } <a href="javascript:alert('준비중입니다.')" class="">혜택보기</a>
		</p>
	</div>
	<div>
		<p class="number">적립금</p>
		<p class="number_dd">
			<fmt:formatNumber value="${myInfo.current_point}" pattern="#,###.##" />
			원
		</p>
	</div>
	<div>
		<p class="number">팔로우</p>
		<p class="number_dd">${follows}명</p>
	</div>
	<div class="clear"></div>
</div>
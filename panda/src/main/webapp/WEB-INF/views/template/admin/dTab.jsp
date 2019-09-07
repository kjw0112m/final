<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>

/* 배송 메뉴 스타일 */
.tab_li {
	border:1px solid #dadcdd;;
	width: 20%;
	text-align: center;
}

.tab_li a{
	display:block;
	padding: 20px 0px;
	background-clip: content-box;
}

.tab_li .count{
	font-weight: bold;
	font-size: 26px;
}

.tab_li strong{
	font-size: 18px;
	color: #55a0ff;
}

.delTab .dTab{
	height: 100px;
	background-color: #fff;
	display: flex;
}

.delTab{
	width: 100%;
	margin-bottom: 20px;
}

.tab_li.selected:before {
    content: "";
    display: block;
    width: 100%;
    height: 4px;
    margin: -1px 0;
    background-color: #55a0ff;
}

</style>

<div class="delTab">
			<ol class="dTab">
				<li class="tab_li"><a href="before_deposit"> <strong class="title">입금전</strong><br>
				<span class="count">${before }</span></a></li>
				<li class="tab_li"><a href="ready"> <strong class="title">배송준비중</strong><br>
				<span class="count">${ready}</span></a></li>
				<li class="tab_li"><a href="waiting"> <strong class="title">배송대기</strong><br> 
				<span class="count">${waiting}</span></a></li>
				<li class="tab_li"><a href="shipping"> <strong class="title">배송중</strong><br> 
				<span class="count">${shipping}</span></a></li>
				<li class="tab_li"><a href="complete"> <strong class="title">배송완료</strong><br> 
				<span class="count">${complete}</span></a></li>
				
			</ol>
		</div>
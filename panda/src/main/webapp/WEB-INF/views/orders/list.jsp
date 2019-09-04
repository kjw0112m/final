<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<title>주문배송조회</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		var target = $(".product, .order, .member, .promotion, .stat, .board");
		target.click(function() {
			$(this).next().toggle();
			$(this).parent().toggleClass("bc_w");
			target.not($(this)).next().hide();
			target.not($(this)).parent().removeClass("bc_w");
		});

		target.next().find("a").click(function() {
			$(this).addClass("a_bold");
			target.next().find("a").not($(this)).removeClass("a_bold");
			console.log(this);
		});

		$.datepicker.setDefaults({
			dateFormat : 'yy-mm-dd',
			showOtherMonths : true // 빈 공간에 현재월의 앞뒤월의 날짜를 표시
			,
			showMonthAfterYear : true // 년도 먼저 나오고, 뒤에 월 표시
			,
			changeYear : true // 콤보박스에서 년 선택 가능
			,
			changeMonth : true // 콤보박스에서 월 선택 가능
			,
			showOn : "button",

			buttonImage : "cal.png" // 버튼 이미지 경로
			,
			buttonImageOnly : true // 기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
			,
			buttonText : "선택" // 버튼에 마우스 갖다 댔을 때 표시되는 텍스트
			,
			yearSuffix : "년" // 달력의 년도 부분 뒤에 붙는 텍스트
			,
			monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8', '9',
					'10', '11', '12' ] // 달력의 월 부분 텍스트
			,
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ] // 달력의 월 부분 Tooltip 텍스트
			,
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ] // 달력의 요일 부분 텍스트
			,
			dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일' ] // 달력의
			// 요일 부분
			// Tooltip
			// 텍스트
			,
			minDate : "-1Y" // 최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
			,
			maxDate : "0" // 최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
		});

		$('#startDate').datepicker();
		$('#endDate').datepicker();
		$('#startDate').datepicker('setDate', 'today-1M');
		$('#endDate').datepicker('setDate', 'today');
		var target = $(".product, .order, .member, .promotion, .stat, .board");
		target.click(function() {
			$(this).next().toggle();
			$(this).parent().toggleClass("bc_w");
			target.not($(this)).next().hide();
			target.not($(this)).parent().removeClass("bc_w");
		});

		target.next().find("a").click(function() {
			$(this).addClass("a_bold");
			target.next().find("a").not($(this)).removeClass("a_bold");
			console.log(this);
		});
	});
</script>
<style>
.gBreak {
	display: inline-block;
	margin: 1px 0 0;
}

.ui-datepicker-trigger {
	width: 22px;
	height: 22px;
	margin-left: 5px;
	vertical-align: -3px;
	cursor: pointer;
}

.bc_g {
	background: #dedede;
}

ul, li {
	list-style: none;
}

#container {
	position: relative;
}

#sidebar {
	position: fixed;
	z-index: 201;
	top: 0;
	left: 0;
	width: 220px;
	height: 100%;
	margin-left: 30px;
	padding: 150px 0 0;
	box-sizing: border-box;
	vertical-align: top;
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
}

.bc_w {
	background-color: whitesmoke;
}

.hide {
	display: none;
}

.a_bold {
	font-weight: bold;
	color: #5fa5fe;
}

#sidebar .snbArea .customer {
	padding: 18px 20px;
	border-top: 1px solid #eaeeef;
	background:
		url(//img.echosting.cafe24.com/ec/mode/influencer/common/bg_snb_customer.png)
		no-repeat 156px 20px;
}

#sidebar .snbArea .customer .title {
	font-size: 12px;
	color: #2e3039;
}

#sidebar .snbArea .customer .tel {
	margin: 7px 0 0;
	line-height: 24px;
	font-size: 24px;
	color: #2e3039;
	letter-spacing: -0.5px;
}

#sidebar .snbArea .customer .tel .dot {
	display: inline-block;
	margin: -5px 5px 0;
	vertical-align: top;
}

* {
	box-sizing: border-box;
}

.table1 {
	border-collapse: collapse;
	width: 1128px;
	height: 150px;
	border: 1px solid #bbb;
	text-align: center;
}

.a>th {
	height: 50px;
	border-top: 3px solid black;
}

.c>td {
	height: 50px;
	width: 33.33%;
	border-bottom: 3px solid black;
}

h4 {
	font-size: 30px;
}

.img {
	width: 140px;
	height: 140px;
}

.table2 {
	border-collapse: collapse;
	width: 100%; height : 222px;
	text-align: center;
	height: 222px;
}

.order_info dt, .order_info dd {
	padding: 0 8px 0 0;
}

.a1>th {
	visibility: hidden; height : 30px; border-bottom : 1px solid #bbb;
	text-align : right;
	font-size: 15px;
	text-align: right;
	border-bottom: 1px solid #bbb;
	height: 30px;
}

.b1>td {
	padding: 20px
}

.c1>td {
	height: 5px;
	border-bottom: 1px solid #bbb;
}

#td-d {
	text-align: left;
}

.table3 {
	border: 1px solid #bbb;
	width: 1128px;
	height: 222px;
	text-align: center;
	margin-top: 50px;
	margin-bottom: 50px;
}

.a2 {
	width: 100%;
}

.total {
	margin-top: 200px;
	margin-left: 270px;
}

a {
	color: black;
	text-decoration: none;
}

#p {
	font-size: 25px;
	margin: 20px;
}

.my_orders>li {
	position: relative;
	margin-top: 65px;
}

.order_info {
	font-size: 13px;
	line-height: 18px;
	margin-bottom: -6px;
}

.tc_3 {
	color: #333 !important;
}

.dis_f {
	display: flex;
}

dd, dl, h1, h2, h3, h4, h5, input, p, pre {
	margin: 0;
}

.myorder_list {
	width: 1128px;
}

.my_orders .go_detail {
	position: absolute;
	right: 1px;
	top: 0;
	padding-right: 40px;
	border-width: 0;
	font-size: 13px;
	line-height: 20px;
	height: 18px;
}
</style>

<body>
	<div id="container">
		<jsp:include page="/WEB-INF/views/template/side.jsp"></jsp:include>
	</div>

	<div class="total">
		<p id="p">주문 배송 조회</p>
		<form action="">
			<table class="table1">
				<tr>
					<td><span class="gBreak"> <input type="text"
							id="startDate" name="start_dt" class="fText gDate" value="">
							~ <input type="text" id="endDate" name="end_dt"
							class="fText gDate" readonly="readOnly"></span></td>
				</tr>
			</table>
		</form>
		<section class="myorder_list">
			<ul class="my_orders">
				<c:forEach var="orderViewDto" items="${orderViewList}">
					<li>
						<dl class="order_info dis_f tc_3">
							<dt>주문일</dt>
							<dd class="eng">${orderViewDto.getDate() }</dd>
							<dt>주문번호</dt>
							<dd class="eng">${orderViewDto.team}</dd>
							<dt>주문상품</dt>
							<dd class="on_w">${searchCount}개</dd>
						</dl>
						<table class="table2">
							<thead>
								<tr class="a1">
									<th>상품정보</th>
									<th>주문 금액</th>
									<th>상태</th>
									<th><a href="/mypage/order/detail/2019090455545554"
										class="go_detail">상세 내역</a></th>
								</tr>
							</thead>
							<tr class="b1">
								<td class="img"><a href="#"> <img
										src="http://placehold.it/140"></a></td>
								<td id="td-d"><a href="#">
										<div>${orderViewDto.seller_id}</div>
								</a> <a href="#">
										<div>${orderViewDto.product_name}</div>
								</a>
									<div>${orderViewDto.price}</div>
									<div>${orderViewDto.sizes}</div>
									<div>${orderViewDto.quantity}개</div> 
									</td>
								<td class="text-center">${orderViewDto.total_price}</td>
								<td>입금전</td>
							</tr>
						</table>
					</li>
				</c:forEach>
			</ul>
		</section>
		<!-- 		<table class="table3"> -->
		<!-- 			<tr> -->
		<!-- 			주문설명.png -->
		<!-- 				<td><img src="" class="a2"></td> -->
		<!-- 				<td></td> -->
		<!-- 				<td></td> -->
		<!-- 				<td></td> -->
		<!-- 			</tr> -->
		<!-- 		</table> -->

	</div>
</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
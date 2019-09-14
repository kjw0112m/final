<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
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
			showOn : "both",

			buttonImage : rootContext + "/image/admin/order/cal.png" // 버튼 이미지 경로
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

		var page = "${page}";
		var startBlock = "${startBlock}";
		var endBlock = "${endBlock}";

		function move(no) {
			$("input[name=page]").val(no);

			$("form").submit();
		}

		$(".page_move").click(function() {
			var p = $(this).text();
			move(p);
		});

		$(".page_block").click(function() {
			var p = $(this).text();
			switch (p) {
			case '<':
				move(parseInt(page) - 1);
				break;
			case '<<':
				move(parseInt(startBlock) - 1);
				break;
			case '>':
				move(parseInt(page) + 1);
				break;
			case '>>':
				move(parseInt(endBlock) + 1);
				break;
			}
		});

		var startDate = '${param.start_dt}';
		var endDate = '${param.end_dt}';
		console.log(startDate);
		if (startDate && endDate) {
			console.log('실행');
			$('#startDate').datepicker('setDate', startDate);
			$('#endDate').datepicker('setDate', endDate);
		}
	});
</script>
<style>
img {
	display: inline-block;
}

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

.total ul, li {
	padding: 0;
	margin: 0;
}

#container {
	position: relative;
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

.img {
	width: 140px;
	height: 140px;
}

.table2 {
	border-collapse: collapse;
	width: 100%;
	height: 222px;
	text-align: center;
	height: 222px;
}

.order_info dt, .order_info dd {
	padding: 0 8px 0 0;
}

.a1>th {
	visibility: hidden;
	height: 30px;
	border-bottom: 1px solid #bbb;
	text-align: right;
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
	width: 600px;
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
	margin-left: 300px;
	padding-top: 58px;
	padding-bottom: 120px;
	width: 1300px;
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
	line-height: 20px;
	color: #ff4e25 !important;
	font-weight: bold;
}

.paginate {
	margin: 25px 0 0;
	text-align: center;
}

.paginate ol, .paginate li {
	display: inline-block;
	vertical-align: middle;
	font-size: 16px;
	line-height: 16px;
	padding: 0 1px;
}

.active_page {
	font-weight: bold;
	color: #55a0ff;
}

.fText {
	height: 24px;
	font-size: 20px;
	width: 130px;
	text-align: center;
}

.fText[readonly] {
	outline: 0;
	border: 0;
}

.f25 {
	font-size: 30px;
}

.btn_search {
	width: 147px;
	margin-left: 27px;
	background-color: white;
	border: 1px solid black;
}

.large[class*=btn_] {
	height: 60px;
	padding: 2px 60px 0;
	font-size: 16px;
	line-height: 20px;
}

.fix[class*=btn_] {
	width: 100px;
	padding: 0 !important;
}

[class*=btn_] {
	min-width: 76px;
	padding: 0 26px;
	height: 40px;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	font-size: 14px;
}

dt {
	font-weight: bold;
}
</style>

<body>
	<div id="container">
		<jsp:include page="/WEB-INF/views/template/my_info.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/views/template/side.jsp"></jsp:include>
	</div>

	<div class="total">
		<p id="p">취소/교환/반품/환불</p>
		<form action="">
			<input name="page" type="hidden">
			<table class="table1">
				<tr>
					<td><span class="gBreak"> <input type="text"
							id="startDate" name="start_dt" class="fText gDate" value=""
							readonly="readonly"> <span class="f25">-</span> <input
							type="text" id="endDate" name="end_dt" class="fText gDate"
							readonly="readonly">
					</span>
						<button type="submit" class="btn_search large fix on_w">조회</button>
					</td>
				</tr>
			</table>
		</form>
		<section class="myorder_list">
			<ul class="my_orders">
				<c:forEach var="myOrder" items="${myOrder}">
					<li>
						<dl class="order_info dis_f tc_3">
							<dt>주문일</dt>
							<dd class="eng">${myOrder.getDate()}</dd>
							<dt>주문번호</dt>
							<dd class="eng">${myOrder.team}</dd>
							<dt>주문상품</dt>
							<dd class="on_w">${myOrder.getCount()}개</dd>
						</dl>
						<table class="table2">
							<thead>
								<tr class="a1">
									<th>상품정보</th>
									<th>주문 금액</th>
									<th>상태</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="orderViewDto" items="${myOrder.list}">
									<c:if test="${orderViewDto.cs_status != null }">
										<tr class="b1">
											<td class="img"><a href="#"> <img
													src="http://placehold.it/140"></a></td>
											<td id="td-d"><a href="#">
													<div>${orderViewDto.seller_id}</div>
											</a> <a href="#">
													<div>${orderViewDto.product_name}</div>
											</a>
												<div>
													<fmt:formatNumber value="${orderViewDto.price}"
														pattern="#,###.##" />
												</div>
												<div>${orderViewDto.sizes}</div>
												<div>${orderViewDto.quantity}개</div></td>
											<td class="text-center"><fmt:formatNumber
													value="${orderViewDto.total_price}" pattern="#,###.##" /></td>
											<td>${orderViewDto.cs_status }</td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</li>
				</c:forEach>
			</ul>
		</section>

		<div class="paginate">
			<ol>
				<c:if test="${(not (page eq 1))&& not empty page && page>6}">
					<li><a href="#" class="page_block">&lt;&lt;</a></li>
				</c:if>
				<c:if test="${not (page eq 1) && not empty page}">
					<li><a href="#" class="page_block">&lt;</a></li>
				</c:if>
				<!--페이지 출력 -->
				<c:forEach var="i" begin="${startBlock}" end="${endBlock}">
					<c:choose>
						<c:when test="${page == i}">
							<li class="active_page">${i}</li>
						</c:when>
						<c:otherwise>
							<c:if test="${i>0}">
								<li><a href="#" class="page_move">${i}</a></li>
							</c:if>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${not (page eq pageCount)}">
					<li><a href="#" class="page_block">&gt;</a></li>
				</c:if>
				<c:if test="${(not (page eq pageCount)) && pageCount>5}">
					<li><a href="#" class="page_block">&gt;&gt;</a></li>
				</c:if>
			</ol>
		</div>
	</div>
</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
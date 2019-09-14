<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<title>주문배송조회</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		function uncomma(str) {
			str = String(str);
			return str.replace(/[^\d]+/g, '');
		}
		
		$('input[type=checkbox]').change(function(){
			if($(this).is(':checked')){
				var total = parseInt(uncomma($(this).parent().parent().find('#total').text()));
				var cul = parseInt(uncomma($('#order_price').text())) + total;
				
				$('#order_price').text('');
				$('#order_price').append(cul.toLocaleString());
				$('#total_price').text('');
				$('#total_price').append(cul.toLocaleString());
			}
			else{
				var total = parseInt(uncomma($(this).parent().parent().find('#total').text()));
				var cul = parseInt(uncomma($('#order_price').text())) - total;
				
				$('#order_price').text('');
				$('#order_price').append(cul.toLocaleString());
				$('#total_price').text('');
				$('#total_price').append(cul.toLocaleString());
			}
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
	width: 100%;
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
	margin-left: 350px;
	width: 1200px;
}

a {
	color: black;
	text-decoration: none;
}

#p {
	font-size: 20px;
	margin: 20px 0;
	font-weight: bold;
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
	width: 100%;
	margin-bottom: 50px;
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

.payinfo {
	border-collapse: collapse;
	width: 100%;
	height: 222px;
	text-align: center;
	border-left: 1px solid #bbb;
	border-right: 1px solid #bbb;
	border-top: 1px solid #bbb;
	border-bottom: 1px solid #bbb;
	margin-bottom: 50px;
}

.a2>th {
	height: 50px;
	border-bottom: 1px solid #bbb;
	color: black;
	text-align: center;
	font-size: 14px;
	padding: 10px;
}

.b2>td {
	width: 14.28%;
	padding: 25px;
}

#span1 {
	font-size: 50px;
	margin: 20px;
	color: #bbb;
}

#h3 {
	font-size: 20px;
	font-weight: 700px;
	margin-top: 100px;
}

.c_btn {
    border: 1px solid black;
    background-color: black;
    color: white;
    height: 50px;
    width: 150px;
    font-size: 15px;
    margin-right: 30px;
}

.c_btn.white{
	background-color: white;
	color: black;
}

.btndiv {
    text-align: center;
    width: 100%;
    margin-bottom: 50px;
}
</style>

<body>
	<div id="container">
		<jsp:include page="/WEB-INF/views/template/side.jsp"></jsp:include>
	</div>

	<form action="${pageContext.request.contextPath}/orders/cancel" method="post">
		<input type="hidden" name="pay_status" value="${orderViewDto.get(0).pay_status}">
		<input type="hidden" name="team" value="${orderViewDto.get(0).team}">
		<input type="hidden" name="discount_price" value="${orderViewDto.get(0).discount_price}">
		<div class="total">
			<p id="p">취소 신청</p>
			
			<section class="myorder_list">
				<ul class="my_orders">
					<li>
						<dl class="order_info dis_f tc_3">
							<dt>주문일</dt>
							<dd class="eng">${orderViewDto.get(0).getDate()}</dd>
							<dt>주문번호</dt>
							<dd class="eng">${orderViewDto.get(0).team}</dd>
						</dl>
						<table class="table2">
							<colgroup>
								<col style="width: 50px;">
								<col style="width: 150px;">
								<col style="width: 500px;">
								<col style="width: 120px;">
								<col style="width: 360px;">
							</colgroup>
							<thead>
								<tr class="a1">
									<th></th>
									<th>상품정보</th>
									<th>주문 금액</th>
									<th>상태</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="orderViewDto" items="${orderViewDto}">
									<tr class="b1">
										<td><input type="checkbox" name="order_id" value="${orderViewDto.order_id}"> </td>
										<td class="img"><a href="#"> <img
												src="http://placehold.it/140"></a></td>
										<td id="td-d"><a href="#">
												<div>${orderViewDto.seller_id}</div>
										</a> <a href="#">
												<div>${orderViewDto.product_name}</div>
										</a>
											<div id="">
												<fmt:formatNumber value="${orderViewDto.price}"
													pattern="#,###.##" />
											</div>
											<div>${orderViewDto.sizes}</div>
											<div>${orderViewDto.quantity}개</div></td>
										<td class="text-center" id="total"><fmt:formatNumber
												value="${orderViewDto.total_price}" pattern="#,###.##" /></td>
										<td>${orderViewDto.pay_status }
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</li>
				</ul>
			</section>
			<p id="p">주문 취소 결제 정보</p>
			<table class="payinfo">
				<tr class="a2">
					<th>결제수단 : ${orderViewDto.get(0).pay_type }</th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
				</tr>
				<tr class="b2">
					<td><h3 id="order_price">0</h3>
						<p>주문 금액</p></td>
					<td><span id="span1">+</sapn></td>
					<td><h3>0</h3>
						<p>배송비</p></td>
					<td><sapn id="span1">-</sapn></td>
					<td><h3>0</h3>
						<p>마일리지 사용</p></td>
					<td><sapn id="span1">=</sapn></td>
					<td><h3 id="total_price">0</h3>
						<p>총 환불 금액</p></td>
				</tr>
			</table>
		</div>
		<div class="btndiv">
			<a href="${pageContext.request.contextPath}/"><button type="button" class="c_btn white">취소</button></a>
			<a href="#"><button class="c_btn">취소 신청</button></a>
		</div>
	</form>
</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
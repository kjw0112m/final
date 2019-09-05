<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-latest.js"></script>

<style>
ul, li {
	list-style: none;
}

#container {
	position: relative;
}

.table1 {
	border-collapse: collapse;
	border-spacing: 2px;
	width: 100%;
	height: 222px;
	text-align: center;
}

h4 {
	font-size: 30px;
	font-weight: 700px;
	margin: 20px;
}

#span1 {
	font-size: 50px;
	margin: 20px;
	color: #bbb;
}

.a1>th {
	height: 30px;
	border-bottom: 2px solid black;
	color: #bbb;
	text-align: right;
	font-size: 15px;
}

.b1>td {
	height: 5px;
	border-bottom: 1px solid #bbb;
	padding: 20px;
}

.img {
	width: 140px;
	height: 140px;
}

#td-d {
	text-align: left;
}

.table2 {
	border-collapse: collapse;
	width: 100%;
	height: 222px;
	text-align: center;
	border-left: 1px solid #bbb;
	border-right: 1px solid #bbb;
	border-top: 1px solid #bbb;
	border-bottom: 1px solid #bbb;
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

.total {
	margin-left: 270px;
	width: 1563px;
}

.table3 {
	border-collapse: collapse;
	width: 100%;
	text-align: left;
	background-color: #f7f7f7;;
	height: 200px;
}

.a3>th>p {
	border-left: 30px solid #f7f7f7;
	font-size: 15px;
}

.b3>td>p {
	border-left: 30px solid #f7f7f7;
	font-size: 15px;
}

.a3>th {
	border-right: 2px solid white;
}

.b3>td {
	border-right: 2px solid white;
}

.h4 {
	font-size: 30px;
	font-weight: 700px;
	margin: 20px;
}

#h3 {
	font-size: 20px;
	font-weight: 700px;
	margin-top: 100px;
}

#span1 {
	font-size: 50px;
	margin: 20px;
	color: #bbb;
}

.btn1 {
	margin-top: 30px;
	border: none;
	background-color: white;
	border: 1px solid black;
	color: black;
	height: 50px;
	width: 150px;
}

.btn2 {
	margin-top: 30px;
	border: none;
	background-color: black;
	color: #fff;
	height: 50px;
	width: 150px;
}

.btndiv {
	margin-left: 660px;
	margin-bottom: 50px;
}

a {
	color: #2e3039;
	text-decoration: none;
}

.myorder_list {
	width: 100%;
}

.my_orders {
	padding: 0;
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

.tc_3 {
	color: #333 !important;
}

.dis_f {
	display: flex;
}

dd, dt {
	margin-right: 15px !important;
	margin-left: 0;
}

dt {
	font-weight: bold;
}
</style>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<div id="container">
	<jsp:include page="/WEB-INF/views/template/side.jsp"></jsp:include>
	<div class="total">
		<form action="">
			<section class="myorder_list">
				<ul class="my_orders">
					<li>
						<dl class="order_info dis_f tc_3">
							<dt>주문일</dt>
							<dd class="eng">${orderViewDto.get(0).getDate()}</dd>
							<dt>주문번호</dt>
							<dd class="eng">${orderViewDto.get(0).team}</dd>
						</dl>
						<table class="table1">
							<colgroup>
								<col>
								<col style="width: 600px;">
								<col style="width: 120px;">
								<col style="width: 360px;">
							</colgroup>
							<thead>
								<tr class="a1">
									<th>상품정보</th>
									<th>주문 금액</th>
									<th>상태</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="orderViewDto" items="${orderViewDto}">
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
										<td>${orderViewDto.pay_status }
											<p>
												<c:choose>
													<c:when
														test="${orderViewDto.t_status=='배송중' or orderViewDto.t_status == '배송완료'}">
														<a href="#">[교환 및 환불]</a>
														<c:if test="${orderViewDto.t_status=='배송중'}">
															<a href="#">[배송조회]</a>
														</c:if>
													</c:when>
													<c:otherwise>
														<a href="#">[취소]</a>
													</c:otherwise>
												</c:choose>
											</p>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</li>
				</ul>
			</section>
		</form>
		<h3 id="h3">결제 내역</h3>
		<table class="table2">
			<tr class="a2">
				<th>결제수단 : ${orderViewDto.get(0).pay_type}</th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr class="b2">
				<td><h3>
						<fmt:formatNumber value="${price}" pattern="#,###.##" />
					</h3>
					<p>주문 금액</p></td>
				<td><span id="span1">+</sapn></td>
				<td><h3>0</h3>
					<p>배송비</p></td>
				<td><sapn id="span1">-</sapn></td>
				<td><h3>0</h3>
					<p>적립금 사용</p></td>
				<td><sapn id="span1">=</sapn></td>
				<td><h3>
						<fmt:formatNumber value="${price}" pattern="#,###.##" />
					</h3>
					<p>총 결제 금액</p></td>
			</tr>
		</table>

		<h3 id="h3">배송지 정보</h3>
		<table class="table3">
			<tr class="a3">
				<th><p>주문하시는 분</p></th>
				<th><p>받으시는 분</p></th>
			</tr>
			<tr class="b3">
				<td><p>이름: ${orderViewDto.get(0).member_name}</p>
					<p>연락처: ${orderViewDto.get(0).phone }</p>
					<p>주소: ${orderViewDto.get(0).getAddr()}</p></td>
				<td><p>이름: ${orderViewDto.get(0).re_name}</p>
					<p>연락처: ${orderViewDto.get(0).re_phone }</p>
					</p>
					<p>주소: ${orderViewDto.get(0).re_addr}</p></td>
		</table>
	</div>

	<div class="btndiv">
		<a href="${pageContext.request.contextPath}/one/one_List"><button class="btn1">1:1문의</button></a> <a href="cancel"><button
				class="btn2">전체취소</button></a> <a href="${pageContext.request.contextPath}/orders/list"><button class="btn2">목록</button></a>
	</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
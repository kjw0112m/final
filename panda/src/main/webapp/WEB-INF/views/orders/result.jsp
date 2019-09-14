<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
* {
	box-sizing: border-box;
}

.table1 {
	border-collapse: collapse;
	width: 1128px;
	height: 222px;
	margin: auto;
	text-align: center;
	background-color: #bbb;
	
}

.a>th {
	height: 50px;
	border-top: 3px solid #bbb;
}

.c>td {
	height: 50px;
	width: 33.33%;
	border-bottom: 3px solid #bbb;
}

h4 {
	font-size: 30px;
	font-weight: 700px;
	margin: 20px;
}

.btn {
	margin-top: 30px;
	border: none;
	background-color: black;
	color: #fff;
	height: 40px;
	width: 150px;
	margin-top: 50px;
}

#top {
	margin-top: 150px;
	margin-bottom: 100px;
	text-align: center;
	font-size: 16px;
	line-height: 24px;
	color: black;
}

.total {
	margin: auto;
}

#btn2div { 
	margin-top: 30px;
	text-align: center;
	width: 100%;
	padding-bottom: 150px;
}
</style>
<script src="https:/code.jquery.com/jquery-latest.js"></script>
 
<div class="total">
	<div id="top">
		<span>01 쇼핑백</span><span> > 02 주문결제</span><span
			style="font-weight: bold"> > 03 주문완료</span>
	</div>
	<table class="table1">
		<thead>
			<tr class="a">
				<th></th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tr class="b">
			<td></td>
			<td>
				<h4>주문이 완료되었습니다.</h4>
				<p>주문정보 및 배송정보는 마이페이지에서 확인할 수 있습니다.</p>
			</td>
			<td></td>
		</tr>
		<tr class="c">
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table>
	<div id="btn2div">
		<a href="${pageContext.request.contextPath}/"><button class="btn">홈으로 가기</button></a> <a href="${pageContext.request.contextPath}/orders/list"><button
				class="btn">주문내역</button></a>
	</div>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
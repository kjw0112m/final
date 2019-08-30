<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<style>
.btn {
	margin-top: 30px;
	border: none;
	background-color: black;
	color: #fff;
	height: 50px;
	width: 150px;
	margin-left: 20px;
}

.top-table {
	text-align: left;
	margin: auto;
	width: 70%;
	border: 3px none;
	padding: 5px;
	color: #555;
	font-size: 22px;
}

.btn-delete {
	margin-top: 10px;
	margin-bottom: 30px;
	margin-left: 15%;
}

.btn-de {
	text-align: center;
	background-color: #fff;
	height: 50px;
	width: 150px;
	border: 1px solid #bbb;
}

.table_st {
	border-width: 2px 0 0;
	border-style: solid;
	text-align: center;
	margin: auto;
	width: 70%;
}

.text-left {
	text-align: left;
}

.text-conter {
	text-align: center;
}

.table_st th, .table_st td {
	border-width: 0 0 1px;
	border-style: solid;
	border-color: #d0d0d0;
}

table {
	border-collapse: collapse;
}

.imggg {
	width: 140px;
	height: 140px;
}

.b1 {
	width: 140px;
	height: 140px;
	padding: 20px;
}

.table2 {
	margin: auto;
	border-collapse: collapse;
	width: 70%;
	height: 150px;
	text-align: center;
	border: 2px solid black;
}

.b2>td {
	width: 100px;
}

#span1 {
	font-size: 20px;
	color: black;
	width: 100%;
}

#top {
	margin-top: 150px;
	text-align: center;
	font-size: 16px;
	line-height: 24px;
	color: black;
}

a {
	color: black;
	text-decoration: none;
}

.total {
	margin: auto;
}

.box-price {
	margin-top: 30px;
	text-align: center;
	width: 100%;
}

.quantity_text {
	padding: 0;
	width: 44px;
	height: 34px;
	text-align: center;
	font-size: 15px;
}

.w150 {
	width: 150px;
}

#plus_btn, #minus_btn {
	background: #000000;
	color: #fff;
	border: none;
	width: 25px;
	height: 25px;
}

.product_info {
	padding-left: 30px;
}
</style>
<script>
	$(function() {
		var id = [];
		$('.btn-de').click(function() {
			$('.cart_no').each(function() {
				if ($(this).is(':checked')) {
					id.push($(this).val());
				}
			});
			jQuery.ajaxSettings.traditional = true;
			$.ajax({
				url : "delete",
				type : "GET",
				dataType : "text",
				data : {
					id : id
				},
				success : function(resp) {
					location.reload();
				}
			});
		});

		$("#all_check").change(function() {
			if ($(this).is(":checked")) {
				$(".sub_check").prop("checked", true);
			} else {
				$(".sub_check").prop("checked", false);
			}
		});

		$(".sub_check").change(function() {
			if (!$(this).is(":checked")) {
				$("#all_check").prop("checked", false);
			}
		});

		$("#plus_btn").click(function() {
			var num = $(this).prev().val();
			if (num < 51)
				$(this).prev().val(parseInt(num) + 1);
		});
		$("#minus_btn").click(function() {
			var num = $(this).next().val();
			if (num > 1)
				$(this).next().val(parseInt(num) - 1);
		});
	});
</script>
<div class="total">
	<div id="top">
		<span style="font-weight: bold">01 쇼핑백</span><span> > 02 주문결제</span><span>
			> 03 주문완료</span>
	</div>

	<div class="top-table">
		<h4>쇼핑백</h4>
	</div>
	<form action="order" method="post">
		<input type="hidden" name=""> <input type="hidden" name="">
		<input type="hidden" name=""> <input type="hidden" name="">
		<input type="hidden" name=""> <input type="hidden" name="">
		<table class="table_st">
			<thead>
				<tr>
					<th><input type="checkbox" name="id" id="all_check"></th>
					<th></th>
					<th>상품정보</th>
					<th class="w150">수량</th>
					<th>주문금액</th>
					<th>배송비</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="c" items="${cList}">
					<tr class="cart_wrap">
						<td><input type="checkbox" name="id" value="${c.cart_id }"
							class="cart_no sub_check"></td>
						<td class="b1"><a href="#" class="img"> <img
								src="http://placehold.it/140"></a></td>
						<td class="text-left product_info"><a href="#"><div>${c.product_seller_id}</div></a>
							<a href="#"><div>${c.product_name}</div></a>
							<div>${c.product_price}</div>
							<div>${c.sizes_sizes}</div></td>
						<td class="text-center w150">
							<button type="button" id="minus_btn">-</button> <input
							type="text" name="quantity" value="${c.quantity}"
							class="quantity_text">
							<button type="button" id="plus_btn">+</button>
						</td>
						<td class="text-center">${c.product_price}원</td>
						<td class="text-center">0</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="btn-delete">
			<input class="btn-de" type="button" value="선택 상품 삭제"><br>
		</div>
		<table class="table2">
			<tr class="b2">
				<td><span id="span1">상품합계 ${c.product_price}</span><span
					id="span2"> + </span><span id="span1">배송비 0</span> <span id="span2">
						- </span> <span id="span1">마일리지 사용 0</span> <span id="span2"> = </span><span
					id="span1">합계 100,000</span></td>
			</tr>
		</table>
		<div class="box-price">
			<a href="#"><button class="btn">쇼핑계속하기</button></a> <a href="#"><button
					class="btn">구매하기</button></a>
		</div>
	</form>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
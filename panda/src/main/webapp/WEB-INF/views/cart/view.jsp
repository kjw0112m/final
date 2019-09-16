<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

.span1 {
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

.quantity_text {
	background: white;
	border: solid 1px black;
}

.w150 {
	width: 150px;
}

.plus_btn, .minus_btn {
	background: #000000;
	color: #fff;
	border: none;
	width: 25px;
	height: 25px;
}

.product_info {
	padding-left: 30px;
}

.table_st img{
	width: 150px;
	height: 150px;
}
</style>
<script>
	$(function() {
		function uncomma(str) {
			str = String(str);
			return str.replace(/[^\d]+/g, '');
		}

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

		function total() {
			var total_price = 0;
			$('.c_price').each(function() {
				var price = 0;
				if ($(this).parent().find("input[name='id']").prop('checked'))
					price = parseInt(uncomma($(this).text()));
				total_price += price;
			});
			$('#total_price').text('');
			$('#total_price').append(' ').append(total_price.toLocaleString());

			var t_price = parseInt(uncomma($('#t_price').text()));
			var point = parseInt(uncomma($('#point').text()));
			var cal_price = total_price + t_price - point;
			$('#cal_price').text('');
			$('#cal_price').append(' ').append(cal_price.toLocaleString());
			$("input[name=totalPrice]").val(cal_price);
			
		}
		$("#all_check").prop("checked", true);
		$("input[name='id']").each(function(){
			$(this).prop("checked", true);
		});
		$("#all_check").change(function() {
			if ($(this).is(":checked")) {
				$(".sub_check").prop("checked", true);
			} else {
				$(".sub_check").prop("checked", false);
			}
				total();
		});

		$(".sub_check").change(function() {
			if (!$(this).is(":checked")) {
				$("#all_check").prop("checked", false);
			}
			total();
		});

		$('.product_price').each(
				function() {
					var price = parseInt(uncomma($(this).text()));
					var quantity = $(this).parent().parent().find(
							"input[name='quantity']").val();
					price = price * quantity
					$(this).parent().parent().find(".c_price").text('');
					$(this).parent().parent().find(".c_price").append(
							price.toLocaleString());
				});
		total();

		$(".plus_btn").click(
				function() {
					var num = $(this).prev().val();
					var price = uncomma($(this).parent().prev().find(
							'.product_price').text());
					if (num < 51)
						num = parseInt(num) + 1;
					$(this).prev().val(num);
					price = price * num;
					$(this).parent().next().text('');
					$(this).parent().next().text(price.toLocaleString());
					total();

					var id = $(this).parent().parent().find("input[name='id']")
							.val();
					$.ajax({
						url : "quantity",
						type : "POST",
						dataType : "text",
						data : {
							id : id,
							quantity : num
						}
					});
				});
		$(".minus_btn")
				.click(
						function() {
							var num = $(this).next().val();
							var price = parseInt(uncomma($(this).parent()
									.next().text()))
									/ parseInt(num);
							if (num > 1)
								num = parseInt(num) - 1
							$(this).next().val(num);
							price = price * num;
							$(this).parent().next().text('');
							$(this).parent().next().append(
									price.toLocaleString());
							total();

							var id = $(this).parent().parent().find(
									"input[name='id']").val();
							$.ajax({
								url : "quantity",
								type : "POST",
								dataType : "text",
								data : {
									id : id,
									quantity : num
								}
							});
						});

		$("#buy_btn").click(function() {
			$('form').submit();
		})
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
	<form action="${pageContext.request.contextPath}/orders/order_form"
		method="post">
		<input name="totalPrice" type="hidden">
		<table class="table_st">
			<thead>
				<tr>
					<th><input type="checkbox" id="all_check"></th>
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
						<td class="b1"><a href="${pageContext.request.contextPath}/product/detail?product_id=${c.product_id}" class="img"> <img
								src="${pageContext.request.contextPath}/product/image?id=${c.mainfile}"></a></td>
						<td class="text-left product_info"><a href="#"><div>${c.product_seller_id}</div></a>
							<a href="#"><div>${c.product_name}</div></a>
							<div class="product_price">
								<fmt:formatNumber value="${c.product_price}" pattern="#,###.##" />
							</div>
							<div>${c.sizes}</div></td>
						<td class="text-center w150">
							<button type="button" class="minus_btn">-</button> <input
							type="text" name="quantity" value="${c.quantity}"
							class="quantity_text" disabled="disabled">
							<button type="button" class="plus_btn">+</button>
						</td>
						<td class="text-center c_price"></td>
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
				<td>상품합계<span class="span1" id="total_price"></span><span
					class="span2"> + 배송비 </span><span class="span1" id="t_price">0</span>
					<span class="span2"> - 적립금 사용 </span> <span class="span1"
					id="point">0</span> <span class="span2"> = </span><span
					class="span1" id="cal_price"></span></td>
			</tr>
		</table>
		<div class="box-price">
			<a href="${pageContext.request.contextPath}/panda/"><button
					class="btn">쇼핑계속하기</button></a> <a href="#"><button class="btn"
					id="buy_btn">구매하기</button></a>
		</div>
	</form>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
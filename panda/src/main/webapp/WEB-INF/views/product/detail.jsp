<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function() {
		//프로그램 시작시 템플릿을 백업 후 삭제
		var template = $(".template").children().clone();		
		
		function uncomma(str) {
			str = String(str);
			return str.replace(/[^\d]+/g, '');
		}
		
		var total = 0;
		var quan = 0;
		function cal(){			
			total = 0;
			quan = 0;
			$(".space").find(".num").each(function(i){
				quan += parseInt($(this).val());
				total = parseInt($(this).val());
// 			var pri = parseInt($(".formdiv").find(".price").text());
				var pri = parseInt(uncomma($(".formdiv").find(".price").text()));
				total = (pri * quan);
			});
			$(".total").text(total + " KRW");
		};
		
		$("#sizes").change(function() {
			var sizesSelect = document.getElementById("sizes");
			var quantitySelect = $("#sizes").find("option:selected").data("quantity");
			var value = sizesSelect.value;
			var clone = template.clone();
			var check = false;
			
			if(quantitySelect<=0){
				check = true;
			}
			$(".space").find(".selectedSizes").each(function(){
				if($(this).text() == value) {
					check = true;
				}
			});
			
			if(!check){
				$(".space").append(clone);
				cal();
			}
			clone.find(".selectedSizes").text(value);
			clone.find(".selectedQuantity").text(quantitySelect);
			
			var up = clone.find(".bt_up");
			var down = clone.find(".bt_down");
			var del = clone.find(".del");
			var quantity = clone.find(".num");
			
			quantity.on("change", function(){
				if(parseInt(quantity.val()) <= 1) {
					alert("수량은 1개 이상이어야 합니다");
					quantity.val(1);
				}
				if(parseInt(quantity.val()) > quantitySelect) {
					alert("해당 상품은 " + quantitySelect + "개까지만 구입 가능합니다");
					quantity.val(quantitySelect);
				}
				cal();
			});
			
			up.click(function(e){
				e.preventDefault();
				var input = $(this).prev();
				if(parseInt(input.val()) >= quantitySelect) {
					alert("해당 상품은 " + quantitySelect + "개까지만 구입 가능합니다");
					quantity.val(quantitySelect);
				}
				else {
					input.val(parseInt(input.val()) + 1);					
				}
				cal();
			});

			down.click(function(e){
				e.preventDefault();
				var input = $(this).next();
				if(parseInt(input.val()) <= 1) {
					input.val(1);
				} else {
					input.val(parseInt(input.val()) - 1);
				}
				cal();
			});

			del.click(function() {
				$(this).parent().remove();
				cal();
			});

			// 			var total = 0;
			// 			$(".num").each(function(){
			// 				var quantity = parseInt($(this).text());
			// 				total = total + quantity * ${productSellerDto.price};
			// 			});

			// 			$(clone).append(total);

		});
		
		var totalPrice = parseInt("${productSellerDto.price}");
		var sumCount = 0;

		$('#cart').click(function(){
			$('#cart').submit();
		});
		
		$("#cart").submit(function(e) {
			e.preventDefault();
			$(".space").find("div").each(function() {
				var sizes = $(this).find('.selectedSizes').text();
				var count = $(this).find('.num').val();
				var sum = sizes + "-" + count;
				// $(this).find('.num').val(sum);
				$(this).find('.s_q').val(sum);
			});
			//this : form
			$('form').attr('method', 'post');
			this.submit();
		});

		$('#order').click(function(){
			$('#order').submit();
		});
		
		$("#order").submit(function(e) {
			e.preventDefault();
			$(".space").find("div").each(function() {
				var sizes = $(this).find('.selectedSizes').text();
				var count = $(this).find('.num').val();
				var sum = sizes + "-" + count;
				sumCount += parseInt(count);
				// $(this).find('.num').val(sum);
				$(this).find('.s_q').val(sum);
			});
			totalPrice = totalPrice * sumCount;
			$('#total_price').val(totalPrice);
			//this : form
			this.submit();
		});
		
		$("#ordersid").val($("[name='product_id']").val());
		
		/* alert($("[name='product_id']").val()); */
	});
</script>
<style>
	.spec {		
		width: 50%;
		margin: auto;
		float: left;
		margin-bottom: 20px;	
	}
	.spec img{
		width: 660px;
	}

	.formdiv {
		float: left;
		width: 540px;
		margin-left: 70px;
	}
	
	.clear{
		clear: both;
	}
	
	.formdiv dt {
		float: left;
		width: 80px;
		font-size: 14px;
	}

	.formdiv dd {
		font-size: 30px;
		line-height: 34px;
		font-weight: 700;

	}

	.formdiv h2 {
		font-size: 30px;
		line-height: 32px;
		font-weight: 700;
		margin-bottom: 12px;
	}

	.formdiv h4 {
		font-size: 21px;
		line-height: 24px;
		margin-bottom: 24px;
	}

	#sizes {
		width: 100%;
		height: 38px;
		background-color: transparent;
		font-size: 14px;
	}

	#cart {
		height: 60px;
		padding: 2px 60px 0;
		min-width: 76px;
		font-size: 16px;
		line-height: 20px;
		width: calc(50% - 3px);
		float: left;
		margin: 0px;
		border-color: #bbb;
		border-style: solid;
		border-width: 1px;
		background-color: rgba(0, 0, 0, 0);
	}

	#order {
		float: right;
		height: 60px;
		padding: 2px 60px 0;
		min-width: 76px;
		font-size: 16px;
		line-height: 20px;
		width: calc(50% - 3px);
		background-color: #111;
		color: #fff;
		border-style: solid;
		border-width: 1px;
	}

	#pimg {
		min-width: 1200px;
		max-width: 1200px;
		padding: 100px 20px 20px 20px;
		margin-top: 50px;
		margin-bottom: 150px;
		border-top: 1px solid #bbb;
	}

	.content {
		margin: auto;
	}
	
	.total {
		margin: auto;
	}

	.textcontent {
		padding-top: 150px;
		margin: auto;
		width: 1260px;
	}
	
	.clear{
		display: block;
		clear: both;
		content: "";
	}
	
	.bottomimg{
		margin: auto;
		text-align: center;
		width: 1300px;	
	}
</style>
</head>
		<div class="content">
		<div class="textcontent">
			<div class="spec">
				<img src="${pageContext.request.contextPath}/product/image?id=${productSellerDto.mainfile}"><br>
			</div>
			<div class="formdiv">
				<h2>${productSellerDto.nickname}</h2><br>
				<h4>${productSellerDto.product_name}</h4><br><br>
				<dl>
					<dt>정상가</dt>
					<dd><span class="price">
					<fmt:formatNumber value="${productSellerDto.price}" pattern="#,###.##" />
					</span></dd>
				</dl>
				<br><br>
				<hr>
				<br><br>
				<form action="../cart/add" method="post">
					<input type="hidden" name="product_id" value="${productSellerDto.product_id}">
					<input type="hidden" name="totalPrice" value="" id="total_price">
					<select id="sizes" required="required">
						<option value="" selected="selected" disabled="disabled">사이즈 선택</option>
						<c:forEach var="sizesDto" items="${list}">
							<option value="${sizesDto.sizes}" data-size="${sizesDto.sizes}"
								data-quantity="${sizesDto.quantity}">${sizesDto.sizes} / ${sizesDto.quantity}개</option>
						</c:forEach>
					</select><br><br>
					<div class="space"></div>
					<div class="total">
						<fmt:formatNumber value="" pattern="#,###.##" />
					</div>
					<div class="button">
						<input type="submit" value="카트담기 " id="cart">
						<input type="submit"  formaction="../orders/order_form" value="바로주문" id="order">
					</div>
				</form>
			</div>
			<div class="clear"></div>
			<div class="template" style="display: none">
					<div>
						<!-- 템플릿 -->
						<span class="selectedSizes"></span>
						<a class="bt_down">
							▼
						</a>
						<input type="text" value="1" id="" class="num" />
						<a class="bt_up">
							▲
						</a>
						<button class="del">삭제</button>
						<br> <br> <input type="hidden" name="s_q" class="s_q">
					</div>
				</div>
		</div>
		
		<div class="bottomimg">
			<img src="${pageContext.request.contextPath}/product/image?id=${productSellerDto.detailfile}" id="pimg">
			</div>
		</div>
		
		
		
<jsp:include page="/WEB-INF/views/review/review_comment2.jsp">
	<jsp:param value="${productSellerDto.product_id}" name="orderid"/>
</jsp:include>    	

		

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

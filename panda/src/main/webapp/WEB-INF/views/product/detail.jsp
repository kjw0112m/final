<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		
		var total = 0;
		var quan = 0;
		function cal(){			
			total = 0;
			quan = 0;
			$(".space").find(".num").each(function(i){
				quan += parseInt($(this).val());
				console.log(quan);
				total = parseInt($(this).val());
				var pri = parseInt($(".spec").find(".price").text());
				total = (pri * quan);
				console.log(total);
			});
			$(".total").text(total + "원");
		};
		
		$("#sizes").change(function() {
			var sizesSelect = document.getElementById("sizes");
			var quantitySelect = $("#sizes").find("option:selected").data("quantity");
			var value = sizesSelect.value;
			var clone = template.clone();
// 			var check = false;
			
// 			if(quantitySelect<=0){
// 				check = true;
// 			}
// 			$(".space").find(".selectedSizes").each(function(){
// 				if($(this).text() == value) {
// 					check = true;
// 				}
// 			});
			
// 			if(!check){
				$(".space").append(clone);
				cal();
// 			}
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

		$("form").submit(function(e) {
			e.preventDefault();
			$(".space").find("div").each(function() {
				var sizes = $(this).find('.selectedSizes').text();
				var count = $(this).find('.num').val();
				var sum = sizes + "-" + count;
				// $(this).find('.num').val(sum);
				$(this).find('.s_q').val(sum);
			});

			//this : form
			this.submit();
		});
	});
</script>
</head>
<body>
	<div class="spec">
		<img src="http://placehold.it/350x350.png?text=Main+Image"> <br>
		<br> ${productSellerDto.nickname} <br> <br>
		${productSellerDto.product_name} <br> <br>
		<span class="price">${productSellerDto.price}</span> <br> <br>
	</div>
	<!-- 	<form action="../cart/view" method="post"> -->
	<form>
		<input type="hidden" name="product_id" value="${productSellerDto.product_id}">
		<select id="sizes">
			<option value=""  selected="selected" disabled="disabled">사이즈 선택</option>
			<c:forEach var="sizesDto" items="${list}">
				<option value="${sizesDto.sizes}" data-size="${sizesDto.sizes}" data-quantity="${sizesDto.quantity}">${sizesDto.sizes} / ${sizesDto.quantity}개</option>
			</c:forEach>
		</select> <br> <br>
		<div class="space"></div>
		<div class="total"></div>
		<input type="submit" value="카트담기"> <input type="submit"
			formaction="../orders/order" value="바로주문">
	</form>
	<br>
	<br>
	<img src="http://placehold.it/350x1000.png?text=Detail+Image">
	<br>
	<br>
	<div class="template" style="display: none">
		<div>
			<!-- 템플릿 -->
			<span class="selectedSizes"></span> 
			<a class="bt_down">
				▼
			</a>
			<input type="text" value="1" id="" class="num"/>
			<a class="bt_up">
				▲
			</a>
			<span class="selectedQuantity"></span>
			<button class="del">삭제</button>
			<br> <br> <input type="hidden" name="s_q" class="s_q">
		</div>
	</div>
</body>
</html>
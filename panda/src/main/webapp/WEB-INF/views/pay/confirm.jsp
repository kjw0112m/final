<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	최종 결제 전에 사용자에게 확인받는 페이지
	이 페이지에서는 반드시 다음 항목이 서버로 전송되어야 함
	- item_name			상품명, 최대 100자
	- quantity			상품 수량
	- total_amount	상품 총액
-->

<form action="confirm" method="post">
	상품명 : <input type="text" name="item_name" required>
	<br><br>
	수량 : <input type="text" name="quantity" required>	
	<br><br>
	총액 : <input type="text" name="total_amount" required>
	<br><br>
	<input type="submit" value="결제하기">
</form>





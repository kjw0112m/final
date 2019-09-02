<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정 페이지</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		
		$("form").submit(function(e){
			e.preventDefault();
			
			$("input[name=sizes]:checked").each(function(){
				//$(this) : 체크박스
				//$(this).next() : 수량 입력창
				var sizes = $(this).val();
				var count = $(this).next().val();
				var sum = sizes + "-" + count;
				console.log(sum);
				$(this).val(sum);
			});
			
			//this : form
			this.submit();
		});
		
	});
</script>
</head>
<body>
<h1>상품 수정</h1>
<form action="edit" method="post" enctype="multipart/form-data">
<input type="hidden" name="id" value="${productDto.id}">
상품 카테고리 : ${subcategory}
<br><br>
상품명 : ${productDto.name}
<br><br>
판매가 <input type="number" name="price" placeholder="가격" required
			value="${productDto.price}">원
<br><br>
사이즈
<br><br>
<c:forEach var ="sizes" items="${list}">
	<input type="checkbox" name="sizes" value="${sizes.sizes}" checked> ${sizes.sizes}
	<input type="number"  value="${sizes.quantity}">개
	<br><br>
</c:forEach>
<br><br>
<input type="file" name="main" accept="image/gif, image/jpeg, image/png">
<br><br>
<input type="file" name="details" accept="image/gif, image/jpeg, image/png">
<br><br>
판매 여부
<input type="radio" name="sale_yn" value="y" ${productDto.sale_yn eq 'y'?'checked':''}> Y
<input type="radio" name="sale_yn" value="n" ${productDto.sale_yn eq 'n'?'checked':''}> N
<br><br>
인기상품 표시 여부
<input type="radio" name="hit_yn" value="y" ${productDto.hit_yn eq 'y'?'checked':''}> Y
<input type="radio" name="hit_yn" value="n" ${productDto.hit_yn eq 'n'?'checked':''}> N
<br><br>
진열 여부
<input type="radio" name="display_yn" value="y" ${productDto.display_yn eq 'y'?'checked':''}> Y
<input type="radio" name="display_yn" value="n" ${productDto.display_yn eq 'n'?'checked':''}> N
<br><br>
<input type="submit" value="수정">
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 페이지</title>
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
<h1>상품 등록</h1>
<form action="regist" method="post" enctype="multipart/form-data">
<select name="sub_category_id">
<c:forEach var ="category" items="${list}">
<option value="${category.id}">${category.name}</option>
</c:forEach>
</select>
<br><br>
<input type="text" name="name" placeholder="상품명" required>
<br><br>
<input type="number" name="price" placeholder="가격" required>
<br><br>
사이즈
<br><br>
<input type="checkbox" name="sizes" value="S"> S
<input type="number" value="0">
<br><br>
<input type="checkbox" name="sizes" value="M"> M
<input type="number" value="0">
<br><br>
<input type="checkbox" name="sizes" value="L"> L
<input type="number" value="0">
<br><br>
<input type="checkbox" name="sizes" value="XL"> XL
<input type="number" value="0">

<br><br>
대표이미지(.gif, .jpeg, .png만 등록 가능합니다)
<input type="file" name="main" accept=".gif, .jpeg, .png">
<br><br>
상세이미지(.gif, .jpeg, .png만 등록 가능합니다)
<input type="file" name="details" accept=".gif, .jpeg, .png">
<br><br>
<input type="hidden" name="sale_yn" value="n">
<input type="hidden" name="hit_yn" value="n">
<input type="hidden" name="display_yn" value="n">
<input type="submit" value="등록 요청">
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/admin/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/aside.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정 페이지</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function() {

		$("form").submit(function(e) {
			e.preventDefault();

			$("input[name=sizes]:checked").each(function() {
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
<style>
#content{
	width: 950px;
}
.edit_form{
	margin: auto;
	width: 400px;
}
form > p {
	font-size: 21px;
    line-height: 24px;
    margin-bottom: 24px;
}
.text_input{
	width: 200px;
	height: 25px;
	margin-left: 12px;
	vertical-align: 5px;
}
#submit{
	width: 150px;
	height: 50px;
	margin-left: 100px;
	margin-top: 50px;
	border: 1px solid transparent;
	background-color: #55a0ff;
	color: white;
	line-height: 34px;
	font-size: 17px;
}
</style>
</head>
<body>
	<div id="content">
		<div class="head_tit">
	<h1>상품 수정</h1>
	</div>
	<div class="optionArea">
	<div class="edit_form">
	<form action="edit" method="post" enctype="multipart/form-data">
		<p><input type="hidden" name="id" value="${productDto.id}" class="text_input"> 상품
		카테고리 : ${subcategory} </p>
		<p>상품명 <input type="text" name="name"
			placeholder="${productDto.name}" value="${productDto.name}" class="text_input"></p>
		<p>판매가 <input type="number" name="price" placeholder="가격"
			required value="${productDto.price}" class="text_input"> 원</p>
		<p>사이즈</p>
		<c:forEach var="sizes" items="${list}">
			<input type="checkbox" name="sizes" value="${sizes.sizes}" checked> ${sizes.sizes}
	<input type="number" value="${sizes.quantity}" class="text_input">
	<br>
			<br>
		</c:forEach>
		<input type="file" name="main"
			accept=".gif, .jpeg, .jpg, .png">
		<c:if test="${productDto.mainfile != null}">
			<img
				src="${pageContext.request.contextPath}/product/image?id=${productDto.mainfile}"
				width="100" height="100">
			<input type="hidden" name="mainfile" value="${productDto.mainfile}">
		</c:if>
		<br>
		<br> <input type="file" name="details"
			accept=".gif, .jpeg, .jpg, .png">
		<c:if test="${productDto.detailfile != null}">
			<img
				src="${pageContext.request.contextPath}/product/image?id=${productDto.detailfile}"
				width="100" height="200">
			<input type="hidden" name="detailfile"
				value="${productDto.detailfile}">
		</c:if>
		<br>
		<br> 판매 여부 <input type="radio" name="sale_yn" value="y"
			${productDto.sale_yn eq 'y'?'checked':''}> Y <input
			type="radio" name="sale_yn" value="n"
			${productDto.sale_yn eq 'n'?'checked':''}> N <br>
		<br> 인기상품 표시 여부 <input type="radio" name="hit_yn" value="y"
			${productDto.hit_yn eq 'y'?'checked':''}> Y <input
			type="radio" name="hit_yn" value="n"
			${productDto.hit_yn eq 'n'?'checked':''}> N <br>
		<br> 진열 여부 <input type="radio" name="display_yn" value="y"
			${productDto.display_yn eq 'y'?'checked':''}> Y <input
			type="radio" name="display_yn" value="n"
			${productDto.display_yn eq 'n'?'checked':''}> N <br>
		<br> <input type="submit" value="수정" id="submit">
	</form>
	</div>
	</div>
	</div>
</body>
</html>
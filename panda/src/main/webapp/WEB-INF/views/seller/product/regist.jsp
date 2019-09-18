<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/admin/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/aside.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 페이지</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function() {

		$("form").submit(function(e) {
			e.preventDefault();

			$("input[name=sizes]:checked").each(function() {
				//$(this) : 체크박스
				//$(this).next() : 수량 입력창
				var sizes = $(this).val();
				var count = $(this).next().find('input').val();
				var sum = sizes + "-" + count;
				$(this).val(sum);
			});

			var check = 0;
			$('input[type=checkbox]').each(function() {
				if ($(this).is(':checked')) {
					check++;
				}
			});
			if (check > 0) {
				this.submit();
			} else {
				alert('하나 이상 선택해주세요.')
			}
		});

	});
</script>
<style>
input[type=submit] {
	width: 150px;
	height: 50px;
	border: 1px solid transparent;
	background-color: #55a0ff;
	color: white;
	line-height: 34px;
	font-size: 17px;
	margin-left: 200px;
}

#sub_ctg {
	width: 250px;
	height: 30px;
}

.name_price {
	width: 250px;
	height: 30px;
}

.size {
	width: 150px;
	height: 20px;
}

.regist_form {
	margin: auto;
	width: 600px;
}

#content {
	width: 950px;
}

.select_size {
	vertical-align: 4px;
}
</style>
</head>
<body>
	<div id="content">
		<div class="head_tit">
			<h1>상품 등록</h1>
		</div>
		<div class="optionArea">
			<div class="regist_form">
				<form action="regist" method="post" enctype="multipart/form-data">
					<select name="sub_category_id" id="sub_ctg">
						<c:forEach var="category" items="${list}">
							<option value="${category.id}">${category.name}</option>
						</c:forEach>
					</select> <br> <br> <input type="text" name="name"
						placeholder="상품명" class="name_price" required> <br> <br>
					<input type="number" name="price" placeholder="가격"
						class="name_price" required> <br> <br> 사이즈 <br>
					<br> <input type="checkbox" name="sizes" value="S"><span
						class="select_size"> S <input type="number" value="0"
						class="size"></span> <br> <br> <input type="checkbox"
						name="sizes" value="M"><span class="select_size">
						M <input type="number" value="0" class="size">
					</span> <br> <br> <input type="checkbox" name="sizes" value="L"><span
						class="select_size"> L <input type="number" value="0"
						class="size"></span> <br> <br> <input type="checkbox"
						name="sizes" value="XL"><span class="select_size">
						XL <input type="number" value="0" class="size">
					</span> <br> <br> 대표이미지(.gif, .jpeg, .jpg, .png만 등록 가능합니다) <input
						type="file" name="main" accept=".gif, .jpeg, .jpg, .png"
						required="required"> <br> <br> 상세이미지(.gif,
					.jpeg, .jpg, .png만 등록 가능합니다) <input type="file" name="details"
						accept=".gif, .jpeg, .jpg, .png" required="required"> <br>
					<br> <input type="hidden" name="sale_yn" value="n"> <input
						type="hidden" name="hit_yn" value="n"> <input
						type="hidden" name="display_yn" value="n"> <input
						type="submit" value="등록 요청">
				</form>
			</div>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(function() {
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
	})
})
</script>
<body>
	<form action="delete" method="get">
	<table border="1" width="800">
		<thead>
			<tr>
				<th><input type="checkbox" id="all_check"></th>
				<th>상품명</th>
				<th>판매가</th>
				<th>진열상태</th>
				<th>판매상태</th>
				<th>상품분류</th>
				<th>상품 등록일</th>
				<th>수정</th>
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach var="productSubcategoryDto" items="${list}">
			<tr>
				<td><input type="checkbox"  name="product_id" value=${productSubcategoryDto.product_id } class="sub_check"></td>
				<td>${productSubcategoryDto.product_name}</td>
				<td>${productSubcategoryDto.price}</td>
				<td>${productSubcategoryDto.display_yn}</td>
				<td>${productSubcategoryDto.sale_yn}</td>
				<td>${productSubcategoryDto.category_name} > ${productSubcategoryDto.subcategory_name}</td>
				<td>${productSubcategoryDto.regist_dt}</td>
				<td><a href="edit?id=${productSubcategoryDto.product_id}"><input type="button" value="수정"></a></td>
			</tr>
			</c:forEach>
		</tbody>
		<tfoot>
		</tfoot>
	</table>
	<div>
		<input type="submit" value="삭제">
	</div>
	</form>
</body>
</html>
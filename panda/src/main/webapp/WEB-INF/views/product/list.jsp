<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" width="800">
		<thead>
			<tr>
				<th>체크박스 들어갈 자리</th>
				<th>상품명</th>
				<th>판매가</th>
				<th>진열상태</th>
				<th>판매상태</th>
				<th>상품분류</th>
				<th>상품 등록일</th>
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach var="productDto" items="${list}">
			<tr>
				<td>체크박스 들어갈 자리</td>
				<td>${productDto.name}</td>
				<td>${productDto.price}</td>
				<td>${productDto.display_yn}</td>
				<td>${productDto.sale_yn}</td>
				<td>${productDto.sub_category_id}</td>
				<td>${productDto.regist_dt}</td>
			</tr>
			</c:forEach>
	
		</tbody>
		<tfoot>
	
		</tfoot>
	</table>

</body>
</html>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/template/admin/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/aside.jsp"></jsp:include>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
.fTextsearchBox {
	height: 25px;
}

.btn_edit_delete {
	width: 100px;
	height: 50px;
	border: 1px solid transparent;
	background-color: #55a0ff;
	color: white;
	line-height: 34px;
	font-size: 17px;
}

#delete {
	margin-top: 30px;
}
</style>
<script>
	var page = "${page}";
	var startBlock = "${startBlock}";
	var endBlock = "${endBlock}";

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

		$('#btnSearch').click(function() {
			$('#search_form').trigger('click');
		});

		// 이동 함수
		function move(no) {
			$("input[name=page]").val(no);

			$("#orderSearchForm").submit();
		}

		$(".page_move").click(function(e) {
			e.preventDefault();
			var p = $(this).text();
			move(p);
		});

		$(".page_block").click(function(e) {
			e.preventDefault();
			var p = $(this).text();
			switch (p) {
			case '<':
				move(parseInt(page) - 1);
				break;
			case '<<':
				move(parseInt(startBlock) - 1);
				break;
			case '>':
				move(parseInt(page) + 1);
				break;
			case '>>':
				move(parseInt(endBlock) + 1);
				break;
			}
		});

	})
</script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="${pageContext.request.contextPath}/js/admin/product_search.js"></script>

<body>
	<div id="content">
		<form action="list" method="post" id="orderSearchForm">
			<input name="page" type="hidden">
			<div class="head_tit">
				<h1>상품 목록</h1>
			</div>
			<div class="optionArea">
				<div class="mOption">
					<table border="1" summary="">
						<colgroup>
							<col style="width: 170px;">
							<col style="width: 600px;">
							<col style="width: 170px;">
							<col style="width: auto;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">검색분류</th>
								<td colspan="3">
									<div id="mainSearch">
										<div>
											<select class="fSelect" name="type" style="width: 163px;">
												<option value="product_name"
													${type == 'product_name'?'selected':''}>상품명</option>
												<option value="product_id"
													${type == 'product_id'?'selected':''}>상품번호</option>
											</select> <input type="text" class="fTextsearchBox" name="keyword"
												value="${keyword}" id="searchBox" style="width: 400px;">
											<input type="submit" id="search_form" style="display: none">
											<a href="#none" id="btnSearch" class="btnSearch"><span>검색</span></a>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

			</div>
		</form>

		<div class="section" id="">
			<form action="delete" method="get">
				<div id="searchResultList"
					class="mBoard typeOrder gScroll gCellSingle">
					<table border="1" summary="" class="thead" width="800">
						<thead>
							<tr>
								<th scope="col" class="w24"><input type="checkbox"
									id="all_check"></th>
								<th scope="col" class="w60" style="display: none;">No</th>
								<th scope="col" class="w60" style="">상품번호</th>
								<th scope="col" class="w200" style="">상품명</th>
								<th scope="col" class="w120" style="">판매가</th>
								<th scope="col" class="w100" style="">진열상태</th>
								<th scope="col" class="w100" style="">판매상태</th>
								<th scope="col" class="w200" style="">상품분류</th>
								<th scope="col" class="w250" style="">상품 등록일</th>
								<th scope="col" class="w100 center" style="">수정</th>
							</tr>
						</thead>
						<tbody align="center">
							<c:choose>
								<c:when test="${empty list}">
									<tr>
										<td colspan="10">검색된 상품이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>

									<c:forEach var="productSubcategoryDto" items="${list}">
										<tr>
											<td><input type="checkbox" name="product_id"
												value=${productSubcategoryDto.product_id } class="sub_check"></td>
											<td>${productSubcategoryDto.product_id}</td>
											<td>${productSubcategoryDto.product_name}</td>
											<td><fmt:formatNumber
													value="${productSubcategoryDto.price}" pattern="#,###.##" /></td>
											<td>${productSubcategoryDto.display_yn}</td>
											<td>${productSubcategoryDto.sale_yn}</td>
											<td>${productSubcategoryDto.category_name}>
												${productSubcategoryDto.subcategory_name}</td>
											<td>${productSubcategoryDto.regist_dt}</td>
											<td><a
												href="edit?id=${productSubcategoryDto.product_id}"><input
													type="button" value="수정" class="btn_edit_delete"></a></td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
						<tfoot>
						</tfoot>
					</table>
				</div>
				<input type="submit" value="삭제" class="btn_edit_delete"
					style="margin-top: 20px;">
			</form>
			<div class="paginate">
				<ol>
					<c:if test="${(not (page eq 1))&& not empty page && page>=11}">
						<li><a href="#" class="page_block">&lt;&lt;</a></li>
					</c:if>
					<c:if test="${not (page eq 1) && not empty page}">
						<li><a href="#" class="page_block">&lt;</a></li>
					</c:if>
					<!--페이지 출력 -->
					<c:forEach var="i" begin="${startBlock}" end="${endBlock}">
						<c:choose>
							<c:when test="${page == i}">
								<li class="active_page">${i}</li>
							</c:when>
							<c:otherwise>
								<c:if test="${i>0}">
									<li><a href="#" class="page_move">${i}</a></li>
								</c:if>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${not (page eq pageCount)}">
						<li><a href="#" class="page_block">&gt;</a></li>
					</c:if>
					<c:if test="${(not (page eq pageCount)) && pageCount>=10}">
						<li><a href="#" class="page_block">&gt;&gt;</a></li>
					</c:if>
				</ol>
			</div>
		</div>
	</div>


	<!-- div content 닫는 태그 -->
</body>
</html>
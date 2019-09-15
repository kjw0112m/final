<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/template/admin/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/aside.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		$('#btnSearch').click(function(){
			$('form').submit();
		});
	});
</script>
<form action="" method="get" id="orderSearchForm">

	<div id="content">
		<div class="head_tit">
			<h1>이번 달 수익금 및 판매자 정보</h1>
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
							<th scope="row">검색어</th>
							<td colspan="3">
								<div id="mainSearch">
									<div>
										<select class="fSelect" name="type" style="width: 163px;"
											value="${type}">
											<option value="seller_id"
												${type == 'seller_id'?'selected':''}>아이디</option>
											<option value="seller_name"
												${type == 'seller_name'?'selected':''}>이름</option>
											<option value="nickname"
												${type == 'seller_nickname'?'selected':''}>상점명</option>
										</select> <input type="search" name="keyword" placeholder="검색어"
											required value="${keyword}" class="fText searchBox"
											style="width: 300px;">
									</div>
								</div>
					</tbody>
				</table>
			</div>
			<div class="form_button">
				<a href="#" id="btnSearch" class="btnSearch"><span>검색</span></a> <a
					href="seller" id="btnInit" class="btnSearch reset"><span>초기화</span></a>
			</div>
		</div>
		<div class="section" id="">
			<div class="tab">
				<ul>
					<li class="selected"><a href="search" id="">판매자 목록</a></li>
				</ul>
			</div>

			<div id="searchResultList"
				class="mBoard typeOrder gScroll gCellSingle">
				<table border="1" summary="" class="thead">
					<tbody>
						<tr>
							<th scope="col" class="w45" style="">아이디</th>
							<th scope="col" class="w45" style="">상점명</th>
							<th scope="col" class="w45" style="">이름</th>
							<th scope="col" class="w120" style="">전화번호</th>
							<th scope="col" class="w120" style="">이메일</th>
							<th scope="col" class="w120" style="">수익금</th>
						</tr>
					</tbody>
				</table>
				<c:choose>
					<c:when test="${totalDto.isEmpty()}">
						<table border="1" summary="">
							<tbody class="empty center">
								<tr>
									<td colspan="15">검색된 판매자 내역이 없습니다.</td>
								</tr>
							</tbody>
						</table>
					</c:when>
					<c:otherwise>
						<c:forEach var="totalDto" items="${totalDto}">
							<table border="1">
								<tbody class="right ">
									<tr>
										<td class="w45  center" style="">${totalDto.seller_id}</td>
										<td class="w45 center" style="" bgcolor="">${totalDto.nickname}</td>
										<td class="w45  center" style="">${totalDto.seller_name}</td>
										<td class="w120 center" style="">${totalDto.phone}</td>
										<td class="w120 center" style="">${totalDto.email}</td>
										<td class="w120" style=""><fmt:formatNumber
												value="${totalDto.proceeds}" pattern="#,###.##" /></td>
									</tr>
								</tbody>
							</table>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>

</form>
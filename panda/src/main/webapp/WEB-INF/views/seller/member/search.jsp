<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/admin/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/aside.jsp"></jsp:include>
<script>
	var page = "${page}";
	var startBlock = "${startBlock}";
	var endBlock = "${endBlock}";
	console.log(page)
	console.log(startBlock)
	console.log(endBlock)
</script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="${pageContext.request.contextPath}/js/admin/member_search.js"></script>


<form action="search" method="get" id="orderSearchForm">
	<input type="hidden" name="id">
	<div class="head_tit">
		<h1>전체 회원 목록</h1>
	</div>
	<div id="content">
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
										<select class="fSelect" name="type" style="width: 163px;">
											<option value="choice" disabled>-검색항목선택-</option>
											<option value="id" ${type == 'id'?'selected':''}>아이디</option>
											<option value="email" ${type == 'email'?'selected':''}>이메일</option>
											<option value="name" ${type == 'name'?'selected':''}>이름</option>
											<option value="phone" ${type == 'phone'?'selected':''}>전화번호</option>
										</select>
										<input type="search" name="keyword" placeholder="검색어"
											required value="${keyword}" class="fText searchBox" style="width: 300px;">
									</div>
								</div>
					</tbody>
				</table>
			</div>
			<div class="form_button">
				<input type="submit" id="btnSearch" class="btnSearch" value="검색">
			</div>
		</div>
	

		<div class="section" id="">
			<div class="tab">
				<ul>
					<li class="selected"><a href="search" id="">회원 목록</a></li>
				</ul>
			</div>
			<div id="tabNumber" class="tabCont">
				<div class="rState">
					<div class="left"></div>
					<div class="right">
						<select name="rows" class="fSelect" init_rows="10">
							<option value="10" selected="">10개씩보기</option>
							<option value="20">20개씩보기</option>
							<option value="30">30개씩보기</option>
							<option value="50">50개씩보기</option>
							<option value="100">100개씩보기</option>
							<option value="200">200개씩보기</option>
							<option value="300">300개씩보기</option>
							<option value="500">500개씩보기</option>
						</select>
					</div>
				</div>
				<div id="searchResultList"
					class="mBoard typeOrder gScroll gCellSingle">
					<table border="1" summary="" class="thead">
						<tbody>
							<tr>
								<th scope="col" class="w45" style="">회원 이름</th>
								<th scope="col" class="w45" style="">회원 아이디</th>
								<th scope="col" class="w120" style="">회원 전화 번호</th>
								<th scope="col" class="w120" style="">회원 이메일</th>
								<th scope="col" class="w120" style="">회원 관리</th>
							</tr>
						</tbody>
					</table>
					<c:choose>
						<c:when test="${list.isEmpty()}">
							<table border="1" summary="">
								<tbody class="empty center">
									<tr>
										<td colspan="15">검색된 회원내역이 없습니다.</td>
									</tr>
								</tbody>
							</table>
						</c:when>
						<c:otherwise>
							<c:forEach var="mdto" items="${list}">
							<table border="1">
									<tbody class="right ">
								<tr>
									<td class="w45  center" style="">${mdto.name}</td>
									<td class="w45 center" style="" bgcolor="">${mdto.id}</td>
									<td class="w120 left" style="">${mdto.phone}</td>
									<td class="w120" style="">${mdto.email}</td>
									<td td class="w120" style="">
										<!-- 상세보기 --> <a href="info?id=${mdto.id}"> [상세보기] 
									</a> <!-- 수정 --> <a href="edit?id=${mdto.id}"> [수정]
									</a> <!-- 탈퇴 --> <a
										href="delete?id=${mdto.id}&type=${param.type}&keyword=${param.keyword}">
											[탈퇴]
									</a>
									</td>
								</tr>
							
								</tbody>
								</table>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
				<input name="page" type="hidden">
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
	</div>
</form>

</body>
</html>
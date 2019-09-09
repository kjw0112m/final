<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


 <jsp:include page="/WEB-INF/views/template/admin/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/aside.jsp"></jsp:include>  
 
 
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common2.css">


<!-- 자바스크립트를 이용하여 페이지 이동을 처리 -->
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		//목표 : 페이지 번호를 누르면 해당하는 번호의 페이지로 이동 처리
		//			이동은 form을 전송하는 것으로 대체
		$(".navigator-page").click(function(){
			var p = $(this).text();
			move(p);
		});
		
		//이동 함수
		function move(no){
			//input[name=page]에 no를 설정한 뒤 form을 전송
			$("input[name=page]").val(no);
			$("form").submit();
		}
		
		//select[name=type]인 항목의 값을 선택
		var type = "${param.type}";
		if(type){
			$("select[name=type]").val(type);
		}
	});
	
</script>






<!-- <form class="form" action="oneList" method="get"> -->


<form class="form" action="oneList" method="get" >
	
	<div class="">
		<h1>1:1 문의 </h1>
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
											<option value="title" ${type == 'title'?'selected':''}>제목</option>
											<option value="content" ${type == 'content'?'selected':''}>내용</option>
											<option value="title+content" ${type == 'title+content'?'selected':''}>제목+내용</option>
										</select>
										<input type="search" name="keyword" placeholder="검색어"
											required value="${keyword}" class="fText searchBox" style="width: 300px;">
									</div>
								</div>
					</tbody>
				</table>
			</div>
			<div class="form_button">
				<input type="submit" id="btnSearch777" class="btnSearch777" value="검색">
				
				<a href="${pageContext.request.contextPath}/seller/one/oneList" id="btnSearch"  class="btnSearch"> 초기화</a>
				
<%-- 				<a href="${pageContext.request.contextPath}/seller/notice/noticeList" id="btnInit"  class="btnSearch reset"> 초기화</a>				
 				<a href="${pageContext.request.contextPath}/seller/notice/noticeList" id="btnSearch"  class="btnSearch"> 초기화</a> 
 				<input type="submit" id="btnSearch777" class="btnSearch777" value="왜 안돼"> --%> 
			</div>
		</div>
	

		<div class="section" id="">
			<div class="tab">
				<ul>
					<li class="selected"><a href="search" id="">1:1문의 목록</a></li>
				</ul>
			</div>
			<div id="tabNumber" class="tabCont">
				<div class="rState">
					<div class="left"></div>






<!-- <p>1111111111111111111111111111111111111111111111 </p> -->
















































<!--구 검색 설정 -->

<!-- <form class="form" action="oneList" method="get">
<div style="margin-left: 800px; border: 0px;">
<input type="hidden"  name="type" value="title+content"/>
<input type="search" name="keyword" placeholder="제목 + 내용" required>

<input type="submit" value="검색">
</div>
</form> -->


<br>

<!-- 표 -->

<div id="searchResultList"
					class="mBoard typeOrder gScroll gCellSingle">

<!-- <table class="table  table-hover" width="800"> -->
<table border="1" summary="" class="thead table-hover">
	<colgroup>
	<col width="9%">
	<col width="12%">
	<col width="*">
	<col width="12%">
	<col width="15%">
	<col width="12%">
		<col width="15%">
	</colgroup>
	<thead>
		<tr>
			<th>문의번호</th>
			<th>카테고리</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>답변상태</th>
			<th>관리</th>
		</tr>
	</thead>
	<!-- 게시글 -->
	<tbody align="center">
		<c:choose>
		<c:when test="${empty list }">
			<td colspan="6">1:1문의 내역이 존재하지않습니다.</td>
		</c:when>
		<c:otherwise>
		<c:set var="listCnt" value="0" />
			<c:forEach var="bdto" items="${list}" varStatus="num">
				<c:if test="${sessionScope.sid.toString() eq bdto.memberid or sessionScope.sid.toString().startsWith('!') or sessionScope.sid.toString().startsWith('@')}">
				<c:set var="listCnt" value="${listCnt+1}" />
				<tr>
					<td>${bdto.rn}</td>
					<td>
						<c:choose>
						<c:when test="${bdto.product eq 1}">
							배송지연/불만
						</c:when>
						<c:when test="${bdto.product eq 2}">
							PANDA(무료배송)
						</c:when>
						<c:when test="${bdto.product eq 3}">
							반품문의
						</c:when>
						<c:when test="${bdto.product eq 4}">
							A/S문의
						</c:when>
						<c:when test="${bdto.product eq 5}">
							환불문의
						</c:when>
						<c:when test="${bdto.product eq 6}">
							주문결제문의
						</c:when>
						<c:when test="${bdto.product eq 7}">
							회원정보문의
						</c:when>
						<c:when test="${bdto.product eq 8}">
							취소문의
						</c:when>
						<c:when test="${bdto.product eq 9}">
							교환문의
						</c:when>
						<c:when test="${bdto.product eq 10}">
							상품정보문의
						</c:when>
						<c:when test="${bdto.product eq 11}">
							기타문의
						</c:when>
						<c:otherwise>
						</c:otherwise>
						</c:choose>
					</td>
					<td class="text-left">
<%-- 			상세보기	<a href="contentOne.do?no=${bdto.serviceNo}">           --%>
						<a href="${pageContext.request.contextPath}/seller/one/oneEdit?mode=EDIT&id=${bdto.id}"> 
							${bdto.title}
						</a>
					</td>
					<td>${bdto.memberid}</td>
					<td>${bdto.updatedate}</td>
					<td>
						<c:choose>
						<c:when test="${bdto.state eq 'Y'}">
							Yes
						</c:when>
						<c:otherwise>
							No
						</c:otherwise>
						</c:choose>
					</td>
						<td>
				<!-- 상세보기 --> 
				<a href="${pageContext.request.contextPath}/seller/one/oneEdit?mode=EDIT&id=${bdto.id}"> [답변등록] 
				<a href="${pageContext.request.contextPath}/seller/one/oneEdit?mode=EDIT&id=${bdto.id}"> [상세보기]				
									</td>
					
					
					
					
					</tr>
				</c:if>
			</c:forEach>
			<c:if test="${listCnt eq 0}">
				<td colspan="6">1:1문의 내역이 존재하지않습니다.</td>
			</c:if>
		</c:otherwise>
		</c:choose>
	</tbody>
<%-- 	<!-- 글쓰기 버튼 -->
	<tfoot>
		<tr>
			<td colspan="8" align="right">
				
				
				<a href="${pageContext.request.contextPath}/seller/one/oneEdit">글쓰기</a>
			</td>
		</tr>
	</tfoot> --%>
</table>
</div>





<!-- 네비게이션 + 검색창 -->
<!-- <div class="empty1"></div>

<form class="form" action="oneList" method="get">
<input type="hidden" name="page" value="1">
</form>

<div class="empty"></div>
 -->


				<input name="page" type="hidden">
				<div class="paginate">


<ul class="navigator1">
	<%-- 이전 구간 링크 --%>
	<%-- <c:if test="시작페이지가 1이 아니면"> --%>
	<c:if test="${not (page eq 1)}"> <!-- 1과 같으면 숨겨라  -->
<li><a href="oneList?page=${startBlock}">&lt;&lt;</a></li>
	</c:if>
	
	<%-- <c:if test="현재페이지가 1이 아니면"> --%>
	<c:if test="${not (page eq 1)}">
	<li><a href="oneList?page=${page - 1}">&lt;</a></li>
	</c:if>
	
	<%-- 페이지 출력 --%>
	<c:forEach var="i" begin="${startBlock}" end="${endBlock}">
		<c:choose>
			<c:when test="${page == i}">
				<li class="active">${i}</li>
			</c:when>
			<c:otherwise>
				<li><a href="#" class="navigator-page">${i}</a></li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
	<%-- 다음 페이지 링크(pno + 1) --%>
	<%-- <c:if test="${아닌 현재페이지 == 전체페이지 수}"> --%>
	  <c:if test="${not (page eq pageCount)}"> 
		<li><a href="oneList?page=${page + 1}">&gt;</a></li>
	  </c:if>  
	<%--  <p> ${pageCount }   전체페이지 test 찍어보기 </p> --%>
	
	<%-- 다음 구간 --%>
	<c:if test="${not (page eq pageCount)}">
		<li><a href="oneList?page=${endBlock }">&gt;&gt;</a></li>
	</c:if> 
</ul>

</div> 







<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include> 

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common2.css">


<a  href="${pageContext.request.contextPath}/notice/noticeList">공지사항<i id=gi></i></a>
&&&
<a  href="${pageContext.request.contextPath}/board/listOne">1:1 문의 <i id=gi></i></a>
&&&
<a  href="${pageContext.request.contextPath}/review/reviewComment">상품후기 <i id=gi></i></a>

<!-- <form class="form" action="list.do" method="get"> -->
<!-- <div style="margin-left: 600px; border: 0px;"> -->
<!-- <input type="hidden"  name="type" value="title+content"/> -->
<!-- <input type="search" name="keyword" placeholder="제목 + 내용" required> -->

<!-- <input type="submit" value="검색"> -->
<!-- </div> -->
<!-- </form> -->

<br>
<!-- 표 -->
<table class="table  table-hover" width="800">
	<colgroup>
	<col width="10%">
	<col width="10%">
	<col width="*">
	<col width="10%">
	<col width="15%">
	<col width="10%">
	</colgroup>
	<thead>
		<tr>
			<th>번호</th>
			<th>카테고리</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>답변상태</th>
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
							컬리패스(무료배송)
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
						<a href="${pageContext.request.contextPath}/one/oneEdit?mode=EDIT&id=${bdto.id}"> 
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
					</tr>
				</c:if>
			</c:forEach>
			<c:if test="${listCnt eq 0}">
				<td colspan="6">1:1문의 내역이 존재하지않습니다.</td>
			</c:if>
		</c:otherwise>
		</c:choose>
	</tbody>
	<!-- 글쓰기 버튼 -->
	<tfoot>
		<tr>
			<td colspan="8" align="right">
				
				
				<a href="${pageContext.request.contextPath}/one/oneEdit">글쓰기</a>
			</td>
		</tr>
	</tfoot>
</table>

<!-- 네비게이션 + 검색창 -->

<div class="empty"></div>



<div class="empty"></div>

<ul class="navigator">
	<%-- 이전 구간 링크 --%>
	<c:if test="${not p.isFirstBlock()}">
	<li><a href="list.do?${p.getPrevBlock()}">&lt;&lt;</a></li>
	</c:if>
	
	<%-- 이전 페이지 링크(pno - 1) --%>
	<c:if test="${not p.isFirstPage()}">
	<li><a href="list.do?${p.getPrevPage()}">&lt;</a></li>
	</c:if>
	
	<%-- 페이지 출력 --%>
	<c:forEach var="i" begin="${p.startBlock}" end="${p.endBlock}">
		<c:choose>
			<c:when test="${p.isCurrentPage(i)}">
				<li class="active">${i}</li>
			</c:when>
			<c:otherwise>
				<li><a href="list.do?${p.getPage(i)}">${i}</a></li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
	<%-- 다음 페이지 링크(pno + 1) --%>
	<c:if test="${not p.isLastPage()}">
		<li><a href="list.do?${p.getNextPage()}">&gt;</a></li>
	</c:if>
	
	<%-- 다음 구간 --%>
	<c:if test="${not p.isLastBlock()}">
		<li><a href="list.do?${p.getNextBlock()}">&gt;&gt;</a></li>
	</c:if>
</ul>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>





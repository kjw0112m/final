<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include> 

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common2.css">


<jsp:include page="/WEB-INF/views/notice/boardh.jsp"></jsp:include>



<div id="ha2">
<h2 >1:1문의 </h2>
</div>


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


<div id="ha2">
<form class="form" action="oneList" method="get">
<div style="margin-left: 800px; border: 0px;">
<input type="hidden"  name="type" value="title+content"/>
<input type="search" name="keyword" placeholder="제목 + 내용" required>

<input type="submit" value="검색">
</div>
</form>
</div>

<br>

<!-- 표 -->
<table class="table  table-hover" width="800">
	<colgroup>
	<col width="10%">
	<col width="20%">
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
<div id="ha2"><!--가운데 정렬   -->


<div class="empty1"></div>

<form class="form" action="oneList" method="get">
<input type="hidden" name="page" value="1">
</form>

<div class="empty"></div>

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
<%-- 	 <p> ${pageCount }   전체페이지 test 찍어보기 </p> --%>
	
	<%-- 다음 구간 --%>
	<c:if test="${not (page eq pageCount)}">
		<li><a href="oneList?page=${endBlock }">&gt;&gt;</a></li>
	</c:if> 
	

	
</ul>

</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>





<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<jsp:include page="/WEB-INF/views/template/admin/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/admin/aside.jsp"></jsp:include>  

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common2.css">


<!-- 공지사항 시작 -->


<a  href="${pageContext.request.contextPath}/notice/noticeList">공지사항<i id=gi></i></a>
&&&
<a  href="${pageContext.request.contextPath}/one/oneList">1:1 문의 <i id=gi></i></a>
&&&
<a  href="${pageContext.request.contextPath}/review/reviewComment">상품후기 <i id=gi></i></a>

<!-- <form class="form" action="list.do" method="get">
<div style="margin-left: 800px; border: 0px;">
<input type="hidden"  name="type" value="title+content"/>
<input type="search" name="keyword" placeholder="제목 + 내용" required>

<input type="submit" value="검색">
</div>
</form> -->




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

<br>
<!-- 표 -->

<table class="table  table-hover" width="800">
	<!-- 제목 -->
	<colgroup>
	<col width="10%">
	<col width="*">
	<col width="10%">
	<col width="10%">
	<col width="10%">
	</colgroup>
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="list" items="${list}" >
			<tr>
				<td align="center">${list.rn}</td>
				<td align="left"><a href="${pageContext.request.contextPath}/notice/noticeEdit?mode=EDIT&id=${list.id}">${list.title}</a></td>
				<td align="center">${list.createUser}</td>
				<td align="center">${list.createdate}</td>
				<td align="center">${list.readCount}</td>
			</tr>
		</c:forEach>
	</tbody>
	<c:if test="${sessionScope.sid.toString().startsWith('!')}">
		<tfoot>
				<tr>
					<td colspan="8" align="right">
					<%-- <c:if test="${grade eq '관리자' }"> --%>
						<a href="${pageContext.request.contextPath}/notice/noticeEdit">글쓰기</a>
					<%-- </c:if> --%>
					</td>
				</tr>
		</tfoot>
	</c:if>
</table>

<!-- 네비게이션 + 검색창 -->

<div class="empty1"></div>

<form class="form" action="noticeListA" method="get">
<input type="hidden" name="page" value="1">
</form>

<div class="empty"></div>

<ul class="navigator1">
	<%-- 이전 구간 링크 --%>
	<%-- <c:if test="시작페이지가 1이 아니면"> --%>
	<c:if test="${not (page eq 1)}"> <!-- 1과 같으면 숨겨라  -->
<li><a href="noticeListA?page=${startBlock}">&lt;&lt;</a></li>
	</c:if>
	
	<%-- <c:if test="현재페이지가 1이 아니면"> --%>
	<c:if test="${not (page eq 1)}">
	<li><a href="noticeListA?page=${page - 1}">&lt;</a></li>
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
		<li><a href="noticeListA?page=${page + 1}">&gt;</a></li>
	  </c:if>  
	 <p> ${pageCount }   전체페이지 test 찍어보기 </p>
	
	<%-- 다음 구간 --%>
	<c:if test="${not (page eq pageCount)}">
		<li><a href="noticeListA?page=${endBlock }">&gt;&gt;</a></li>
	</c:if> 
</ul>
<!-- 공지사항 끝 -->
   